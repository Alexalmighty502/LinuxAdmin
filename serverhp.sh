echo "=====Private IP Address====="
/sbin/ifconfig ens33 | grep -i mask | awk '{print $2}'
echo "=====Public IP Address====="
curl ifconfig.me
echo ""
echo "=====Internet Protocol Statistics====="
netstat -s | less
echo ""
echo "=====CPU Usage====="
mpstat
echo "=====RAM Usage(MB)====="
free -m
echo "=====Running Processes====="
ps
echo "=====Disc Statistics====="
df -h