
@shift /0
@shift /0
@echo off
Color c
Title        Bruh + xD  samgreen.  Advanced Windows Event Log Cleaner

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.
echo All Event Logs have been cleared!
goto theEnd

:do_clear
echo clearing %1
wevtutil.exe cl %1
exit /b 0

:noAdmin
Color d
echo Current user permissions to execute this .BAT file are inadequate.
echo This .BAT file must be run with administrative privileges.
echo Exit now, right click on this .BAT file, and select "Run as administrator".  
pause >nul
@shift /0
NETSH WINSOCK RESET
NETSH INT IP RESET
NETSH INTERFACE IPV4 RESET
NETSH INTERFACE IPV6 RESET
NETSH INTERFACE TCP RESET
NETSH INT RESET ALL
IPCONFIG /RELEASE
IPCONFIG /RELEASE
IPCONFIG /FLUSHDNS
NBTSTAT -R
NBTSTAT -RR
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL DISABLE
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL ENABLE







exit