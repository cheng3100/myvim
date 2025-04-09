#! /bin/sh

# kill clash
echo "[+] check clash pid:..."
clash_pid=$(ps  -ef | grep  -e "clash" | grep -v "grep" | tr -s ' ' | cut -d ' ' -f 2)


if [ -z ${clash_pid} ]
then
	echo "[-] clash not running"
else
	echo "[-] clash pid: ${clash_pid}, kill... "
	kill ${clash_pid}
fi

echo "[+] start clash"

./clash-linux-amd64-v3-v1.10.6 -d . &
