#!/bin/sh

top -n 1 | grep Cpu | awk '{print $8 , $10 }' > /root/opt/data/mon/sys/cpu.txt # idle iowait
free -m | grep Mem | awk '{print $2 , $3 , $4 }' > /root/opt/data/mon/sys/mem.txt # total used free
