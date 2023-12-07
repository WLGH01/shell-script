#!/bin/bash
# 并发执行(&符号表示{}内的命令将在后台执行，后面的命令不用等前面的命令执行完就可以执行了)
# 控制并发数量(根据自己的当前业务需求)
 
echo -e "并发执行(控制并发数量，利用管道，文件描述符):"
all_num=10
# 并发的进程数
thread_num=5
a=$(date +%H%M%S)
 
# mkfifo 创建有名管道
myfifo="fd1"
mkfifo=${myfifo}
 
# 创建文件描述符，以可读(<)和可写(>)的方式关联管道文件，这时候文件描述符2就有了有名管道文件的所有特性
# 关联之后的文件描述符拥有管道文件的所有特性，所以可以将管道文件进行删除，之后使用文件描述符2即可
exec 2<>${myfifo}
rm -f ${myfifo}
 
# 为文件描述符创建占位信息(&2表述文件描述符2，往管道里面放入了一个“令牌”，相当于最多可以开启有thread_num个进程)
for ((i=1;i<=${thread_num};i++))
do
{
  echo >&2
}
done
 
# 命令
for ((i=1;i<=${all_num};i++))
do
# 代表从管道中获取一个令牌(一共有thread_num个进程，现在使用一个进程，2是代表文件描述符)
read -u2
{
	sleep 1
	echo ${i}
    # 代表执行完当前命令，将这个令牌又放入到管道中(使用完这个进程，将这个进程又返还回去)
    echo >&2 
}&
done
 
wait
 
# 命令执行完成，关闭文件描述符的读写
exec 2<&-
exec 2>&-
b=$(date +%H%M%S)
echo -e "startTime:\t$a"
echo -e "endTime:\t$b"