@ECHO OFF
set var1=%1& set var2=%2& set var3=%3& set var4=%4& set var5=%5& set var6=%6& set var7=%7& set var8=%8& set var9=%9
goto %var1%


:COMMON
SETLOCAL
:COMMON-5
::���ͻ�ȡĬ��ѡ��
set choice_default=
echo.%var2% | find "#[" 1>nul 2>nul || goto COMMON-1
echo.%var2% | find "]#[" 1>nul 2>nul && goto COMMON-2
goto COMMON-3
:COMMON-2
for /f "tokens=2 delims=# " %%a in ('echo.%var2%') do set var=%%a
goto COMMON-4
:COMMON-3
for /f "tokens=1 delims=# " %%a in ('echo.%var2%') do set var=%%a
goto COMMON-4
:COMMON-4
for /f "tokens=1 delims=[]" %%a in ('echo.%var%') do set choice_default=%%a
::�û�����
:COMMON-1
set choice=
if "%choice_default%"=="" (
    set /p choice="������Ű�Enter����: "
) else (
 set /p choice="������Ű�Enter����(Ĭ��:%choice_default%): "
)
if not "%var2%"=="" (if not "%choice_default%"=="" (if "%choice%"=="" set choice=%choice_default%))
echo.%choice% | find "[" 1>nul 2>nul && ECHO �������, ��������ݲ�Ӧ����[]����. ����������.  && goto COMMON-5
echo.%choice% | find "]" 1>nul 2>nul && ECHO �������, ��������ݲ�Ӧ����[]����. ����������.  && goto COMMON-5
echo.%choice% | find "#" 1>nul 2>nul && ECHO �������, ��������ݲ�Ӧ����#����. ����������.  && goto COMMON-5
for /f %%a in ('echo.%choice% ^| busybox.exe sed "s/a/A/g;s/b/B/g;s/c/C/g;s/d/D/g;s/e/E/g;s/f/F/g;s/g/G/g;s/h/H/g;s/i/I/g;s/j/J/g;s/k/K/g;s/l/L/g;s/m/M/g;s/n/N/g;s/o/O/g;s/p/P/g;s/q/Q/g;s/r/R/g;s/s/S/g;s/t/T/g;s/u/U/g;s/v/V/g;s/w/W/g;s/x/X/g;s/y/Y/g;s/z/Z/g"') do set choice=%%a
if not "%var2%"=="" echo.%var2% | find "[%choice%]" 1>nul 2>nul || ECHO �������, �����ѡ���%var2%��. ����������.  && goto COMMON-5
ENDLOCAL & set choice=%choice%
goto :eof
