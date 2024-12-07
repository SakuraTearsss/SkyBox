::使用方法：call chk_connect_by_SYXZ.bat [system recovery fastboot sideload edl all] rechk(可选)
::
::规则：
::
::- 1.只允许一个设备连接
::- 2.检查直到成功为止，不成功不退出
::
::输入：
::
::- 第一个参数是需要检查的模式。可选参数有：system（开机），recovery（TWRP），fastboot，sideload（adb sideload即adb线刷），如果开启检查端口功能还可以选择edl（高通9008深度刷机模式）。
::  all指的是检查以上可以检查的所有模式，检查到任意一个则结束，并输出结果。适用于进入多个模式均可的情况。
::- 第二个参数是是否复查。这是可选项，如果填rechk则会在首次检查到连接后，等待指定时间并再次检查，如果只需要检查一次，不填这个参数即可。在设备有可能连接不稳定时，可以使用rechk减少中途断开的风险。
::
::输出：
::
::- %chk_connect_devstate%   设备当前所处状态
::- %chk_connect_edlport%    如果选择检查edl模式则会输出端口（比如：COM6）
::
::示例：
::
::- 检查fastboot连接：call chk_connect_by_SYXZ.bat fastboot
::- 检查recovery连接并复查：call chk_connect_by_SYXZ.bat recovery rechk
::
::已知BUG：
::
::- 1.检查adb类连接时，当有一个(或多个)正常设备和一个(或多个)unauthorized(开机未授权)状态设备同时连接时，会错误地通过检查。
::- 2.检查adb类连接时，当有一个(或多个)正常设备和一个(或多个)offline(离线)状态设备同时连接时，会错误地通过检查。这常见于安装有wsa(安卓子系统)的Windows系统上，因为wsa可能会作为adb设备被检查到。
::- 3.本模块不会暴力kill adb，不和其他adb工具抢adb，所以有其他adb工具运行时，本模块无法正常运行。


@ECHO OFF

::
::以下是配置，根据需要自行修改
::

::最大尝试次数：调用一次模块，最多尝试检查多少次，超过次数则暂停检查
set chk_connect_try_max=30
::复查等待时间：如果使用rechk，则第一次检查之后等待几秒再进行第二次检查
set chk_connect_rechk_wait=1
::是否启用端口检查功能：如果启用，则可以检查端口。但需要devcon.exe文件
set chk_connect_chkport=y
::adb.exe文件位置
set chk_connect_adbpath=.\adb.exe
::fastboot.exe文件位置
set chk_connect_fbpath=.\fastboot.exe
::devcon.exe文件位置（如果没有启用端口检查功能则不需要此文件，也不需要填写这个路径）
set chk_connect_dcpath=.\devcon.exe

::
::以下是脚本
::

::自检
if "%chk_connect_try_max%"=="" ECHO.chk_connect_try_max 未定义！ & pause>nul & EXIT
if "%chk_connect_rechk_wait%"=="" ECHO.chk_connect_rechk_wait 未定义！ & pause>nul & EXIT
if "%chk_connect_chkport%"=="" ECHO.chk_connect_chkport 未定义！ & pause>nul & EXIT
if "%chk_connect_adbpath%"=="" ECHO.chk_connect_adbpath 未定义！ & pause>nul & EXIT
if "%chk_connect_fbpath%"=="" ECHO.chk_connect_fbpath 未定义！ & pause>nul & EXIT
if "%chk_connect_chkport%"=="y" (if "%chk_connect_dcpath%"=="" ECHO.chk_connect_dcpath 未定义！ & pause>nul & EXIT)
if not exist %chk_connect_adbpath% ECHO.指定的adb.exe文件路径（%chk_connect_adbpath%）不存在！ & pause>nul & EXIT
if not exist %chk_connect_fbpath% ECHO.指定的fastboot.exe文件路径（%chk_connect_fbpath%）不存在！ & pause>nul & EXIT
if "%chk_connect_chkport%"=="y" (if not exist %chk_connect_dcpath% ECHO.指定的devcon.exe文件路径（%chk_connect_dcpath%）不存在！ & pause>nul & EXIT)
if "%1"=="" ECHO.缺少第一个参数！ & pause>nul & EXIT
if not "%chk_connect_chkport%"=="y" (if "%1"=="edl" ECHO.未开启端口检查功能，无法检查 %1 模式！ & pause>nul & EXIT)
if "%2"=="rechk" (set chk_connect_rechk=y) else (set chk_connect_rechk=n)
::开始
:CHK-CONNECT-1
ECHO.正在检查设备连接(%1)... & set chk_connect_try_times=0& set chk_connect_devnum=0& set chk_connect_devstate=blank& adb devices 1>nul
:CHK-CONNECT-2
::检查单个设备连接，得到chk_connect_devnum和chk_connect_devstate
if "%1"=="system" for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "	device"') do set chk_connect_devnum=%%a
if "%1"=="recovery" for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "recovery"') do set chk_connect_devnum=%%a
if "%1"=="fastboot" for /f %%a in ('%chk_connect_fbpath% devices ^| find /c "fastboot"') do set chk_connect_devnum=%%a
if "%1"=="sideload" for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "sideload"') do set chk_connect_devnum=%%a
if "%1"=="edl" for /f %%a in ('%chk_connect_dcpath% find usb* ^| find /c "QDLoader"') do set chk_connect_devnum=%%a
if not "%1"=="all" set chk_connect_devstate=%1& goto CHK-CONNECT-4
::检查所有设备连接，得到总chk_connect_devnum和chk_connect_devstate
for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "	device"') do set chk_connect_devnum1=%%a
    if "%chk_connect_devnum1%"=="1" set chk_connect_devstate=system
for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "recovery"') do set chk_connect_devnum2=%%a
    if "%chk_connect_devnum2%"=="1" set chk_connect_devstate=recovery
for /f %%a in ('%chk_connect_fbpath% devices ^| find /c "fastboot"') do set chk_connect_devnum3=%%a
    if "%chk_connect_devnum3%"=="1" set chk_connect_devstate=fastboot
for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "sideload"') do set chk_connect_devnum4=%%a
    if "%chk_connect_devnum4%"=="1" set chk_connect_devstate=sideload
if not "%chk_connect_chkport%"=="y" goto CHK-CONNECT-3
for /f %%a in ('%chk_connect_dcpath% find usb* ^| find /c "QDLoader"') do set chk_connect_devnum5=%%a
    if "%chk_connect_devnum5%"=="1" set chk_connect_devstate=edl
:CHK-CONNECT-3
set /a chk_connect_devnum=%chk_connect_devnum1%+%chk_connect_devnum2%+%chk_connect_devnum3%+%chk_connect_devnum4%+%chk_connect_devnum5%
goto CHK-CONNECT-4
::完成后，检查（总）设备数
:CHK-CONNECT-4
set /a chk_connect_try_times+=1
if "%chk_connect_devnum%"=="0" (
    if %chk_connect_try_times% GEQ %chk_connect_try_max% ECHO.本次未检测到目标设备，按任意键重新检测... & pause>nul & goto CHK-CONNECT-1
    TIMEOUT /T 1 /NOBREAK>nul & goto CHK-CONNECT-2)
if %chk_connect_devnum% GTR 1 ECHO.有多个设备连接！请断开其他设备。按任意键重新检测... & pause>nul & goto CHK-CONNECT-1
::设备数是1，可以继续，需要复查则复查
if "%chk_connect_rechk%"=="y" (
    set chk_connect_rechk=n
    ECHO.%chk_connect_rechk_wait%秒后将再次检查，请稍候... & TIMEOUT /T %chk_connect_rechk_wait% /NOBREAK>nul & goto CHK-CONNECT-1)
::无需复查，涉及端口则检查端口号
if "%chk_connect_devstate%"=="edl" for /f "tokens=2 delims=()" %%i in ('%chk_connect_dcpath% find usb* ^| find "Qualcomm HS-USB QDLoader 9008"') do set chk_connect_edlport=%%i
::结束
ECHO.设备已连接（%chk_connect_devstate%）！
goto :eof
