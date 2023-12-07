#!/bin/bash
# 并发执行(&符号表示{}内的命令将在后台执行，后面的命令不用等前面的命令执行完就可以执行了)
# (wait是将当前脚本进行下的子进程都执行结束，然后在执行后面的语句)
 
echo -e "并发执行:"
all_num=10
a=$(date +%H%M%S)
 
for ((i=1;i<=${all_num};i++))
do
{
	sleep 1
	echo ${i}
}&
done
 
wait
 
b=$(date +%H%M%S)
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"