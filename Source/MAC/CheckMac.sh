#!/bin/bash
mac1=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f1)
mac2=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f2)
mac3=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f3)
mac4=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f4)
mac5=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f5)
mac6=$(ifconfig |grep enp2|cut -d ' ' -f9| cut -d ":" -f6)
now_mac=$mac1$mac2$mac3$mac4$mac5$mac6
tar_mac=$(cat /data/SCB100_Tool/RunTest/mac/macidLog |tail -n1 |cut -f3 -d ' ')
tar_mac=${tar_mac^^}
line=$(cat /data/SCB100_Tool/RunTest/mac/macidLog |wc -l)
Num=$(cat /data/SCB100_Tool/RunTest/mac/macidLog |tail -n1 |cut -f1 -d ' ')
docDate=$(cat /data/SCB100_Tool/RunTest/mac/macidLog | tail -n1 | cut -f4 -d ' ')
if [ "$Num" -gt 0 ] 2>/dev/null ;then
	if [ ! -n "$docDate" ];then
		if [ "$now_mac" == "$tar_mac" ];
		then
			echo "MAC $tar_mac  Change SUCCESS."
			mem=$(cat /data/SCB100_Tool/RunTest/mac/macidLog |tail -n1)$(date '+%Y/%m/%d')
			sed -i '$d' /data/SCB100_Tool/RunTest/mac/macidLog
			echo $mem >> /data/SCB100_Tool/RunTest/mac/macidLog
			#Jump SUCCESS
				
		else
			echo "FAILED : MAC Change FAILED."
		fi
	read -n 1 -r -s -p $'Press any key to close.. \n'
	fi

else
	echo "$Num is not num"
fi

