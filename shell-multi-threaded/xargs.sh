#!/bin/bash
# 并发执行(使用xargs -P控制并发数)
 
all_num=10
thread_num=5
 
a=$(date +%H%M%S)
 
# cp -rf /root/result /root/test-patch/ | xargs -n 1 -I {} -P ${thread_num} sh -c
seq 1 ${all_num} | xargs -n 1 -I {} -P ${thread_num} sh -c "sleep 1;echo {}"
 
b=$(date +%H%M%S)
 
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"