::ʹ�÷�����call chk_connect_by_SYXZ.bat [system recovery fastboot sideload edl all] rechk(��ѡ)
::
::����
::
::- 1.ֻ����һ���豸����
::- 2.���ֱ���ɹ�Ϊֹ�����ɹ����˳�
::
::���룺
::
::- ��һ����������Ҫ����ģʽ����ѡ�����У�system����������recovery��TWRP����fastboot��sideload��adb sideload��adb��ˢ��������������˿ڹ��ܻ�����ѡ��edl����ͨ9008���ˢ��ģʽ����
::  allָ���Ǽ�����Ͽ��Լ�������ģʽ����鵽����һ������������������������ڽ�����ģʽ���ɵ������
::- �ڶ����������Ƿ񸴲顣���ǿ�ѡ������rechk������״μ�鵽���Ӻ󣬵ȴ�ָ��ʱ�䲢�ٴμ�飬���ֻ��Ҫ���һ�Σ���������������ɡ����豸�п������Ӳ��ȶ�ʱ������ʹ��rechk������;�Ͽ��ķ��ա�
::
::�����
::
::- %chk_connect_devstate%   �豸��ǰ����״̬
::- %chk_connect_edlport%    ���ѡ����edlģʽ�������˿ڣ����磺COM6��
::
::ʾ����
::
::- ���fastboot���ӣ�call chk_connect_by_SYXZ.bat fastboot
::- ���recovery���Ӳ����飺call chk_connect_by_SYXZ.bat recovery rechk
::
::��֪BUG��
::
::- 1.���adb������ʱ������һ��(����)�����豸��һ��(����)unauthorized(����δ��Ȩ)״̬�豸ͬʱ����ʱ��������ͨ����顣
::- 2.���adb������ʱ������һ��(����)�����豸��һ��(����)offline(����)״̬�豸ͬʱ����ʱ��������ͨ����顣�ⳣ���ڰ�װ��wsa(��׿��ϵͳ)��Windowsϵͳ�ϣ���Ϊwsa���ܻ���Ϊadb�豸����鵽��
::- 3.��ģ�鲻�ᱩ��kill adb����������adb������adb������������adb��������ʱ����ģ���޷��������С�


@ECHO OFF

::
::���������ã�������Ҫ�����޸�
::

::����Դ���������һ��ģ�飬��ೢ�Լ����ٴΣ�������������ͣ���
set chk_connect_try_max=30
::����ȴ�ʱ�䣺���ʹ��rechk�����һ�μ��֮��ȴ������ٽ��еڶ��μ��
set chk_connect_rechk_wait=1
::�Ƿ����ö˿ڼ�鹦�ܣ�������ã�����Լ��˿ڡ�����Ҫdevcon.exe�ļ�
set chk_connect_chkport=y
::adb.exe�ļ�λ��
set chk_connect_adbpath=.\adb.exe
::fastboot.exe�ļ�λ��
set chk_connect_fbpath=.\fastboot.exe
::devcon.exe�ļ�λ�ã����û�����ö˿ڼ�鹦������Ҫ���ļ���Ҳ����Ҫ��д���·����
set chk_connect_dcpath=.\devcon.exe

::
::�����ǽű�
::

::�Լ�
if "%chk_connect_try_max%"=="" ECHO.chk_connect_try_max δ���壡 & pause>nul & EXIT
if "%chk_connect_rechk_wait%"=="" ECHO.chk_connect_rechk_wait δ���壡 & pause>nul & EXIT
if "%chk_connect_chkport%"=="" ECHO.chk_connect_chkport δ���壡 & pause>nul & EXIT
if "%chk_connect_adbpath%"=="" ECHO.chk_connect_adbpath δ���壡 & pause>nul & EXIT
if "%chk_connect_fbpath%"=="" ECHO.chk_connect_fbpath δ���壡 & pause>nul & EXIT
if "%chk_connect_chkport%"=="y" (if "%chk_connect_dcpath%"=="" ECHO.chk_connect_dcpath δ���壡 & pause>nul & EXIT)
if not exist %chk_connect_adbpath% ECHO.ָ����adb.exe�ļ�·����%chk_connect_adbpath%�������ڣ� & pause>nul & EXIT
if not exist %chk_connect_fbpath% ECHO.ָ����fastboot.exe�ļ�·����%chk_connect_fbpath%�������ڣ� & pause>nul & EXIT
if "%chk_connect_chkport%"=="y" (if not exist %chk_connect_dcpath% ECHO.ָ����devcon.exe�ļ�·����%chk_connect_dcpath%�������ڣ� & pause>nul & EXIT)
if "%1"=="" ECHO.ȱ�ٵ�һ�������� & pause>nul & EXIT
if not "%chk_connect_chkport%"=="y" (if "%1"=="edl" ECHO.δ�����˿ڼ�鹦�ܣ��޷���� %1 ģʽ�� & pause>nul & EXIT)
if "%2"=="rechk" (set chk_connect_rechk=y) else (set chk_connect_rechk=n)
::��ʼ
:CHK-CONNECT-1
ECHO.���ڼ���豸����(%1)... & set chk_connect_try_times=0& set chk_connect_devnum=0& set chk_connect_devstate=blank& adb devices 1>nul
:CHK-CONNECT-2
::��鵥���豸���ӣ��õ�chk_connect_devnum��chk_connect_devstate
if "%1"=="system" for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "	device"') do set chk_connect_devnum=%%a
if "%1"=="recovery" for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "recovery"') do set chk_connect_devnum=%%a
if "%1"=="fastboot" for /f %%a in ('%chk_connect_fbpath% devices ^| find /c "fastboot"') do set chk_connect_devnum=%%a
if "%1"=="sideload" for /f %%a in ('%chk_connect_adbpath% devices ^| find /c "sideload"') do set chk_connect_devnum=%%a
if "%1"=="edl" for /f %%a in ('%chk_connect_dcpath% find usb* ^| find /c "QDLoader"') do set chk_connect_devnum=%%a
if not "%1"=="all" set chk_connect_devstate=%1& goto CHK-CONNECT-4
::��������豸���ӣ��õ���chk_connect_devnum��chk_connect_devstate
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
::��ɺ󣬼�飨�ܣ��豸��
:CHK-CONNECT-4
set /a chk_connect_try_times+=1
if "%chk_connect_devnum%"=="0" (
    if %chk_connect_try_times% GEQ %chk_connect_try_max% ECHO.����δ��⵽Ŀ���豸������������¼��... & pause>nul & goto CHK-CONNECT-1
    TIMEOUT /T 1 /NOBREAK>nul & goto CHK-CONNECT-2)
if %chk_connect_devnum% GTR 1 ECHO.�ж���豸���ӣ���Ͽ������豸������������¼��... & pause>nul & goto CHK-CONNECT-1
::�豸����1�����Լ�������Ҫ�����򸴲�
if "%chk_connect_rechk%"=="y" (
    set chk_connect_rechk=n
    ECHO.%chk_connect_rechk_wait%����ٴμ�飬���Ժ�... & TIMEOUT /T %chk_connect_rechk_wait% /NOBREAK>nul & goto CHK-CONNECT-1)
::���踴�飬�漰�˿�����˿ں�
if "%chk_connect_devstate%"=="edl" for /f "tokens=2 delims=()" %%i in ('%chk_connect_dcpath% find usb* ^| find "Qualcomm HS-USB QDLoader 9008"') do set chk_connect_edlport=%%i
::����
ECHO.�豸�����ӣ�%chk_connect_devstate%����
goto :eof
