@echo off
REM ****Simple bat to set IP without going through the Windows-menues ****

IF "%1"=="" (
Echo Add an IP behind the ChangeIP or set 0 to get initial IP. Run as admininstrator for this to work!
exit /b
)

IF "%1"=="0" (
netsh interface ipv4 set address name="Ethernet" static 192.168.30.219 255.255.255.0
echo Resetting IP on Ethernet to 192.168.30.219
) ELSE (

REM -------------------------
REM Validate IP
REM -------------------------
set ip=%~1

for /f "tokens=1-4 delims=." %%a in ("%ip%") do (
    set o1=%%a
    set o2=%%b
    set o3=%%c
    set o4=%%d
)

REM Ensure all 4 octets exist
if "!o4!"=="" (
    echo Invalid IP format.
    exit /b 1
)

netsh interface ipv4 set address name="Ethernet" static %1 255.255.255.0
echo Finished: IP on Ethernet set to %1
)

pause