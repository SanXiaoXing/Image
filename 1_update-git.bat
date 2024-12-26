@echo off

:: 使用 WMIC 获取当前日期和时间，格式为 YYYY-MM-DD HH:MM
for /f "tokens=1,2 delims=." %%a in ('wmic os get localdatetime ^| find "."') do (
    set datetime=%%a
)

:: 提取年月日和小时分钟，并重新格式化
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%
set hour=%datetime:~8,2%
set minute=%datetime:~10,2%

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
