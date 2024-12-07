set "url=https://gitee.com/midstream-dream/coke/raw/master/banben"
set "temp_file=%TEMP%\version.txt"
certutil -urlcache -split -f "%url%" "%temp_file%"
for /f "delims=" %%i in ('type "%temp_file%"') do set "latest_version=%%i"
del "%temp_file%"
set framwork_ver=%latest_version%