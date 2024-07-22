#!/bin/bash
mac1=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f1)
mac2=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f2)
mac3=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f3)
mac4=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f4)
mac5=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f5)
mac6=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f6)
old_mac=$mac1$mac2$mac3$mac4$mac5$mac6
nic=$2
newmacid=$1
p=$(pwd)
Num=$(cat ${p}"/MAC/macidLog" | tail -n1 |cut -f1 -d ' ' )
res=$(${p}/MAC/Linux_x64/OEM_Mfg/eeupdate64e /nic=1 /mac=$newmacid |grep -c Done)
if [ "$1" = "" ];then
	echo "Input is NULL"
else
	if [ "$Num" -gt 0 ] 2>/dev/null ;then
		nic=0
	else
		Num=0
	fi
	if [ "$res" == "0" ]
	then
		echo "Failed : Updating MAC Address to $1 Failed."
	else
		Num=$((Num+1))
		echo "Updating MAC Address to $1 Done."
		echo "$Num $old_mac $newmacid ">> ${p}/MAC/macidLog
		read -n 1 -r -s -p $'Press any key to restart computer.\n'
		reboot
	fi
fi

#read -n 1 -r -s -p $'Press any key to close..\n'
