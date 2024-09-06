@echo off

:: 获取当前时间，格式为 YYYY-MM-DD HH:MM
for /f "tokens=1-4 delims=/-: " %%a in ('echo %date% %time%') do (
    set year=%%c
    set month=%%a
    set day=%%b
    set hour=%%d
)

set minute=%time:~3,2%
set current_time=%year%-%month%-%day% %hour%:%minute%

:: 设置提交信息
set commit_message=add(image): %current_time%

:: 添加所有更改到暂存区
git add .

:: 提交更改并使用当前时间作为提交信息
git commit -m "%commit_message%"

:: 推送更改到远程仓库
git push origin main

:: 等待用户按任意键退出
pause