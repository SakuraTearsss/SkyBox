::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHzeyHYfBzdofw+bA0m1HooKvKao0+iOrC0=
::fBE1pAF6MU+EWHzeyHYfBzdofw+bA0m1HooKvKao08eGpUQOX4I=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHGR9VU1ITZbWgGmPX+7OoAP7fro029qTMnFjt4PcYzPz6aLM9wg6VfhcJg+3nVOi/cAAxxXMBuoYW8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJkZk00
::ZQ05rAF9IBncCkqN+0xwdVsAAlLi
::ZQ05rAF9IAHYFVzEqQIDIwJ2Qxzi
::eg0/rx1wNQPfEVWB+kM9LVsJDDeJJUm1HtU=
::fBEirQZwNQPfEVWB+kM9LVsJDDeJJUm1HtU=
::cRolqwZ3JBvQF1fEqQK08PvQlM4Hwog/+muZOAd+OC8CR5p9
::dhA7uBVwLU+EWGqF/1ciKS9RTRaRXA==
::YQ03rBFzNR3SWATEx0M7PQlVeAGDLnja
::dhAmsQZ3MwfNWATEx0M7PQlVeAGDLnja
::ZQ0/vhVqMQ3MEVWAtB9wGxpfWRaDCG67FKZ8
::Zg8zqx1/OA3MEVWAtB9wGxpfWRaDCG67FKZ8
::dhA7pRFwIByZRRm39UklOhpgSQWQLws=
::Zh4grVQjdCqDJG2r224MGxBNcyaNJFSsUvtP1Nvw9siIunILAKxpNorD39Q=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
:version
REM 设置当前软件版本
set "current_version=4.6"

REM 设置云端版本文件的URL
set "url=https://gitee.com/midstream-dream/sky_box/raw/master/version"

REM 设置临时文件路径
set "temp_file=%TEMP%\version.txt"

REM 下载云端的版本文件
echo 正在从云端下载最新版本信息...
echo.
echo 第一次进行此过程可能较慢，请耐心等待...
echo.
curl -s -o "%temp_file%" "%url%"

REM 以下部分代码保持不变，省略重复展示

REM 检查下载是否成功
if %errorlevel% neq 0 (
    echo 下载版本信息失败，请检查网络连接或稍后再试。
    echo.
    Echo 按下任意键退出脚本...
    pause >nul
    exit /b
)

REM 从下载的文件中读取最新版本号
for /f "delims=" %%i in ('type "%temp_file%"') do set "latest_version=%%i"

REM 清理临时文件
del "%temp_file%"

REM 打印当前版本和最新版本信息
echo 当前软件版本: %current_version%
echo 云端最新版本: %latest_version%

REM 比较版本号
if %current_version% LSS %latest_version% (
    echo.
    echo 发现新版本，请更新你的软件。
    start https://skybox.mom/工具箱
    pause
    exit /b
) else (
    echo 你正在的已是最新版本。
    echo.
    ECHO.按下任意键前往主菜单...
    pause >nul
    goto first
)








:first
CLS
::此处填写你的软件标识
set APP_ID=4G6M4X1J3D5W1I2T
::这是获取公告的API
set API_URL_Announcement=http://api.1wxyun.com/?type=1
::这是卡密验证的API
set  API_URL_Card=http://api.1wxyun.com/?type=17
::这是用户转绑的API
set API_URL_Unbinding=http://api.1wxyun.com/?type=14
::这是查询卡密到期时间的API
set API_URL_chaxun=http://api.1wxyun.com/?type=24
echo 公告:
ECHO.---------------------------------------------------------------
curl -X POST "%API_URL_Announcement%" -d "Softid=%APP_ID%"
ECHO.
ECHO.---------------------------------------------------------------
ECHO.
echo 1.验证卡密
echo 2.查询卡密到期时间
echo 3.解绑卡密
set /p input=输入选项：
if %input%==1 goto yanzheng
if %input%==2 goto card
if %input%==3 goto unbind
goto first



:unbind
ECHO.
set /p card_NUM=请输入卡密：
set post_unbind="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd=&Type=1"
curl -X POST "%API_URL_Unbinding%" -d %post_unbind%
echo.
pause
goto first





:card
ECHO.
set /p card_NUM=请输入卡密：
echo.
echo.
ECHO 卡密到期时间：
set post_card="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd="
curl -s -X POST "%API_URL_chaxun%" -d %post_card%
ECHO.
pause >nul
ECHO 按下任意键返回验证
goto first















:yanzheng
ECHO.
::定义变量
set /p card_NUM=请输入卡密：
set post_data="Softid=%APP_ID%&Card=%card_NUM%&Version=1.0"
set post_curl=curl 
set post_s=-s 
set post_X=-X 
set post_d=POST 
set post_API="%API_URL_Card%" 
set post_d2=-d 

set response=%post_curl%%POST_s%%post_X%%post_d%%post_API%%post_d2%%post_data%
::此处检测返回的Token值的开头是否为大写字母，如果不是则认为验证失败
echo & %response% | findstr "^[A-Z]" >nul
if errorlevel 1 (
    echo 验证失败，返回的错误码是：
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    ECHO.请查看错误码对照！
    pause
    start https://skybox.mom/工具箱/错误码对照.txt
    pause
    goto first
) else (

    echo.& %response%
    echo 验证成功，返回的Token是：
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    pause
    goto start
)
pause





::-----------------------------------------------------以下为工具箱

:start
CLS
chcp 936>nul
cd /d %~dp0
if exist bin (cd bin) else (ECHO.找不到bin & goto Download)
::加载配置,如果有自定义的配置文件也可以加在下面
if exist conf\fixed.bat (call conf\fixed) else (ECHO.找不到conf\fixed.bat & goto FATAL)
if exist conf\user.bat call conf\user
if exist conf\write.bat (call conf\write) else (ECHO.找不到conf\write.bat & goto FATAL)
::设置颜色变量

::红色
set "RED=[1;31m"
::绿色
set "GREEN=[1;32m"
::黄色
set "YELLOW=[1;33m"
::蓝色
set "BLUE=[1;34m"
::紫色
set "PURPLE=[1;35m"
::青色
set "CYAN=[1;36m"
::白色
set "WHITE=[1;37m"
::清除颜色变量
set "NC=[0m"
::粗体
set "BOLD=[1m"
::下划线
set "UNDERLINE=[4m"
::反显
set "REVERSE=[7m"
::黑色
set "BLACK=[1;30m"
::灰色
set "GRAY=[1;30m"
::亮红色
set "LIGHTRED=[1;31m"
::亮绿色
set "LIGHTGREEN=[1;32m"
::亮黄色
set "LIGHTYELLOW=[1;33m"

:MENU
CLS
mode con cols=85 lines=57
ECHO.%BLUE%
type logo.txt
ECHO.
ECHO.
cd /d bin\chkdev
call chk_connect.bat all



CLS
CD /d bin
ECHO.
ECHO.%BLUE%
type logo.txt
ECHO.
ECHO.
ECHO.
ECHO.%GREEN%你的设备当前正处于:%chk_connect_devstate%
cd /d bin
ECHO.
ECHO.%PURPLE%              【1】一键半自动ROOT           【2】快捷重启      
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%CYAN%              【3】检测设备链接             【4】ADB命令行   
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%RED%              【5】刷入任意分区             【6】MTK强解BL
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%YELLOW%              【7】ADB激活软件              【8】云端BOOT库 
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%LIGHTGREEN%A.赞助我们        B.捐赠        C.刷新
echo.%WHITE%
call choice common [1][2][3][4][5][6][7][8][A][B][C]#[C]
if %choice%==1 goto root
if %choice%==2 goto REBOOT
if %choice%==3 goto check
if %choice%==4 goto ADB
if %choice%==5 goto flash
if %choice%==6 goto BL
if %choice%==7 goto ADB_activation
if %choice%==8 start https://skybox.mom/BOOT%E5%BA%93(%E5%A4%87%E7%94%A8)
if %choice%==A start https://gitee.com/midstream-dream/coke/raw/master/mm_facetoface_collect_qrcode_1725726673771.png
if %choice%==B goto 
if %choice%==C CLS
goto MENU




:about
mode con cols=90
curl -k https://gitee.com/midstream-dream/coke/raw/master/writer
pause>nul
goto MENU


:check
CLS
call chk_connect.bat all
ECHO.%GREEN%你的设备当前正处于:%chk_connect_devstate%
Pause
goto MENU






:root
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.选择安卓版本
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.出厂安卓13
ECHO.2.出厂非安卓13(后续升级到13也选这个)
ECHO.A.返回主菜单
set /p choice=请输入序号:
if "%choice%"=="1" set "fall=init_boot" & goto ROOT1
if "%choice%"=="2" set "fall=boot" & goto ROOT1
if "%choice%"=="A" goto MENU
goto MENU
:ROOT1
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.选择ROOT方案
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.Magisk
ECHO.2.APATCH
ECHO.A.返回主菜单
set /p choice=请输入序号:
if %choice%==1 goto Magisk
if %choice%==2 goto APATCH
if %choice%==A goto MENU
goto MENU



:magisk
CLS
del stock_boot.img >nul 2>nul
del ramdisk.cpio >nul 2>nul
del dtb >nul 2>nul
del kernel >nul 2>nul
del kernel_dtb  >nul 2>nul
set KEEPVERITY=false
set KEEPFORCEENCRYPT=false
cd /d %~dp0
set /p bootPath="请把要刷入的文件拖到此处或输入路径: "
set "Path=bin;%Path%"
set /p aa=是否是64位设备? (Y/N)
if /i "%aa%"=="Y" (
    set IS64BIT=true
    echo -- 是64位
) else (
    set IS64BIT=false
    echo -- 不是64位
)
echo.
busybox ash bin\boot_patch.sh %bootPath% %IS64BIT% %KEEPVERITY% %KEEPFORCEENCRYPT%
del stock_boot.img >nul 2>nul
del ramdisk.cpio >nul 2>nul
del dtb >nul 2>nul
del kernel >nul 2>nul
del kernel_dtb  >nul 2>nul
if exist %~dp0new-boot.img (
    move new-boot.img Magisk-boot.img
)
::开始刷入
ECHO.
ECHO.请先将设备重启到fastboot
cd /d "bin\ADB"
ECHO.
ECHO.弹出两个OKAY即为成功
fastboot flash "%fall%" "%~dp0Magisk-boot.img"
del "%~dp0Magisk-boot.img" 2>nul
ECHO.是否将设备重启?
cd /d bin\ADB
ECHO.1.是   2.否   A.返回主菜单
set /p choice=请输入序号:
if %choice%==1 fastboot reboot
if %chhoice%==2 goto MENU
if %choice%==A goto MENU
goto MENU




:APATCH
cd /d bin\ApatchPatch
del "new-boot.img" >nul 2>&1
del "kernel" >nul 2>&1
del "kernel-b" >nul 2>&1
del "ramdisk.cpio" >nul 2>&1
SETLOCAL ENABLEDELAYEDEXPANSION
:: 定义工具所在的路径，确保是绝对路径
set "TOOL_PATH=bin\ApatchPatch\"
:: 确保TOOL_PATH变量正确
if not exist "!TOOL_PATH!magiskboot.exe" (
    echo 工具路径不正确，找不到magiskboot.exe。
    pause
    goto MENU
)
set /p bootPath="请把要BOOT文件拖到此处或输入路径(目前APATCH只支持boot不支持init_boot): "
echo.请输入你的超级密钥%RED%(一定要记住密钥!)：
ECHO.%WHITE%
set /p "superKey="
:: 使用绝对路径调用工具
set "magiskboot=%TOOL_PATH%magiskboot.exe"
set "kptools=%TOOL_PATH%kptools-x86_64-win.exe":: 切换到工具目录
pushd "!TOOL_PATH!"
:: 解包boot.img到magiskboot所在目录
echo 正在解包boot.img到 %TOOL_PATH%...
"!magiskboot!" unpack "!bootPath!"
if errorlevel 1 (
    echo 解包失败，请检查magiskboot工具是否可用。
    popd
    pause
    exit /b
)
:: 检查并重命名解包后的kernel文件
if exist "kernel" (
    echo 正在重命名kernel文件为kernel-b...
    ren "kernel" "kernel-b"
    if errorlevel 1 (
        echo 重命名失败。
        popd
        pause
        exit /b
    )
) else (
    echo 解压后的kernel文件不存在。
    popd
    pause
    exit /b
)
:: 修补内核
echo 修补内核...
"!kptools!" -p --image "kernel-b" --skey="!superKey!" --kpimg "kpimg-android" --out "kernel"
if errorlevel 1 (
    echo 修补内核失败，请检查kptools工具是否可用。
    popd
    pause
    exit /b
)
:: 重新打包boot.img
echo 重新打包boot.img...
"!magiskboot!" repack "!bootPath!"
if errorlevel 1 (
    echo 重新打包失败，请检查magiskboot工具是否可用。
    popd
    pause
    exit /b
)
:: 清理临时文件
echo 正在清理临时文件...
del "kernel" 2>nul
del "kernel-b" 2>nul
del "ramdisk.cpio" 2>nul
echo 清理完成。
:: 退出工具目录
popd
:: 完成信息
ECHO.修补完成按下任意键刷入...
pause >nul
goto flash_apatch
:flash_apatch
CLS
cd /d bin\ApatchPatch
ECHO.请先将设备重启到fastboot
fastboot flash boot new-boot.img
ECHO.
ECHO.出现两个OKAY即为成功
pause
ECHO.是否重启手机?
ECHO.1.重启
ECHO.2.返回主菜单
call choice common [1][2]#[2]
if %choice%==1 fastboot REBOOT
if %choice%==2 goto MENU













:REBOOT
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.reboot.bat 重启
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.请选择要进入的模式:
ECHO.1.system
ECHO.2.recovery
ECHO.3.sideload
ECHO.4.fastboot
ECHO.5.fastbootd
set /p choice=请输入序号:
if "%choice%"=="1" set target=system
if "%choice%"=="2" set target=recovery
if "%choice%"=="3" set target=sideload
if "%choice%"=="4" set target=fastboot
if "%choice%"=="5" set target=fastbootd
if "%choice%"=="6" set target=edl
if "%choice%"=="7" set target=diag901d
call chkdev all rechk 1
cd /d bin\chkdev
ECHO.进入%target%模式... & call chk_reboot all

ECHO.完成.按任意键返回主菜单...& pause>nul & goto MENU




:ADB
CLS
CD /d bin\ADB
CMD




:flash
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.刷入任意分区
ECHO.=--------------------------------------------------------------------=
cd /d "bin\ADB"
set /p path="请输入要刷入的分区: "
set /p file="请输入或拖入要刷入的文件映像: "
echo 刷入错误的映像可能导致你的设备变砖，请谨慎操作！若操作失败作者不负任何责任!
echo 请先将设备重启到fastboot
Pause
fastboot flash %path% %file%
if errorlevel 1 (
    echo 刷入失败
) else (
    echo 刷入成功
)
Pause
goto MENU
















:ADB_ACTIVE
CLS
cd /d "bin\ADB"
ECHO.请选择你要激活的软件:
ECHO.1.shizuku   2.小黑屋
ECHO.3.黑域      4.空调狗(慎重!)
ECHO.5.冰箱(Ice Box)  6.返回主菜单
set /p choice=请输入序号:
if "%choice%"=="1" adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh
if "%choice%"=="2" adb shell sh /storage/emulated/0/Android/data/web1n.stopapp/files/starter.sh
if "%choice%"=="3" adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh
if "%choice%"=="4" adb shell dpm set-device-owner me.yourbay.airfrozen/.main.core.mgmt.MDeviceAdminReceiver
if "%choice%"=="5" adb shell sh /sdcard/Android/data/com.catchingnow.icebox/files/start.sh
if "%choice%"=="6" goto MENU
goto MENU




:Download
CLS
ECHO.草拟吗b你没解压
ECHO.草拟吗b你没解压
ECHO.草拟吗b你没解压
ECHO.草拟吗b你没解压
ECHO.傻逼,你不会解压刷什么机
pause








:BL
CLS
:first_BL
CLS
::此处填写你的软件标识
set APP_ID=4G0R3Y7V6M4L1B3U
::这是获取公告的API
set API_URL_Announcement=http://api.1wxyun.com/?type=1
::这是卡密验证的API
set  API_URL_Card=http://api.1wxyun.com/?type=17
::这是用户转绑的API
set API_URL_Unbinding=http://api.1wxyun.com/?type=14
::这是查询卡密到期时间的API
set API_URL_chaxun=http://api.1wxyun.com/?type=24
echo 公告:
ECHO.---------------------------------------------------------------
curl -X POST "%API_URL_Announcement%" -d "Softid=%APP_ID%"
ECHO.
ECHO.---------------------------------------------------------------
ECHO.
echo 1.验证卡密
echo 2.查询卡密到期时间
echo 3.解绑卡密
echo 4.返回主菜单
set /p input=输入选项：
if %input%==1 goto yanzheng_BL
if %input%==2 goto card
if %input%==3 goto unbind
if %input%==4 goto MENU
goto first



:unbind_BL
ECHO.
set /p card_NUM=请输入卡密：
set post_unbind="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd=&Type=1"
curl -X POST "%API_URL_Unbinding%" -d %post_unbind%
echo.
pause
goto first





:card_BL
ECHO.
set /p card_NUM=请输入卡密：
echo.
echo.
ECHO 卡密到期时间：
set post_card="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd="
curl -s -X POST "%API_URL_chaxun%" -d %post_card%
ECHO.
pause >nul
ECHO 按下任意键返回验证
goto first_BL















:yanzheng_BL
ECHO.
::定义变量
set /p card_NUM=请输入卡密：
set post_data="Softid=%APP_ID%&Card=%card_NUM%&Version=1.0"
set post_curl=curl 
set post_s=-s 
set post_X=-X 
set post_d=POST 
set post_API="%API_URL_Card%" 
set post_d2=-d 

set response=%post_curl%%POST_s%%post_X%%post_d%%post_API%%post_d2%%post_data%
::此处检测返回的Token值的开头是否为大写字母，如果不是则认为验证失败
echo & %response% | findstr "^[A-Z]" >nul
if errorlevel 1 (
    echo 验证失败，返回的错误码是：
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    ECHO.请查看错误码对照！
    pause
    start https://skybox.mom/工具箱/错误码对照.txt
    pause
    goto first
) else (

    echo.& %response%
    echo 验证成功，返回的Token是：
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    pause
    goto BL_main
)
pause


:BL_main
ECHO.=----------------------------------------------------------=
ECHO.解锁BootLoader
ECHO.=----------------------------------------------------------=
ECHO.
cd /d bin
mtk payload
mtk da seccfg unlock
ECHO.若解锁完成后出现开机出现小字无法进入系统，请按住开机键直至系统重新启动。
ECHO.按下任意键返回主菜单
pause >nul
goto MENU
