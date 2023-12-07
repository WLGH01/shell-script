#!/bin/bash
# 串行执行命令
echo -e "串行执行:"
all_num=10
a=$(date +%H%M%S)
 
for ((i=1;i<=${all_num};i++))
do
{
	sleep 1
	echo ${i}
}
done
 
b=$(date +%H%M%S)
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"