@echo off

setlocal enabledelayedexpansion

if "%~1"=="" (
    echo "Deploys app to remote server for acceptance testing or production."
    echo "Usage: deploy.bat [--accept|--prod]"
    exit /b 1
)

set "ACCEPT=false"
if /I "%~1"=="--accept" (
    set "ACCEPT=true"
)

set "PROD=false"
if /I "%~1"=="--prod" (
    set "PROD=true"
)

set /p VERSION=<VERSION

set PROJECT_NAME=RbeesoftAppTemplate
set APP_NAME=rbeesoftapptemplate
set PRIVATE_KEY=C:\Users\r.brecheisen\.ssh\Hostnet_VPS_private
set SSH_IP=185.95.13.93
set SSH_ROOT=root@%SSH_IP%
set SSH_RALPH=ralph@%SSH_IP%

if "%ACCEPT%"=="true" (

    echo "Not implemented"
    
) else if "%PROD%"=="true" (

    echo "Deploying %APP_NAME% (version %VERSION%) to production..."
    pause

    git add -A && git commit -m "Deploying %APP_NAME% version %VERSION%" && git push

    ssh -i %PRIVATE_KEY% %SSH_RALPH% "~/clone-project.sh %PROJECT_NAME% && cd ~/dev/%PROJECT_NAME% && chmod +x scripts/remote/*.sh"
    ssh -i %PRIVATE_KEY% %SSH_RALPH% "cd /home/ralph/dev/%PROJECT_NAME% && scripts/remote/build-ui.sh"
    ssh -i %PRIVATE_KEY% %SSH_ROOT% "cd /home/ralph/dev/%PROJECT_NAME% && scripts/remote/shutdown.sh"
    ssh -i %PRIVATE_KEY% %SSH_ROOT% "cd /home/ralph/dev/%PROJECT_NAME% && scripts/remote/build.sh"
    ssh -i %PRIVATE_KEY% %SSH_ROOT% "cd /home/ralph/dev/%PROJECT_NAME% && scripts/remote/run.sh"

)

endlocal