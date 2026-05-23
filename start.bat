@echo off
chcp 65001 >nul
cd /d "%~dp0"

set NODE=%~dp0.tools\node-v22.16.0-win-x64\node.exe
set NPM=%~dp0.tools\node-v22.16.0-win-x64\npm.cmd

if not exist "dist\index.html" (
  echo 正在构建...
  call "%NPM%" install
  call "%NPM%" run build
)

echo.
echo  MOLLY H5 本地预览
echo  浏览器打开: http://127.0.0.1:8080
echo  按 Ctrl+C 停止
echo.

"%NODE%" "%~dp0scripts\serve.mjs"
