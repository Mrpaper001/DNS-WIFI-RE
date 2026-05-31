@echo off
set "googlem=8.8.8.8"
set "googlea=8.8.4.4"
set "claflam=1.1.1.1"
set "claflaa=1.0.0.1"

set /p "ssid=ssid: "
echo         ___DNS-WIFI-RE_v_1.0_
echo.
echo 1.google  		2.cloudflare
echo.
echo 3.more
set /p "cht=index: "

set "cht=%cht: =%"

if "%cht%"=="1" (
	set "main=%googlem%"
	set "alternative=%googlea%"	
	goto DNS-WIFI-RE-PROCESS
)

if "%cht%"=="2" (
	set "main=%claflam%"
	set "alternative=%claflaa%"	
	goto DNS-WIFI-RE-PROCESS
)

if "%cht%"=="3" (
	set /p "main=main dns: "
	set /p "alternative=alternative dns: "
	goto DNS-WIFI-RE-PROCESS
)



:DNS-WIFI-RE-PROCESS
echo DNS-WIFI-RE v 1.0
netsh interface ip set dns "%ssid%" static %main%
netsh interface ip add dns "%ssid%" %alternative% index=2
ipconfig /flushdns
echo new dns is %main% and %alternative% for %ssid%
pause
exit
