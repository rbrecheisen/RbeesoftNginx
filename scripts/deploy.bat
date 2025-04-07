@echo off

setlocal enabledelayedexpansion

set PROJECT_NAME=RbeesoftNginx
set SERVICE_NAME=%~1
set PRIVATE_KEY=C:\Users\r.brecheisen\.ssh\Hostnet_VPS_private
set SSH_IP=185.95.13.93
set SSH_ROOT=root@%SSH_IP%
set SSH_RALPH=ralph@%SSH_IP%

if "%SERVICE_NAME%"=="" (
    echo "Deploying RbeesoftNginx to production..."
) else (
    echo "Deploying %SERVICE_NAME% to production..."
)
pause

git add -A && git commit -m "Deploying RbeesoftNginx" && git push

ssh -i %PRIVATE_KEY% %SSH_RALPH% "~/clone-project.sh %PROJECT_NAME% && cd ~/dev/%PROJECT_NAME% && chmod +x scripts/remote/*.sh"
ssh -i %PRIVATE_KEY% %SSH_ROOT% "cd /home/ralph/dev/%PROJECT_NAME% && scripts/remote/run.sh %SERVICE_NAME%"

endlocal