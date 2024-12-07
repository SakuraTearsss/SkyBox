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
REM ÉèÖÃµ±Ç°Èí¼þ°æ±¾
set "current_version=4.6"

REM ÉèÖÃÔÆ¶Ë°æ±¾ÎÄ¼þµÄURL
set "url=https://gitee.com/midstream-dream/sky_box/raw/master/version"

REM ÉèÖÃÁÙÊ±ÎÄ¼þÂ·¾¶
set "temp_file=%TEMP%\version.txt"

REM ÏÂÔØÔÆ¶ËµÄ°æ±¾ÎÄ¼þ
echo ÕýÔÚ´ÓÔÆ¶ËÏÂÔØ×îÐÂ°æ±¾ÐÅÏ¢...
echo.
echo µÚÒ»´Î½øÐÐ´Ë¹ý³Ì¿ÉÄÜ½ÏÂý£¬ÇëÄÍÐÄµÈ´ý...
echo.
curl -s -o "%temp_file%" "%url%"

REM ÒÔÏÂ²¿·Ö´úÂë±£³Ö²»±ä£¬Ê¡ÂÔÖØ¸´Õ¹Ê¾

REM ¼ì²éÏÂÔØÊÇ·ñ³É¹¦
if %errorlevel% neq 0 (
    echo ÏÂÔØ°æ±¾ÐÅÏ¢Ê§°Ü£¬Çë¼ì²éÍøÂçÁ¬½Ó»òÉÔºóÔÙÊÔ¡£
    echo.
    Echo °´ÏÂÈÎÒâ¼üÍË³ö½Å±¾...
    pause >nul
    exit /b
)

REM ´ÓÏÂÔØµÄÎÄ¼þÖÐ¶ÁÈ¡×îÐÂ°æ±¾ºÅ
for /f "delims=" %%i in ('type "%temp_file%"') do set "latest_version=%%i"

REM ÇåÀíÁÙÊ±ÎÄ¼þ
del "%temp_file%"

REM ´òÓ¡µ±Ç°°æ±¾ºÍ×îÐÂ°æ±¾ÐÅÏ¢
echo µ±Ç°Èí¼þ°æ±¾: %current_version%
echo ÔÆ¶Ë×îÐÂ°æ±¾: %latest_version%

REM ±È½Ï°æ±¾ºÅ
if %current_version% LSS %latest_version% (
    echo.
    echo ·¢ÏÖÐÂ°æ±¾£¬Çë¸üÐÂÄãµÄÈí¼þ¡£
    start https://skybox.mom/¹¤¾ßÏä
    pause
    exit /b
) else (
    echo ÄãÕýÔÚµÄÒÑÊÇ×îÐÂ°æ±¾¡£
    echo.
    ECHO.°´ÏÂÈÎÒâ¼üÇ°ÍùÖ÷²Ëµ¥...
    pause >nul
    goto first
)








:first
CLS
::´Ë´¦ÌîÐ´ÄãµÄÈí¼þ±êÊ¶
set APP_ID=4G6M4X1J3D5W1I2T
::ÕâÊÇ»ñÈ¡¹«¸æµÄAPI
set API_URL_Announcement=http://api.1wxyun.com/?type=1
::ÕâÊÇ¿¨ÃÜÑéÖ¤µÄAPI
set  API_URL_Card=http://api.1wxyun.com/?type=17
::ÕâÊÇÓÃ»§×ª°óµÄAPI
set API_URL_Unbinding=http://api.1wxyun.com/?type=14
::ÕâÊÇ²éÑ¯¿¨ÃÜµ½ÆÚÊ±¼äµÄAPI
set API_URL_chaxun=http://api.1wxyun.com/?type=24
echo ¹«¸æ:
ECHO.---------------------------------------------------------------
curl -X POST "%API_URL_Announcement%" -d "Softid=%APP_ID%"
ECHO.
ECHO.---------------------------------------------------------------
ECHO.
echo 1.ÑéÖ¤¿¨ÃÜ
echo 2.²éÑ¯¿¨ÃÜµ½ÆÚÊ±¼ä
echo 3.½â°ó¿¨ÃÜ
set /p input=ÊäÈëÑ¡Ïî£º
if %input%==1 goto yanzheng
if %input%==2 goto card
if %input%==3 goto unbind
goto first



:unbind
ECHO.
set /p card_NUM=ÇëÊäÈë¿¨ÃÜ£º
set post_unbind="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd=&Type=1"
curl -X POST "%API_URL_Unbinding%" -d %post_unbind%
echo.
pause
goto first





:card
ECHO.
set /p card_NUM=ÇëÊäÈë¿¨ÃÜ£º
echo.
echo.
ECHO ¿¨ÃÜµ½ÆÚÊ±¼ä£º
set post_card="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd="
curl -s -X POST "%API_URL_chaxun%" -d %post_card%
ECHO.
pause >nul
ECHO °´ÏÂÈÎÒâ¼ü·µ»ØÑéÖ¤
goto first















:yanzheng
ECHO.
::¶¨Òå±äÁ¿
set /p card_NUM=ÇëÊäÈë¿¨ÃÜ£º
set post_data="Softid=%APP_ID%&Card=%card_NUM%&Version=1.0"
set post_curl=curl 
set post_s=-s 
set post_X=-X 
set post_d=POST 
set post_API="%API_URL_Card%" 
set post_d2=-d 

set response=%post_curl%%POST_s%%post_X%%post_d%%post_API%%post_d2%%post_data%
::´Ë´¦¼ì²â·µ»ØµÄTokenÖµµÄ¿ªÍ·ÊÇ·ñÎª´óÐ´×ÖÄ¸£¬Èç¹û²»ÊÇÔòÈÏÎªÑéÖ¤Ê§°Ü
echo & %response% | findstr "^[A-Z]" >nul
if errorlevel 1 (
    echo ÑéÖ¤Ê§°Ü£¬·µ»ØµÄ´íÎóÂëÊÇ£º
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    ECHO.Çë²é¿´´íÎóÂë¶ÔÕÕ£¡
    pause
    start https://skybox.mom/¹¤¾ßÏä/´íÎóÂë¶ÔÕÕ.txt
    pause
    goto first
) else (

    echo.& %response%
    echo ÑéÖ¤³É¹¦£¬·µ»ØµÄTokenÊÇ£º
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    pause
    goto start
)
pause





::-----------------------------------------------------ÒÔÏÂÎª¹¤¾ßÏä

:start
CLS
chcp 936>nul
cd /d %~dp0
if exist bin (cd bin) else (ECHO.ÕÒ²»µ½bin & goto Download)
::¼ÓÔØÅäÖÃ,Èç¹ûÓÐ×Ô¶¨ÒåµÄÅäÖÃÎÄ¼þÒ²¿ÉÒÔ¼ÓÔÚÏÂÃæ
if exist conf\fixed.bat (call conf\fixed) else (ECHO.ÕÒ²»µ½conf\fixed.bat & goto FATAL)
if exist conf\user.bat call conf\user
if exist conf\write.bat (call conf\write) else (ECHO.ÕÒ²»µ½conf\write.bat & goto FATAL)
::ÉèÖÃÑÕÉ«±äÁ¿

::ºìÉ«
set "RED=[1;31m"
::ÂÌÉ«
set "GREEN=[1;32m"
::»ÆÉ«
set "YELLOW=[1;33m"
::À¶É«
set "BLUE=[1;34m"
::×ÏÉ«
set "PURPLE=[1;35m"
::ÇàÉ«
set "CYAN=[1;36m"
::°×É«
set "WHITE=[1;37m"
::Çå³ýÑÕÉ«±äÁ¿
set "NC=[0m"
::´ÖÌå
set "BOLD=[1m"
::ÏÂ»®Ïß
set "UNDERLINE=[4m"
::·´ÏÔ
set "REVERSE=[7m"
::ºÚÉ«
set "BLACK=[1;30m"
::»ÒÉ«
set "GRAY=[1;30m"
::ÁÁºìÉ«
set "LIGHTRED=[1;31m"
::ÁÁÂÌÉ«
set "LIGHTGREEN=[1;32m"
::ÁÁ»ÆÉ«
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
ECHO.%GREEN%ÄãµÄÉè±¸µ±Ç°Õý´¦ÓÚ:%chk_connect_devstate%
cd /d bin
ECHO.
ECHO.%PURPLE%              ¡¾1¡¿Ò»¼ü°ë×Ô¶¯ROOT           ¡¾2¡¿¿ì½ÝÖØÆô      
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%CYAN%              ¡¾3¡¿¼ì²âÉè±¸Á´½Ó             ¡¾4¡¿ADBÃüÁîÐÐ   
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%RED%              ¡¾5¡¿Ë¢ÈëÈÎÒâ·ÖÇø             ¡¾6¡¿MTKÇ¿½âBL
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%YELLOW%              ¡¾7¡¿ADB¼¤»îÈí¼þ              ¡¾8¡¿ÔÆ¶ËBOOT¿â 
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.%LIGHTGREEN%A.ÔÞÖúÎÒÃÇ        B.¾èÔù        C.Ë¢ÐÂ
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
ECHO.%GREEN%ÄãµÄÉè±¸µ±Ç°Õý´¦ÓÚ:%chk_connect_devstate%
Pause
goto MENU






:root
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.Ñ¡Ôñ°²×¿°æ±¾
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.³ö³§°²×¿13
ECHO.2.³ö³§·Ç°²×¿13(ºóÐøÉý¼¶µ½13Ò²Ñ¡Õâ¸ö)
ECHO.A.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëÐòºÅ:
if "%choice%"=="1" set "fall=init_boot" & goto ROOT1
if "%choice%"=="2" set "fall=boot" & goto ROOT1
if "%choice%"=="A" goto MENU
goto MENU
:ROOT1
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.Ñ¡ÔñROOT·½°¸
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.Magisk
ECHO.2.APATCH
ECHO.A.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëÐòºÅ:
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
set /p bootPath="Çë°ÑÒªË¢ÈëµÄÎÄ¼þÍÏµ½´Ë´¦»òÊäÈëÂ·¾¶: "
set "Path=bin;%Path%"
set /p aa=ÊÇ·ñÊÇ64Î»Éè±¸? (Y/N)
if /i "%aa%"=="Y" (
    set IS64BIT=true
    echo -- ÊÇ64Î»
) else (
    set IS64BIT=false
    echo -- ²»ÊÇ64Î»
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
::¿ªÊ¼Ë¢Èë
ECHO.
ECHO.ÇëÏÈ½«Éè±¸ÖØÆôµ½fastboot
cd /d "bin\ADB"
ECHO.
ECHO.µ¯³öÁ½¸öOKAY¼´Îª³É¹¦
fastboot flash "%fall%" "%~dp0Magisk-boot.img"
del "%~dp0Magisk-boot.img" 2>nul
ECHO.ÊÇ·ñ½«Éè±¸ÖØÆô?
cd /d bin\ADB
ECHO.1.ÊÇ   2.·ñ   A.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëÐòºÅ:
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
:: ¶¨Òå¹¤¾ßËùÔÚµÄÂ·¾¶£¬È·±£ÊÇ¾ø¶ÔÂ·¾¶
set "TOOL_PATH=bin\ApatchPatch\"
:: È·±£TOOL_PATH±äÁ¿ÕýÈ·
if not exist "!TOOL_PATH!magiskboot.exe" (
    echo ¹¤¾ßÂ·¾¶²»ÕýÈ·£¬ÕÒ²»µ½magiskboot.exe¡£
    pause
    goto MENU
)
set /p bootPath="Çë°ÑÒªBOOTÎÄ¼þÍÏµ½´Ë´¦»òÊäÈëÂ·¾¶(Ä¿Ç°APATCHÖ»Ö§³Öboot²»Ö§³Öinit_boot): "
echo.ÇëÊäÈëÄãµÄ³¬¼¶ÃÜÔ¿%RED%(Ò»¶¨Òª¼Ç×¡ÃÜÔ¿!)£º
ECHO.%WHITE%
set /p "superKey="
:: Ê¹ÓÃ¾ø¶ÔÂ·¾¶µ÷ÓÃ¹¤¾ß
set "magiskboot=%TOOL_PATH%magiskboot.exe"
set "kptools=%TOOL_PATH%kptools-x86_64-win.exe":: ÇÐ»»µ½¹¤¾ßÄ¿Â¼
pushd "!TOOL_PATH!"
:: ½â°üboot.imgµ½magiskbootËùÔÚÄ¿Â¼
echo ÕýÔÚ½â°üboot.imgµ½ %TOOL_PATH%...
"!magiskboot!" unpack "!bootPath!"
if errorlevel 1 (
    echo ½â°üÊ§°Ü£¬Çë¼ì²émagiskboot¹¤¾ßÊÇ·ñ¿ÉÓÃ¡£
    popd
    pause
    exit /b
)
:: ¼ì²é²¢ÖØÃüÃû½â°üºóµÄkernelÎÄ¼þ
if exist "kernel" (
    echo ÕýÔÚÖØÃüÃûkernelÎÄ¼þÎªkernel-b...
    ren "kernel" "kernel-b"
    if errorlevel 1 (
        echo ÖØÃüÃûÊ§°Ü¡£
        popd
        pause
        exit /b
    )
) else (
    echo ½âÑ¹ºóµÄkernelÎÄ¼þ²»´æÔÚ¡£
    popd
    pause
    exit /b
)
:: ÐÞ²¹ÄÚºË
echo ÐÞ²¹ÄÚºË...
"!kptools!" -p --image "kernel-b" --skey="!superKey!" --kpimg "kpimg-android" --out "kernel"
if errorlevel 1 (
    echo ÐÞ²¹ÄÚºËÊ§°Ü£¬Çë¼ì²ékptools¹¤¾ßÊÇ·ñ¿ÉÓÃ¡£
    popd
    pause
    exit /b
)
:: ÖØÐÂ´ò°üboot.img
echo ÖØÐÂ´ò°üboot.img...
"!magiskboot!" repack "!bootPath!"
if errorlevel 1 (
    echo ÖØÐÂ´ò°üÊ§°Ü£¬Çë¼ì²émagiskboot¹¤¾ßÊÇ·ñ¿ÉÓÃ¡£
    popd
    pause
    exit /b
)
:: ÇåÀíÁÙÊ±ÎÄ¼þ
echo ÕýÔÚÇåÀíÁÙÊ±ÎÄ¼þ...
del "kernel" 2>nul
del "kernel-b" 2>nul
del "ramdisk.cpio" 2>nul
echo ÇåÀíÍê³É¡£
:: ÍË³ö¹¤¾ßÄ¿Â¼
popd
:: Íê³ÉÐÅÏ¢
ECHO.ÐÞ²¹Íê³É°´ÏÂÈÎÒâ¼üË¢Èë...
pause >nul
goto flash_apatch
:flash_apatch
CLS
cd /d bin\ApatchPatch
ECHO.ÇëÏÈ½«Éè±¸ÖØÆôµ½fastboot
fastboot flash boot new-boot.img
ECHO.
ECHO.³öÏÖÁ½¸öOKAY¼´Îª³É¹¦
pause
ECHO.ÊÇ·ñÖØÆôÊÖ»ú?
ECHO.1.ÖØÆô
ECHO.2.·µ»ØÖ÷²Ëµ¥
call choice common [1][2]#[2]
if %choice%==1 fastboot REBOOT
if %choice%==2 goto MENU













:REBOOT
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.reboot.bat ÖØÆô
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.ÇëÑ¡ÔñÒª½øÈëµÄÄ£Ê½:
ECHO.1.system
ECHO.2.recovery
ECHO.3.sideload
ECHO.4.fastboot
ECHO.5.fastbootd
set /p choice=ÇëÊäÈëÐòºÅ:
if "%choice%"=="1" set target=system
if "%choice%"=="2" set target=recovery
if "%choice%"=="3" set target=sideload
if "%choice%"=="4" set target=fastboot
if "%choice%"=="5" set target=fastbootd
if "%choice%"=="6" set target=edl
if "%choice%"=="7" set target=diag901d
call chkdev all rechk 1
cd /d bin\chkdev
ECHO.½øÈë%target%Ä£Ê½... & call chk_reboot all

ECHO.Íê³É.°´ÈÎÒâ¼ü·µ»ØÖ÷²Ëµ¥...& pause>nul & goto MENU




:ADB
CLS
CD /d bin\ADB
CMD




:flash
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.Ë¢ÈëÈÎÒâ·ÖÇø
ECHO.=--------------------------------------------------------------------=
cd /d "bin\ADB"
set /p path="ÇëÊäÈëÒªË¢ÈëµÄ·ÖÇø: "
set /p file="ÇëÊäÈë»òÍÏÈëÒªË¢ÈëµÄÎÄ¼þÓ³Ïñ: "
echo Ë¢Èë´íÎóµÄÓ³Ïñ¿ÉÄÜµ¼ÖÂÄãµÄÉè±¸±ä×©£¬Çë½÷É÷²Ù×÷£¡Èô²Ù×÷Ê§°Ü×÷Õß²»¸ºÈÎºÎÔðÈÎ!
echo ÇëÏÈ½«Éè±¸ÖØÆôµ½fastboot
Pause
fastboot flash %path% %file%
if errorlevel 1 (
    echo Ë¢ÈëÊ§°Ü
) else (
    echo Ë¢Èë³É¹¦
)
Pause
goto MENU
















:ADB_ACTIVE
CLS
cd /d "bin\ADB"
ECHO.ÇëÑ¡ÔñÄãÒª¼¤»îµÄÈí¼þ:
ECHO.1.shizuku   2.Ð¡ºÚÎÝ
ECHO.3.ºÚÓò      4.¿Õµ÷¹·(É÷ÖØ!)
ECHO.5.±ùÏä(Ice Box)  6.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëÐòºÅ:
if "%choice%"=="1" adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh
if "%choice%"=="2" adb shell sh /storage/emulated/0/Android/data/web1n.stopapp/files/starter.sh
if "%choice%"=="3" adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh
if "%choice%"=="4" adb shell dpm set-device-owner me.yourbay.airfrozen/.main.core.mgmt.MDeviceAdminReceiver
if "%choice%"=="5" adb shell sh /sdcard/Android/data/com.catchingnow.icebox/files/start.sh
if "%choice%"=="6" goto MENU
goto MENU




:Download
CLS
ECHO.²ÝÄâÂðbÄãÃ»½âÑ¹
ECHO.²ÝÄâÂðbÄãÃ»½âÑ¹
ECHO.²ÝÄâÂðbÄãÃ»½âÑ¹
ECHO.²ÝÄâÂðbÄãÃ»½âÑ¹
ECHO.Éµ±Æ,Äã²»»á½âÑ¹Ë¢Ê²Ã´»ú
pause








:BL
CLS
:first_BL
CLS
::´Ë´¦ÌîÐ´ÄãµÄÈí¼þ±êÊ¶
set APP_ID=4G0R3Y7V6M4L1B3U
::ÕâÊÇ»ñÈ¡¹«¸æµÄAPI
set API_URL_Announcement=http://api.1wxyun.com/?type=1
::ÕâÊÇ¿¨ÃÜÑéÖ¤µÄAPI
set  API_URL_Card=http://api.1wxyun.com/?type=17
::ÕâÊÇÓÃ»§×ª°óµÄAPI
set API_URL_Unbinding=http://api.1wxyun.com/?type=14
::ÕâÊÇ²éÑ¯¿¨ÃÜµ½ÆÚÊ±¼äµÄAPI
set API_URL_chaxun=http://api.1wxyun.com/?type=24
echo ¹«¸æ:
ECHO.---------------------------------------------------------------
curl -X POST "%API_URL_Announcement%" -d "Softid=%APP_ID%"
ECHO.
ECHO.---------------------------------------------------------------
ECHO.
echo 1.ÑéÖ¤¿¨ÃÜ
echo 2.²éÑ¯¿¨ÃÜµ½ÆÚÊ±¼ä
echo 3.½â°ó¿¨ÃÜ
echo 4.·µ»ØÖ÷²Ëµ¥
set /p input=ÊäÈëÑ¡Ïî£º
if %input%==1 goto yanzheng_BL
if %input%==2 goto card
if %input%==3 goto unbind
if %input%==4 goto MENU
goto first



:unbind_BL
ECHO.
set /p card_NUM=ÇëÊäÈë¿¨ÃÜ£º
set post_unbind="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd=&Type=1"
curl -X POST "%API_URL_Unbinding%" -d %post_unbind%
echo.
pause
goto first





:card_BL
ECHO.
set /p card_NUM=ÇëÊäÈë¿¨ÃÜ£º
echo.
echo.
ECHO ¿¨ÃÜµ½ÆÚÊ±¼ä£º
set post_card="Softid=%APP_ID%&UserName=%card_NUM%&UserPwd="
curl -s -X POST "%API_URL_chaxun%" -d %post_card%
ECHO.
pause >nul
ECHO °´ÏÂÈÎÒâ¼ü·µ»ØÑéÖ¤
goto first_BL















:yanzheng_BL
ECHO.
::¶¨Òå±äÁ¿
set /p card_NUM=ÇëÊäÈë¿¨ÃÜ£º
set post_data="Softid=%APP_ID%&Card=%card_NUM%&Version=1.0"
set post_curl=curl 
set post_s=-s 
set post_X=-X 
set post_d=POST 
set post_API="%API_URL_Card%" 
set post_d2=-d 

set response=%post_curl%%POST_s%%post_X%%post_d%%post_API%%post_d2%%post_data%
::´Ë´¦¼ì²â·µ»ØµÄTokenÖµµÄ¿ªÍ·ÊÇ·ñÎª´óÐ´×ÖÄ¸£¬Èç¹û²»ÊÇÔòÈÏÎªÑéÖ¤Ê§°Ü
echo & %response% | findstr "^[A-Z]" >nul
if errorlevel 1 (
    echo ÑéÖ¤Ê§°Ü£¬·µ»ØµÄ´íÎóÂëÊÇ£º
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    ECHO.Çë²é¿´´íÎóÂë¶ÔÕÕ£¡
    pause
    start https://skybox.mom/¹¤¾ßÏä/´íÎóÂë¶ÔÕÕ.txt
    pause
    goto first
) else (

    echo.& %response%
    echo ÑéÖ¤³É¹¦£¬·µ»ØµÄTokenÊÇ£º
    echo.---------------- & %response%
    ECHO.
    ECHO.----------------
    pause
    goto BL_main
)
pause


:BL_main
ECHO.=----------------------------------------------------------=
ECHO.½âËøBootLoader
ECHO.=----------------------------------------------------------=
ECHO.
cd /d bin
mtk payload
mtk da seccfg unlock
ECHO.Èô½âËøÍê³Éºó³öÏÖ¿ª»ú³öÏÖÐ¡×ÖÎÞ·¨½øÈëÏµÍ³£¬Çë°´×¡¿ª»ú¼üÖ±ÖÁÏµÍ³ÖØÐÂÆô¶¯¡£
ECHO.°´ÏÂÈÎÒâ¼ü·µ»ØÖ÷²Ëµ¥
pause >nul
goto MENU
