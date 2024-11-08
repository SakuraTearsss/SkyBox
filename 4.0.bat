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

:: ÉèÖÃµ±Ç°Èí¼ş°æ±¾
set "current_version=4.0"
:: ÉèÖÃÔÆ¶Ë°æ±¾ÎÄ¼şµÄURL
set "url=https://gitee.com/midstream-dream/coke/raw/master/banben"
:: ÉèÖÃÁÙÊ±ÎÄ¼şÂ·¾¶
set "temp_file=%TEMP%\version.txt"

:: ÏÂÔØÔÆ¶ËµÄ°æ±¾ÎÄ¼ş
echo ÕıÔÚ´ÓÔÆ¶ËÏÂÔØ×îĞÂ°æ±¾ĞÅÏ¢...
echo µÚÒ»´Î½øĞĞ´Ë¹ı³Ì¿ÉÄÜ½ÏÂı,ÇëÄÍĞÄµÈ´ı...
certutil -urlcache -split -f "%url%" "%temp_file%"

:: ¼ì²éÏÂÔØÊÇ·ñ³É¹¦
if errorlevel 1 (
    echo ÏÂÔØ°æ±¾ĞÅÏ¢Ê§°Ü,Çë¼ì²éÍøÂçÁ¬½Ó»òÉÔºóÔÙÊÔ¡£
    Echo °´ÏÂÈÎÒâ¼üÍË³ö½Å±¾...
    pause >nul
    exit /b
)

:: ´ÓÏÂÔØµÄÎÄ¼şÖĞ¶ÁÈ¡×îĞÂ°æ±¾ºÅ
for /f "delims=" %%i in ('type "%temp_file%"') do set "latest_version=%%i"

:: ÇåÀíÁÙÊ±ÎÄ¼ş
del "%temp_file%"

:: ´òÓ¡µ±Ç°°æ±¾ºÍ×îĞÂ°æ±¾ĞÅÏ¢
echo µ±Ç°Èí¼ş°æ±¾: %current_version%
echo ÔÆ¶Ë×îĞÂ°æ±¾: %latest_version%

:: ±È½Ï°æ±¾ºÅ
if %current_version% LSS %latest_version% (
    echo ·¢ÏÖĞÂ°æ±¾£¬Çë¸üĞÂÄãµÄÈí¼ş¡£
    start https://co-ke.us.kg/%E5%88%B7%E6%9C%BA%E5%B7%A5%E5%85%B7
    pause
    exit /b
) else (
    echo ÄãÕıÔÚÊ¹ÓÃµÄÒÑÊÇ×îĞÂ°æ±¾¡£
    ECHO.°´ÏÂÈÎÒâ¼üÇ°ÍùÖ÷²Ëµ¥...
    pause >nul
    goto example
)



:example
CLS
chcp 936>nul
cd /d %~dp0
if exist bin (cd bin) else (ECHO.ÕÒ²»µ½bin & goto Download)
::¼ÓÔØÅäÖÃ,Èç¹ûÓĞ×Ô¶¨ÒåµÄÅäÖÃÎÄ¼şÒ²¿ÉÒÔ¼ÓÔÚÏÂÃæ
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
::Çå³ıÑÕÉ«±äÁ¿
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
ECHO.%RED%¹¤¾ßÏä½«±£³ÖÃâ·ÑÇÒ¿ªÔ´!!
ECHO.
ECHO.%GREEN%ÄãµÄÉè±¸µ±Ç°Õı´¦ÓÚ:%chk_connect_devstate%
cd /d %~dp0bin
ECHO.
ECHO.%PURPLE%1.Ò»¼ü°ë×Ô¶¯ROOT   2.¿ì½İÖØÆô        3.¼ì²âÉè±¸Á´½Ó
ECHO.%CYAN%4.ADBÃüÁîĞĞ       5.Ë¢ÈëÈÎÒâ·ÖÇø     6. MTKÇ¿½âBL
ECHO.%YELLOW%7.MTKCLIENT       8.ADB¼¤»îÈí¼ş     9.ÔÆ¶ËBOOT¿â 
ECHO.
ECHO.%LIGHTGREEN%A.ÔŞÖúÎÒÃÇ        B.¾èÔù        C.Ë¢ĞÂ
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
ECHO.%GREEN%ÄãµÄÉè±¸µ±Ç°Õı´¦ÓÚ:%chk_connect_devstate%
Pause
goto MENU






:root
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.Ñ¡Ôñ°²×¿°æ±¾
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.³ö³§°²×¿13
ECHO.2.³ö³§·Ç°²×¿13(ºóĞøÉı¼¶µ½13Ò²Ñ¡Õâ¸ö)
ECHO.A.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëĞòºÅ:
if "%choice%"=="1" set "fall=BOOT" & goto ROOT1
if "%choice%"=="2" set "fall=init_boot" & goto ROOT1
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
set /p choice=ÇëÊäÈëĞòºÅ:
if %choice%==1 goto Magisk
if %choice%==2 goto APATCH
if %choice%==A goto MENU
goto MENU



:magisk
CLS
set KEEPVERITY=false
set KEEPFORCEENCRYPT=false
cd /d %~dp0
set /p bootPath="Çë°ÑÒªË¢ÈëµÄÎÄ¼şÍÏµ½´Ë´¦»òÊäÈëÂ·¾¶: "
set "Path=%~dp0bin;%Path%"
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
cd /d "%~dp0bin\ADB"
ECHO.
ECHO.µ¯³öÁ½¸öOKAY¼´Îª³É¹¦
fastboot flash "%fall%" "%~dp0Magisk-boot.img"
del "%~dp0Magisk-boot.img" 2>nul
ECHO.ÊÇ·ñ½«Éè±¸ÖØÆô?
cd /d %~dp0bin\ADB
ECHO.1.ÊÇ   2.·ñ   A.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëĞòºÅ:
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
:: ¶¨Òå¹¤¾ßËùÔÚµÄÂ·¾¶£¬È·±£ÊÇ¾ø¶ÔÂ·¾¶
set "TOOL_PATH=%~dp0bin\ApatchPatch\"
:: È·±£TOOL_PATH±äÁ¿ÕıÈ·
if not exist "!TOOL_PATH!magiskboot.exe" (
    echo ¹¤¾ßÂ·¾¶²»ÕıÈ·£¬ÕÒ²»µ½magiskboot.exe¡£
    pause
    goto MENU
)
set /p bootPath="Çë°ÑÒªBOOTÎÄ¼şÍÏµ½´Ë´¦»òÊäÈëÂ·¾¶(Ä¿Ç°APATCHÖ»Ö§³Öboot²»Ö§³Öinit_boot): "
echo.ÇëÊäÈëÄãµÄ³¬¼¶ÃÜÔ¿%RED%(Ò»¶¨Òª¼Ç×¡ÃÜÔ¿!)£º
ECHO.%WHITE%
set /p "superKey="
:: Ê¹ÓÃ¾ø¶ÔÂ·¾¶µ÷ÓÃ¹¤¾ß
set "magiskboot=%TOOL_PATH%magiskboot.exe"
set "kptools=%TOOL_PATH%kptools-x86_64-win.exe":: ÇĞ»»µ½¹¤¾ßÄ¿Â¼
pushd "!TOOL_PATH!"
:: ½â°üboot.imgµ½magiskbootËùÔÚÄ¿Â¼
echo ÕıÔÚ½â°üboot.imgµ½ %TOOL_PATH%...
"!magiskboot!" unpack "!bootPath!"
if errorlevel 1 (
    echo ½â°üÊ§°Ü£¬Çë¼ì²émagiskboot¹¤¾ßÊÇ·ñ¿ÉÓÃ¡£
    popd
    pause
    exit /b
)
:: ¼ì²é²¢ÖØÃüÃû½â°üºóµÄkernelÎÄ¼ş
if exist "kernel" (
    echo ÕıÔÚÖØÃüÃûkernelÎÄ¼şÎªkernel-b...
    ren "kernel" "kernel-b"
    if errorlevel 1 (
        echo ÖØÃüÃûÊ§°Ü¡£
        popd
        pause
        exit /b
    )
) else (
    echo ½âÑ¹ºóµÄkernelÎÄ¼ş²»´æÔÚ¡£
    popd
    pause
    exit /b
)
:: ĞŞ²¹ÄÚºË
echo ĞŞ²¹ÄÚºË...
"!kptools!" -p --image "kernel-b" --skey="!superKey!" --kpimg "kpimg-android" --out "kernel"
if errorlevel 1 (
    echo ĞŞ²¹ÄÚºËÊ§°Ü£¬Çë¼ì²ékptools¹¤¾ßÊÇ·ñ¿ÉÓÃ¡£
    popd
    pause
    exit /b
)
:: ÖØĞÂ´ò°üboot.img
echo ÖØĞÂ´ò°üboot.img...
"!magiskboot!" repack "!bootPath!"
if errorlevel 1 (
    echo ÖØĞÂ´ò°üÊ§°Ü£¬Çë¼ì²émagiskboot¹¤¾ßÊÇ·ñ¿ÉÓÃ¡£
    popd
    pause
    exit /b
)
:: ÇåÀíÁÙÊ±ÎÄ¼ş
echo ÕıÔÚÇåÀíÁÙÊ±ÎÄ¼ş...
del "kernel" 2>nul
del "kernel-b" 2>nul
del "ramdisk.cpio" 2>nul
echo ÇåÀíÍê³É¡£
:: ÍË³ö¹¤¾ßÄ¿Â¼
popd
:: Íê³ÉĞÅÏ¢
ECHO.ĞŞ²¹Íê³É°´ÏÂÈÎÒâ¼üË¢Èë...
pause >nul
goto flash_apatch
:flash_apatch
CLS
cd /d %~dp0bin\ApatchPatch
ECHO.ÇëÏÈ½«Éè±¸ÖØÆôµ½fastboot
fastboot flash boot new-boot.img
ECHO.
ECHO.³öÏÖÁ½¸öOKAY¼´Îª³É¹¦







:CHKDEV
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.¼ì²éÉè±¸Á¬½Ó
ECHO.=--------------------------------------------------------------------=
ECHO.
ECHO.1.¼ì²éÉè±¸Á¬½Ó(È«²¿)
ECHO.2.¼ì²éÉè±¸Á¬½Ó(ÏµÍ³)
ECHO.3.¼ì²éÉè±¸Á¬½Ó(Recovery)
ECHO.4.¼ì²éÉè±¸Á¬½Ó(sideload)
ECHO.5.¼ì²éÉè±¸Á¬½Ó(Fastboot)
ECHO.6.¼ì²éÉè±¸Á¬½Ó(edl)
ECHO.7.¼ì²éÉè±¸Á¬½Ó(diag901d)
ECHO.8.¼ì²éÉè±¸Á¬½Ó(sprdboot)
ECHO.9.¼ì²éÉè±¸Á¬½Ó(mtkbrom)
ECHO.10.¼ì²éÉè±¸Á¬½Ó(mtkpreloader)
ECHO.11.¼ì²éÉè±¸Á¬½Ó(È«²¿) ¸´²é
ECHO.12.¼ì²éÉè±¸Á¬½Ó(ÏµÍ³) 2Ãëºó¸´²é
ECHO.A.·µ»Ø²Ëµ¥
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
ECHO. & ECHOC {%c_s%}Íê³É. {%c_h%}°´ÈÎÒâ¼ü·µ»ØÖ÷²Ëµ¥...{%c_i%}{\n}& pause>nul & goto MENU






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
set /p choice=ÇëÊäÈëĞòºÅ:
if "%choice%"=="1" set target=system
if "%choice%"=="2" set target=recovery
if "%choice%"=="3" set target=sideload
if "%choice%"=="4" set target=fastboot
if "%choice%"=="5" set target=fastbootd
if "%choice%"=="6" set target=edl
if "%choice%"=="7" set target=diag901d
call chkdev all rechk 1
cd /d %~dp0bin\chkdev
ECHO.½øÈë%target%Ä£Ê½... & call chk_reboot all

ECHO. & ECHOC {%c_s%}Íê³É. {%c_h%}°´ÈÎÒâ¼ü·µ»ØÖ÷²Ëµ¥...{%c_i%}{\n}& pause>nul & goto MENU




:ADB
CLS
CD /d %~dp0bin\ADB
CMD




:flash
CLS
ECHO.=--------------------------------------------------------------------=
ECHO.Ë¢ÈëÈÎÒâ·ÖÇø
ECHO.=--------------------------------------------------------------------=
cd /d "%~dp0bin\ADB"
set /p path="ÇëÊäÈëÒªË¢ÈëµÄ·ÖÇø: "
set /p file="ÇëÊäÈë»òÍÏÈëÒªË¢ÈëµÄÎÄ¼şÓ³Ïñ: "
echo Ë¢Èë´íÎóµÄÓ³Ïñ¿ÉÄÜµ¼ÖÂÄãµÄÉè±¸±ä×©£¬Çë½÷É÷²Ù×÷£¡Èô²Ù×÷Ê§°Ü×÷Õß²»¸ºÈÎºÎÔğÈÎ!
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






:BL
CLS
ECHO.=----------------------------------------------------------=
ECHO.½âËøBootLoader
ECHO.=----------------------------------------------------------=
ECHO.
cd /d %~dp0bin
mtk da seccfg unlock
ECHO.Èô½âËøÍê³Éºó³öÏÖ¿ª»ú³öÏÖĞ¡×ÖÎŞ·¨½øÈëÏµÍ³Çë°´×¡¿ª»ú¼ü
ECHO.°´ÏÂÈÎÒâ¼ü·µ»ØÖ÷²Ëµ¥
pause >nul
goto MENU






:ADB_ACTIVE
CLS
cd /d "%~dp0bin\ADB"
ECHO.ÇëÑ¡ÔñÄãÒª¼¤»îµÄÈí¼ş:
ECHO.1.shizuku   2.Ğ¡ºÚÎİ
ECHO.3.ºÚÓò      4.¿Õµ÷¹·(É÷ÖØ!)
ECHO.5.±ùÏä(Ice Box)  6.·µ»ØÖ÷²Ëµ¥
set /p choice=ÇëÊäÈëĞòºÅ:
if "%choice%"=="1" adb shell sh /sdcard/Android/data/moe.shizuku.privileged.api/start.sh
if "%choice%"=="2" adb shell sh /storage/emulated/0/Android/data/web1n.stopapp/files/starter.sh
if "%choice%"=="3" adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh
if "%choice%"=="4" adb shell dpm set-device-owner me.yourbay.airfrozen/.main.core.mgmt.MDeviceAdminReceiver
if "%choice%"=="5" adb shell sh /sdcard/Android/data/com.catchingnow.icebox/files/start.sh
if "%choice%"=="6" goto MENU
goto MENU




:Download
CLS
ECHO.²İÄâÂğbÄãÃ»½âÑ¹
ECHO.²İÄâÂğbÄãÃ»½âÑ¹
ECHO.²İÄâÂğbÄãÃ»½âÑ¹
ECHO.²İÄâÂğbÄãÃ»½âÑ¹
ECHO.Éµ±Æ,Äã²»»á½âÑ¹Ë¢Ê²Ã´»ú
pause

