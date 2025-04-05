@echo off

setlocal

set /p VERSION=<VERSION

if "%~1"=="" (
    echo "Runs Django backend or React frontend"
    echo "Usage: runbackend.bat [--ui|--backend|--test]"
    exit /b 1
)

set "UI=false"
if /I "%~1"=="--ui" (
    set "UI=true"
)

set "BACKEND=false"
if /I "%~1"=="--backend" (
    set "BACKEND=true"
)

set "TEST=false"
if /I "%~1"=="--test" (
    set "TEST=true"
    set "PORT=8001"
)

if "%BACKEND%"=="true" (
    set START_DIR=%CD%
    cd rbeesoftapptemplate
    call briefcase dev
    cd %START_DIR%
) else if "%TEST%"=="true" (
    set START_DIR=%CD%
    cd rbeesoftapptemplate
    call briefcase dev --test
    cd %START_DIR%
) else if "%UI%"=="true" (
    set REACT_APP_VERSION=%VERSION%
    set REACT_APP_API_BASE_URL=http://localhost:8001
    set START_DIR=%CD%
    cd rbeesoftapptemplate\src\rbeesoftapptemplate\ui
    call npm install
    call npm start --verbose
    cd %START_DIR%
)

endlocal