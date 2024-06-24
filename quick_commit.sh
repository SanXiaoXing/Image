#!/bin/bash

# 获取当前时间，格式为 YYYY-MM-DD HH:MM
commit_message=$(date +"%Y-%m-%d %H:%M")

# 添加所有更改到暂存区
git add .

# 提交更改并使用当前时间作为提交信息
git commit -m "${commit_message}"

# 推送更改到远程仓库
git push