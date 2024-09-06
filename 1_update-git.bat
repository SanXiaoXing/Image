@echo off
:: 关闭显示命令回显
setlocal

:: 获取当前日期，格式为 YYYY-MM-DD
for /f "tokens=1-3 delims=/- " %%a in ("%DATE%") do (
    set month=%%a
    set day=%%b
    set year=%%c
)

:: 处理不同区域日期格式，例如 MM/DD/YYYY 或 DD/MM/YYYY
if %year% lss 1000 (
    set temp=%year%
    set year=%month%
    set month=%temp%
)

:: 获取当前时间，精确到分钟，格式为 HH:MM
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set hour=%%a
    set minute=%%b
)

:: 拼接当前时间，格式为 YYYY-MM-DD HH:MM
set current_time=%year%-%month%-%day% %hour%:%minute%

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
