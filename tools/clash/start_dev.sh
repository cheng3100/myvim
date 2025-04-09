#! /bin/sh

op=start

if [ -n "$1" ]
then
case "$1" in
	start) op=start ;;
	stop) op=stop ;;
	check|status) op=check ;;
	* ) echo $1 is not a option
		exit;;
esac
fi

# kill clash
echo "[*] check clash pid:..."
# clash_pid=$(ps  -ef | grep  -e "clash-linux" | grep -v "grep" | tr -s ' ' | cut -d ' ' -f 2)
clash_pid=$(ps  -ef | grep  -e "clash" | grep -v "grep" | tr -s ' ' | cut -d ' ' -f 2)

if [ "$op" = check ]
then
if [ -z ${clash_pid} ]
then
	echo "[-] clash not running."
else
	echo "[+] clash is running, pid: ${clash_pid}"
fi
	exit
fi


if [ -z ${clash_pid} ]
then
	echo "[-] clash not running"
else
	echo "[-] clash pid: ${clash_pid}, kill... "
	kill ${clash_pid}
fi

echo $op

if [ "$op" = stop ]
then
	exit
fi

echo "[*] start clash"

c_path=$(dirname $(realpath "$0"))

# ${c_path}/clash-linux-amd64-v3-v1.10.6 -d ${c_path}/. > /dev/null 2>&1 &
${c_path}/clash -d ${c_path}/. > /dev/null 2>&1 &
