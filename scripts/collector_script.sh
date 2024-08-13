#!/bin/bash
echo
echo "cpu health check:"
echo
mpstat
#iostat,top
echo
echo "memory usage"
free -h
echo
echo "disk usage"
echo
df -h
echo
echo "network interface status and their throughput"
ifconfig
#ip -s link
echo
echo " running process"
ps aux
# ps aux | awk '$8=="R"{print$0}'
echo
echo "system uptime"
uptime
echo
echo "critical errors in system logs"
journalctl -p 3  -xb
echo
