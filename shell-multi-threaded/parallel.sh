#!/bin/bash
# parallal shell并发神器
# 使用parallel命令控制并发数
# 代替了shell中的循环
# 线程数量可控制(原生shell循环做不到)
# 多线程输出可保证顺序(原生shell循环做不到)
# sudo yum install parallel 使用命令安装

# 例 使用parallal并行执行5个应用，使用负载不超过2
parallel --jobs 5 --load 2 command1 ::: arg1 arg2 arg3

# parallel基本语法
parallel command1 ::: arg1 arg2 arg3

