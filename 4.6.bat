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
REM ���õ�ǰ����汾
set "current_version=4.6"

REM �����ƶ˰汾�ļ���URL
set "url=https://gitee.com/midstream-dream/sky_box/raw/master/version"

REM ������ʱ�ļ�·��
set "temp_file=%TEMP%\version.txt"

REM �����ƶ˵İ汾�ļ�
echo ���ڴ��ƶ��������°汾��Ϣ...
echo.
echo ��һ�ν��д˹��̿��ܽ����������ĵȴ�...
echo.
curl -s -o "%temp_file%" "%url%"

REM ���²��ִ��뱣�ֲ��䣬ʡ���ظ�չʾ

REM ��������Ƿ�ɹ�
if %errorlevel% neq 0 (
    echo ���ذ汾��Ϣʧ�ܣ������������ӻ��Ժ����ԡ�
    echo.
    Echo ����������˳��ű�...
    pause >nul
    exit /b
)

REM �����ص��ļ��ж�ȡ���°汾��
for /f "delims=" %%i in ('type "%temp_file%"') do set "latest_version=%%i"

REM ������ʱ�ļ�
del "%temp_file%"

REM ��ӡ��ǰ�汾�����°汾��Ϣ
echo ��ǰ����汾: %current_version%
echo �ƶ����°汾: %latest_version%

REM �Ƚϰ汾��
if %current_version% LSS %latest_version% (
    echo.
    echo �����°汾���������������
    start https://skybox.mom/������
    pause
    exit /b
) else (
    echo �����ڵ��������°汾��
    echo.
    ECHO.���������ǰ�����˵�...
    pause >nul
    goto first
)








:first
CLS
::�˴���д��������ʶ
set APP_ID=4G6M4X1J3D5W1I2T
::���ǻ�ȡ�����API
set API_URL_Announcement=http://api.1wxyun.com/?type=1
::���ǿ�����֤��API
set  API_URL_Card=http://api.1wxyun.com/?type=17
::�����û�ת���API
set API_URL_Unbinding=http://api.1wxyun.com/?type=14
::���ǲ�ѯ���ܵ���ʱ���API
set API_URL_chaxun=http://api.1wxyun.com/?type=24
echo ����:
ECHO.---------------------------------------------------------------
curl -X POST "%API_URL_Announcement%" -d "Softid=%APP_ID%"
ECHO.
ECHO.---------------------------------------------------------------
ECHO.
echo 1.��֤����
echo 2.��ѯ���ܵ���ʱ��
echo 3.�����
set /p input=����ѡ�
if %input%==1 goto yanzheng
if %input%==2 goto card
if %input%==3 goto unbind
goto first



:unbind
ECHO.
set /p card_NUM=�����뿨�ܣ�
set post_unbind="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd=&Type=1"
curl -X POST "%API_URL_Unbinding%" -d %post_unbind%
echo.
pause
goto first





:card
ECHO.
set /p card_NUM=�����뿨�ܣ�
echo.
echo.
ECHO ���ܵ���ʱ�䣺
set post_card="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd="
curl -s -X POST "%API_URL_chaxun%" -d %post_card%
ECHO.
pause >nul
ECHO ���������������֤
goto first















:yanzheng
ECHO.
::�������
set /p card_NUM=�����뿨�ܣ�
set post_data="Softid=%APP_ID%&Card=%card_NUM%&Version=1.0"
set post_curl=curl 
set post_s=-s 
set post_X=-X 
set post_d=POST 
set post_API="%API_URL_Card%" 
set post_d2=-d 

set response=%post_curl%%POST_s%%post_X%%post_d%%post_API%%post_d2%%post_data%
::�˴���ⷵ�ص�Tokenֵ�Ŀ�ͷ�Ƿ�Ϊ��д��ĸ�������������Ϊ��֤ʧ��
echo & %response% | findstr "^[A-Z]" >nul
if errorlevel 1 (
    echo ��֤ʧ�ܣ����صĴ������ǣ�
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    ECHO.��鿴��������գ�
    pause
    start https://skybox.mom/������/���������.txt
    pause
    goto first
) else (

    echo.& %response%
    echo ��֤�ɹ������ص�Token�ǣ�
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    pause
    goto start
)
pause





::-----------------------------------------------------����Ϊ������

:start
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
ECHO.%GREEN%����豸��ǰ������:%chk_connect_devstate%
cd /d bin
ECHO.
ECHO.%PURPLE%              ��1��һ�����Զ�ROOT           ��2���������      
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%CYAN%              ��3������豸����             ��4��ADB������   
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%RED%              ��5��ˢ���������             ��6��MTKǿ��BL
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%YELLOW%              ��7��ADB�������              ��8���ƶ�BOOT�� 
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%LIGHTGREEN%A.��������        B.����        C.ˢ��
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
if "%choice%"=="1" set "fall=init_boot" & goto ROOT1
if "%choice%"=="2" set "fall=boot" & goto ROOT1
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
del stock_boot.img >nul 2>nul
del ramdisk.cpio >nul 2>nul
del dtb >nul 2>nul
del kernel >nul 2>nul
del kernel_dtb  >nul 2>nul
set KEEPVERITY=false
set KEEPFORCEENCRYPT=false
cd /d %~dp0
set /p bootPath="���Ҫˢ����ļ��ϵ��˴�������·��: "
set "Path=bin;%Path%"
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
cd /d "bin\ADB"
ECHO.
ECHO.��������OKAY��Ϊ�ɹ�
fastboot flash "%fall%" "%~dp0Magisk-boot.img"
del "%~dp0Magisk-boot.img" 2>nul
ECHO.�Ƿ��豸����?
cd /d bin\ADB
ECHO.1.��   2.��   A.�������˵�
set /p choice=���������:
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
:: ���幤�����ڵ�·����ȷ���Ǿ���·��
set "TOOL_PATH=bin\ApatchPatch\"
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
cd /d bin\ApatchPatch
ECHO.���Ƚ��豸������fastboot
fastboot flash boot new-boot.img
ECHO.
ECHO.��������OKAY��Ϊ�ɹ�
pause
ECHO.�Ƿ������ֻ�?
ECHO.1.����
ECHO.2.�������˵�
call choice common [1][2]#[2]
if %choice%==1 fastboot REBOOT
if %choice%==2 goto MENU













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
cd /d bin\chkdev
ECHO.����%target%ģʽ... & call chk_reboot all

ECHO.���.��������������˵�...& pause>nul & goto MENU




:ADB
CLS
CD /d bin\ADB
CMD




:flash
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.ˢ���������
ECHO.=--------------------------------------------------------------------=
cd /d "bin\ADB"
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
















:ADB_ACTIVE
CLS
cd /d "bin\ADB"
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








:BL
CLS
:first_BL
CLS
::�˴���д��������ʶ
set APP_ID=4G0R3Y7V6M4L1B3U
::���ǻ�ȡ�����API
set API_URL_Announcement=http://api.1wxyun.com/?type=1
::���ǿ�����֤��API
set  API_URL_Card=http://api.1wxyun.com/?type=17
::�����û�ת���API
set API_URL_Unbinding=http://api.1wxyun.com/?type=14
::���ǲ�ѯ���ܵ���ʱ���API
set API_URL_chaxun=http://api.1wxyun.com/?type=24
echo ����:
ECHO.---------------------------------------------------------------
curl -X POST "%API_URL_Announcement%" -d "Softid=%APP_ID%"
ECHO.
ECHO.---------------------------------------------------------------
ECHO.
echo 1.��֤����
echo 2.��ѯ���ܵ���ʱ��
echo 3.�����
echo 4.�������˵�
set /p input=����ѡ�
if %input%==1 goto yanzheng_BL
if %input%==2 goto card
if %input%==3 goto unbind
if %input%==4 goto MENU
goto first



:unbind_BL
ECHO.
set /p card_NUM=�����뿨�ܣ�
set post_unbind="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd=&Type=1"
curl -X POST "%API_URL_Unbinding%" -d %post_unbind%
echo.
pause
goto first





:card_BL
ECHO.
set /p card_NUM=�����뿨�ܣ�
echo.
echo.
ECHO ���ܵ���ʱ�䣺
set post_card="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd="
curl -s -X POST "%API_URL_chaxun%" -d %post_card%
ECHO.
pause >nul
ECHO ���������������֤
goto first_BL















:yanzheng_BL
ECHO.
::�������
set /p card_NUM=�����뿨�ܣ�
set post_data="Softid=%APP_ID%&Card=%card_NUM%&Version=1.0"
set post_curl=curl 
set post_s=-s 
set post_X=-X 
set post_d=POST 
set post_API="%API_URL_Card%" 
set post_d2=-d 

set response=%post_curl%%POST_s%%post_X%%post_d%%post_API%%post_d2%%post_data%
::�˴���ⷵ�ص�Tokenֵ�Ŀ�ͷ�Ƿ�Ϊ��д��ĸ�������������Ϊ��֤ʧ��
echo & %response% | findstr "^[A-Z]" >nul
if errorlevel 1 (
    echo ��֤ʧ�ܣ����صĴ������ǣ�
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    ECHO.��鿴��������գ�
    pause
    start https://skybox.mom/������/���������.txt
    pause
    goto first
) else (

    echo.& %response%
    echo ��֤�ɹ������ص�Token�ǣ�
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    pause
    goto BL_main
)
pause


:BL_main
ECHO.=----------------------------------------------------------=
ECHO.����BootLoader
ECHO.=----------------------------------------------------------=
ECHO.
cd /d bin
mtk payload
mtk da seccfg unlock
ECHO.��������ɺ���ֿ�������С���޷�����ϵͳ���밴ס������ֱ��ϵͳ����������
ECHO.����������������˵�
pause >nul
goto MENU
