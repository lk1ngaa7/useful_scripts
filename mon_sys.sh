#!/bin/sh
for i in {1..20}
do
    sleep 3
    echo $i
    #top -n 1 | grep Cpu | awk '{print $8 , $10 }' > /root/opt/data/mon/sys/cpu.txt # idle iowait
    vmstat | sed -n '3p' | awk '{print $15 , $16}' > /root/opt/data/mon/sys/cpu.txt # idle iowait
    free -m | grep Mem | awk '{print $2 , $3 , $4 }' > /root/opt/data/mon/sys/mem.txt # total used free
    /root/ifstat-1.1/ifstat  -i eth1 2 1 | sed -n '3p' | awk '{print $1,$2}' > /root/opt/data/mon/sys/net.txt
done
