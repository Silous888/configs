@echo off
setlocal

:: Define user base directory
set "USER_DIR=%USERPROFILE%"

:: Define destination root (script directory)
set "DEST_ROOT=%~dp0"

:: ----- GlazeWM -----
set "SOURCE=%USER_DIR%\.glzr\glazewm"
set "DEST=%DEST_ROOT%glazewm"
xcopy "%SOURCE%\*" "%DEST%\" /E /I /Y

:: ----- yasb -----
set "SOURCE=%USER_DIR%\.config\yasb"
set "DEST=%DEST_ROOT%yasb"
xcopy "%SOURCE%\*" "%DEST%\" /E /I /Y

:: ----- whkdrc -----
set "SOURCE=%USER_DIR%\.config\whkdrc"
set "DEST=%DEST_ROOT%whkdrc"
if not exist "%DEST%" mkdir "%DEST%"
copy "%SOURCE%" "%DEST%\whkdrc" /Y

:: ----- komorebi -----
set "SOURCE=%USER_DIR%"
set "DEST=%DEST_ROOT%komorebi"
if not exist "%DEST%" mkdir "%DEST%"
for %%F in ("%SOURCE%\komorebi*") do (
    if exist "%%F" copy "%%F" "%DEST%\" /Y >nul
)


endlocal
