::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJH2L40w8JxpQcAiNO2T0D7YTiA==
::YAwzuBVtJxjWCl3EqQJhSA==
::ZR4luwNxJguZRRmn22kVSA==
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJkZksaHGQ=
::ZQ05rAF9IBncCkqN+0xwdVsAAlTMbAs=
::ZQ05rAF9IAHYFVzEqQITBzBxLA==
::eg0/rx1wNQPfEVWB+kM9LVsJDCetF07a
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQK11vjRsNoH7IQ/0XCZDT+b
::dhA7uBVwLU+EWGqF/1ciKS9RTRaRXA==
::YQ03rBFzNR3SWATEx0M7PQlVeAGDLnja
::dhAmsQZ3MwfNWATEx0M7PQlVeAGDLnja
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRkDAJMDKRBBXgW2OWqoFTDACG0UHm19Rsj4uWrroQoLNTFZ5WX2PSU=
::Zh4grVQjdCqDJG2r224MCzR/aRLWcjuGgVfFbQ8gaQJ2JKTu0T7f/VgeX1FZpy7CpED8cPY=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

:: ���õ�ǰ����汾
set "current_version=4.0"
:: �����ƶ˰汾�ļ���URL
set "url=https://gitee.com/midstream-dream/coke/raw/master/banben"
:: ������ʱ�ļ�·��
set "temp_file=%TEMP%\version.txt"

:: �����ƶ˵İ汾�ļ�
echo ���ڴ��ƶ��������°汾��Ϣ...
echo ��һ�ν��д˹��̿��ܽ���,�����ĵȴ�...
certutil -urlcache -split -f "%url%" "%temp_file%"

:: ��������Ƿ�ɹ�
if errorlevel 1 (
    echo ���ذ汾��Ϣʧ��,�����������ӻ��Ժ����ԡ�
    Echo ����������˳��ű�...
    pause >nul
    exit /b
)

:: �����ص��ļ��ж�ȡ���°汾��
for /f "delims=" %%i in ('type "%temp_file%"') do set "latest_version=%%i"

:: ������ʱ�ļ�
del "%temp_file%"

:: ��ӡ��ǰ�汾�����°汾��Ϣ
echo ��ǰ����汾: %current_version%
echo �ƶ����°汾: %latest_version%

:: �Ƚϰ汾��
if %current_version% LSS %latest_version% (
    echo �����°汾���������������
    start https://co-ke.us.kg/%E5%88%B7%E6%9C%BA%E5%B7%A5%E5%85%B7
    pause
    exit /b
) else (
    echo ������ʹ�õ��������°汾��
    ECHO.���������ǰ�����˵�...
    pause >nul
    goto example
)



:example
CLS
chcp 936>nul
cd /d %~dp0
if exist bin (cd bin) else (ECHO.�Ҳ���bin & goto Download)
::��������,������Զ���������ļ�Ҳ���Լ�������
if exist conf\fixed.bat (call conf\fixed) else (ECHO.�Ҳ���conf\fixed.bat & goto FATAL)
if exist conf\user.bat call conf\user
if exist conf\write.bat (call conf\write) else (ECHO.�Ҳ���conf\write.bat & goto FATAL)
::������ɫ����

::��ɫ
set "RED=[1;31m"
::��ɫ
set "GREEN=[1;32m"
::��ɫ
set "YELLOW=[1;33m"
::��ɫ
set "BLUE=[1;34m"
::��ɫ
set "PURPLE=[1;35m"
::��ɫ
set "CYAN=[1;36m"
::��ɫ
set "WHITE=[1;37m"
::�����ɫ����
set "NC=[0m"
::����
set "BOLD=[1m"
::�»���
set "UNDERLINE=[4m"
::����
set "REVERSE=[7m"
::��ɫ
set "BLACK=[1;30m"
::��ɫ
set "GRAY=[1;30m"
::����ɫ
set "LIGHTRED=[1;31m"
::����ɫ
set "LIGHTGREEN=[1;32m"
::����ɫ
set "LIGHTYELLOW=[1;33m"

:MENU
CLS
mode con cols=71
ECHO.
ECHO.%BLUE%++++========================================================++++
ECHO ++++         ####   ####  ##  ## #####                      ++++
ECHO ++++        ##  ## ##  ## ## ##  ##                         ++++
ECHO ++++        ##     ##  ## ####   ####                       ++++
ECHO ++++        ##  ## ##  ## ## ##  ##                         ++++
ECHO ++++         ####   ####  ##  ## #####                      ++++
ECHO.%BLUE%++++========================================================++++
ECHO.
ECHO.
cd /d %~dp0bin\chkdev
call chk_connect.bat all



CLS
ECHO.
ECHO.%BLUE%++++========================================================++++
ECHO ++++         ####   ####  ##  ## #####                      ++++
ECHO ++++        ##  ## ##  ## ## ##  ##                         ++++
ECHO ++++        ##     ##  ## ####   ####                       ++++
ECHO ++++        ##  ## ##  ## ## ##  ##                         ++++
ECHO ++++         ####   ####  ##  ## #####                      ++++
ECHO.%BLUE%++++========================================================++++
ECHO.
ECHO.%RED%�����佫��������ҿ�Դ!!
ECHO.
ECHO.%GREEN%����豸��ǰ������:%chk_connect_devstate%
cd /d %~dp0bin
ECHO.
ECHO.%PURPLE%1.һ�����Զ�ROOT   2.�������        3.����豸����
ECHO.%CYAN%4.ADB������       5.ˢ���������     6. MTKǿ��BL
ECHO.%YELLOW%7.MTKCLIENT       8.ADB�������     9.�ƶ�BOOT�� 
ECHO.
ECHO.%LIGHTGREEN%A.��������        B.����        C.ˢ��
echo.%WHITE%
call choice common [1][2][3][4][5][6][7][8][9][A][B][C]#[C]
if %choice%==1 goto root
if %choice%==2 goto REBOOT
if %choice%==3 goto check
if %choice%==4 goto ADB
if %choice%==5 goto flash
if %choice%==6 goto BL
if %choice%==7 CALL "%~dp0bin\mtk.exe"
if %choice%==8 goto ADB_activation
if %choice%==9 start https://co-ke.us.kg/
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
ECHO.%GREEN%����豸��ǰ������:%chk_connect_devstate%
Pause
goto MENU






:root
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.ѡ��׿�汾
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.������׿13
ECHO.2.�����ǰ�׿13(����������13Ҳѡ���)
ECHO.A.�������˵�
set /p choice=���������:
if "%choice%"=="1" set "fall=BOOT" & goto ROOT1
if "%choice%"=="2" set "fall=init_boot" & goto ROOT1
if "%choice%"=="A" goto MENU
goto MENU
:ROOT1
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.ѡ��ROOT����
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.Magisk
ECHO.2.APATCH
ECHO.A.�������˵�
set /p choice=���������:
if %choice%==1 goto Magisk
if %choice%==2 goto APATCH
if %choice%==A goto MENU
goto MENU



:magisk
CLS
set KEEPVERITY=false
set KEEPFORCEENCRYPT=false
cd /d %~dp0
set /p bootPath="���Ҫˢ����ļ��ϵ��˴�������·��: "
set "Path=%~dp0bin;%Path%"
set /p aa=�Ƿ���64λ�豸? (Y/N)
if /i "%aa%"=="Y" (
    set IS64BIT=true
    echo -- ��64λ
) else (
    set IS64BIT=false
    echo -- ����64λ
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
::��ʼˢ��
ECHO.
ECHO.���Ƚ��豸������fastboot
cd /d "%~dp0bin\ADB"
ECHO.
ECHO.��������OKAY��Ϊ�ɹ�
fastboot flash "%fall%" "%~dp0Magisk-boot.img"
del "%~dp0Magisk-boot.img" 2>nul
ECHO.�Ƿ��豸����?
cd /d %~dp0bin\ADB
ECHO.1.��   2.��   A.�������˵�
set /p choice=���������:
if %choice%==1 fastboot reboot
if %chhoice%==2 goto MENU
if %choice%==A goto MENU
goto MENU




:APATCH
cd /d %~dp0bin\ApatchPatch
del "new-boot.img" >nul 2>&1
del "kernel" >nul 2>&1
del "kernel-b" >nul 2>&1
del "ramdisk.cpio" >nul 2>&1
SETLOCAL ENABLEDELAYEDEXPANSION
:: ���幤�����ڵ�·����ȷ���Ǿ���·��
set "TOOL_PATH=%~dp0bin\ApatchPatch\"
:: ȷ��TOOL_PATH������ȷ
if not exist "!TOOL_PATH!magiskboot.exe" (
    echo ����·������ȷ���Ҳ���magiskboot.exe��
    pause
    goto MENU
)
set /p bootPath="���ҪBOOT�ļ��ϵ��˴�������·��(ĿǰAPATCHֻ֧��boot��֧��init_boot): "
echo.��������ĳ�����Կ%RED%(һ��Ҫ��ס��Կ!)��
ECHO.%WHITE%
set /p "superKey="
:: ʹ�þ���·�����ù���
set "magiskboot=%TOOL_PATH%magiskboot.exe"
set "kptools=%TOOL_PATH%kptools-x86_64-win.exe":: �л�������Ŀ¼
pushd "!TOOL_PATH!"
:: ���boot.img��magiskboot����Ŀ¼
echo ���ڽ��boot.img�� %TOOL_PATH%...
"!magiskboot!" unpack "!bootPath!"
if errorlevel 1 (
    echo ���ʧ�ܣ�����magiskboot�����Ƿ���á�
    popd
    pause
    exit /b
)
:: ��鲢������������kernel�ļ�
if exist "kernel" (
    echo ����������kernel�ļ�Ϊkernel-b...
    ren "kernel" "kernel-b"
    if errorlevel 1 (
        echo ������ʧ�ܡ�
        popd
        pause
        exit /b
    )
) else (
    echo ��ѹ���kernel�ļ������ڡ�
    popd
    pause
    exit /b
)
:: �޲��ں�
echo �޲��ں�...
"!kptools!" -p --image "kernel-b" --skey="!superKey!" --kpimg "kpimg-android" --out "kernel"
if errorlevel 1 (
    echo �޲��ں�ʧ�ܣ�����kptools�����Ƿ���á�
    popd
    pause
    exit /b
)
:: ���´��boot.img
echo ���´��boot.img...
"!magiskboot!" repack "!bootPath!"
if errorlevel 1 (
    echo ���´��ʧ�ܣ�����magiskboot�����Ƿ���á�
    popd
    pause
    exit /b
)
:: ������ʱ�ļ�
echo ����������ʱ�ļ�...
del "kernel" 2>nul
del "kernel-b" 2>nul
del "ramdisk.cpio" 2>nul
echo ������ɡ�
:: �˳�����Ŀ¼
popd
:: �����Ϣ
ECHO.�޲���ɰ��������ˢ��...
pause >nul
goto flash_apatch
:flash_apatch
CLS
cd /d %~dp0bin\ApatchPatch
ECHO.���Ƚ��豸������fastboot
fastboot flash boot new-boot.img
ECHO.
ECHO.��������OKAY��Ϊ�ɹ�







:CHKDEV
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.����豸����
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.����豸����(ȫ��)
ECHO.2.����豸����(ϵͳ)
ECHO.3.����豸����(Recovery)
ECHO.4.����豸����(sideload)
ECHO.5.����豸����(Fastboot)
ECHO.6.����豸����(edl)
ECHO.7.����豸����(diag901d)
ECHO.8.����豸����(sprdboot)
ECHO.9.����豸����(mtkbrom)
ECHO.10.����豸����(mtkpreloader)
ECHO.11.����豸����(ȫ��) ����
ECHO.12.����豸����(ϵͳ) 2��󸴲�
ECHO.A.���ز˵�
call choice common [1][2][3][4][5][6][7][8][9][10][11][12]
if "%choice%"=="1" call chkdev all
if "%choice%"=="2" call chkdev system
if "%choice%"=="3" call chkdev recovery
if "%choice%"=="4" call chkdev sideload
if "%choice%"=="5" call chkdev fastboot
if "%choice%"=="6" call chkdev edl
if "%choice%"=="7" call chkdev diag901d
if "%choice%"=="8" call chkdev sprdboot
if "%choice%"=="9" call chkdev mtkbrom
if "%choice%"=="10" call chkdev mtkpreloader
if "%choice%"=="11" call chkdev all rechk 2
if "%choice%"=="12" call chkdev system rechk 2
if "%choice%"=="A" goto MENU
ECHO. & ECHOC {%c_s%}���. {%c_h%}��������������˵�...{%c_i%}{\n}& pause>nul & goto MENU






:REBOOT
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.reboot.bat ����
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.��ѡ��Ҫ�����ģʽ:
ECHO.1.system
ECHO.2.recovery
ECHO.3.sideload
ECHO.4.fastboot
ECHO.5.fastbootd
set /p choice=���������:
if "%choice%"=="1" set target=system
if "%choice%"=="2" set target=recovery
if "%choice%"=="3" set target=sideload
if "%choice%"=="4" set target=fastboot
if "%choice%"=="5" set target=fastbootd
if "%choice%"=="6" set target=edl
if "%choice%"=="7" set target=diag901d
call chkdev all rechk 1
cd /d %~dp0bin\chkdev
ECHO.����%target%ģʽ... & call chk_reboot all

ECHO. & ECHOC {%c_s%}���. {%c_h%}��������������˵�...{%c_i%}{\n}& pause>nul & goto MENU




:ADB
CLS
CD /d %~dp0bin\ADB
CMD




:flash
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.ˢ���������
ECHO.=--------------------------------------------------------------------=
cd /d "%~dp0bin\ADB"
set /p path="������Ҫˢ��ķ���: "
set /p file="�����������Ҫˢ����ļ�ӳ��: "
echo ˢ������ӳ����ܵ�������豸��ש�������������������ʧ�����߲����κ�����!
echo ���Ƚ��豸������fastboot
Pause
fastboot flash %path% %file%
if errorlevel 1 (
    echo ˢ��ʧ��
) else (
    echo ˢ��ɹ�
)
Pause
goto MENU






:BL
CLS
ECHO.=----------------------------------------------------------=
ECHO.����BootLoader
ECHO.=----------------------------------------------------------=
ECHO.
cd /d %~dp0bin
mtk da seccfg unlock
ECHO.��������ɺ���ֿ�������С���޷�����ϵͳ�밴ס������
ECHO.����������������˵�
pause >nul
goto MENU






:ADB_ACTIVE
CLS
cd /d "%~dp0bin\ADB"
ECHO.��ѡ����Ҫ��������:
ECHO.1.shizuku   2.С����
ECHO.3.����      4.�յ���(����!)
ECHO.5.����(Ice Box)  6.�������˵�
set /p choice=���������:
if "%choice%"=="1" adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh
if "%choice%"=="2" adb shell sh /storage/emulated/0/Android/data/web1n.stopapp/files/starter.sh
if "%choice%"=="3" adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh
if "%choice%"=="4" adb shell dpm set-device-owner me.yourbay.airfrozen/.main.core.mgmt.MDeviceAdminReceiver
if "%choice%"=="5" adb shell sh /sdcard/Android/data/com.catchingnow.icebox/files/start.sh
if "%choice%"=="6" goto MENU
goto MENU




:Download
CLS
ECHO.������b��û��ѹ
ECHO.������b��û��ѹ
ECHO.������b��û��ѹ
ECHO.������b��û��ѹ
ECHO.ɵ��,�㲻���ѹˢʲô��
pause

