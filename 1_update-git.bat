@echo off

:: 调用 PowerShell 获取当前日期和时间，格式为 YYYY-MM-DD HH:MM
for /f %%i in ('powershell -command "Get-Date -Format \'yyyy-MM-dd HH:mm\'"') do set current_time=%%i

:: 设置提交信息
set commit_message=add(blog): %current_time%

:: 添加所有更改到暂存区
git add .

:: 提交更改并使用当前时间作为提交信息
git commit -m "%commit_message%"

:: 推送更改到远程仓库
git push origin main

:: 等待用户按任意键退出
pause
