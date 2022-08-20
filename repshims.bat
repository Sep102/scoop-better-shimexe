@echo off

if not defined SHIM (
  if exist "%~dp0"\bin\shim.exe (
    set SHIM="%~dp0"\bin\shim.exe
  ) else if exist "%~dp0"\shim.exe (
    set SHIM="%~dp0"\shim.exe
  ) else (
    echo Could not find shim.exe
    exit /b 0
  )
)

if not exist %SHIM% (
  echo Could not find shim.exe at %SHIM%
  exit /b 0
)

if not defined SCOOP set SCOOP=%USERPROFILE%\scoop

for %%x in ("%SCOOP%\shims\*.shim") do (
  echo Replacing shim for %%x with %%~dpnx.exe
  copy /Y %SHIM% "%%~dpnx.exe"
)

if not defined SCOOP_GLOBAL set SCOOP_GLOBAL=%ProgramData%\scoop

for %%x in ("%SCOOP_GLOBAL%\shims\*.shim") do (
  echo Replacing shim for %%x with %%~dpnx.exe
  copy /Y %SHIM% "%%~dpnx.exe"
)
