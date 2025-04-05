@echo off

setlocal

set "USER=ralph"
if /I "%~1"=="--root" (
    set "USER=root"
)

set PRIVATE_KEY=C:\Users\r.brecheisen\.ssh\Hostnet_VPS_private
set SSH_IP=185.95.13.93
set PROJECT_NAME=RbeesoftAppTemplate

ssh -t -i %PRIVATE_KEY% %USER%@%SSH_IP% "cd /home/ralph && bash -i"

endlocal