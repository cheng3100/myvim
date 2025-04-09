#! /bin/bash

clash_url=$(
	curl -s https://api.github.com/repos/Kuingsmile/clash-core/releases/latest \
	| grep browser_download_url.*linux-amd64-v3 | cut -d : -f 2,3 | tr -d \" \
)

name=${clash_url##*/}

echo the latest clash link is $clash_url
echo the name is $name

echo === download $name ... ===
wget  $clash_url

if [ $? -eq 0 ]; then
	gzip -df $name
	e_name=${name%.*}
	chmod +x $e_name
	ln -sf $e_name clash
else
	echo download fail
fi


