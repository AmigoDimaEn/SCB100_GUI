#!/bin/bash

Buzzer()
{
    echo "/ $clear"

    # ?取?始??的日期??和??戳
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START Buzzer Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
sleep 1
    # ?出蜂??
#    echo -en '\007' > /dev/tty1
#    sleep 1
#    echo -en '\007' > /dev/tty1
#    sleep 1
#    echo -en '\007' > /dev/tty1
#
    # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END Buzzer Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[Buzzer Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}
export DISPLAY=:0.0

UnableTTYS(){
	cd /etc/systemd/system/getty.target.wants/
	systemctl mask serial-getty@ttyS0.service
	systemctl mask serial-getty@ttyS1.service 
}


#################################################################################################
#							Network Test 
#################################################################################################
Network()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START Network Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#	net_err=0												
#	net_err_msg=""
#	count_net_card=$(ifconfig|cut -d ' ' -f1 |grep e|wc -l)
#	if [ "$count_net_card" -lt "4" ];then					
#		count_net_card=$((4-count_net_card))
#		echo "Failed : Lost $count_net_card  Ethernet card."
#		net_err_msg="Failed : Lost $count_net_card  Ethernet card."
#		net_err=$((net_err+1))
#	else
#		if [ "$count_net_card" -gt 4 ];then
#			card_29f1=$(ifconfig |cut -d ' ' -f1|grep e |head -n2 |tail -n1)		
#			card_29f2=$(ifconfig |cut -d ' ' -f1|grep e |head -n3| tail -n1)
#			card_30f4=$(ifconfig |cut -d ' ' -f1|grep e |head -n4| tail -n1)
#			card_2s0=$(ifconfig |cut -d ' ' -f1|grep e |head -n5| tail -n1)
#		else
#			card_29f1=$(ifconfig |cut -d ' ' -f1|grep e |head -n1)		
#			card_29f2=$(ifconfig |cut -d ' ' -f1|grep e |head -n2| tail -n1)
#			card_30f4=$(ifconfig |cut -d ' ' -f1|grep e |head -n3| tail -n1)
#			card_2s0=$(ifconfig |cut -d ' ' -f1|grep e |head -n4| tail -n1)
#		fi
#	
#		ifconfig eth0		192.168.2.50 netmask 255.255.255.0
#		ifconfig eth2		192.168.3.51 netmask 255.255.255.0
#		ifconfig enp2s0		192.168.4.52 netmask 255.255.255.0
#		ifconfig eth1 		192.168.5.53 netmask 255.255.255.0
#	
#		net_2s0=$(ping -I 192.168.4.52 192.168.4.2 -c 1 -W 1 |grep packets |cut -d  ' ' -f4)
#		net_29f1=$(ping -I 192.168.5.53 192.168.5.2 -c 1 -W 1 |grep packets |cut -d  ' ' -f4)
#		net_29f2=$(ping -I 192.168.3.51 192.168.3.2 -c 1 -W 1 |grep packets |cut -d  ' ' -f4)
#		net_30f4=$(ping -I 192.168.2.50 192.168.2.2 -c 1 -W 1 |grep packets |cut -d  ' ' -f4)	
#	
#		if [ ! "$net_2s0" = "1" ] 
#		then
#			net_err=$((net_err+1))
#			echo "Failed : $card_2s0 failed."  #Test failed.
#			net_err_msg="${net_err_msg}\nFailed : $card_2s0 failed."
#		fi
#		
#		if [ ! "$net_29f2" = "1" ] 
#		then
#			net_err=$((net_err+1))
#			echo "Failed : $card_29f2 failed."
#			net_err_msg="${net_err_msg}\nFailed : $card_29f2 failed."
#		fi
#		 
#		if [ ! "$net_29f1" = "1" ]
#		then
#			net_err=$((net_err+1))
#			echo "Failed : $card_29f1 failed."
#			net_err_msg="${net_err_msg}\nFailed : $card_29f1 failed."
#		fi
#		
#		if [ ! "$net_30f4" = "1" ]
#		then
#			net_err=$((net_err+1))
#			echo "Failed : $card_30f4 failed."
#			net_err_msg="${net_err_msg}\nFailed : $card_30f4 failed."
#		fi
#	fi	

 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END Network Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[Network Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}
#################################################################################################
#					USB
###################################################################################################

USB()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START USB Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#---------------------------------------------------------------------------------#
## find boot device
#boot_device=$(lsblk -n -o PKNAME | grep -E 'mmcb|sda' |head -n1)
## scan USB device
#usb_devices=$(lsblk -o NAME,SIZE,TYPE | grep -E 'disk' |grep -v boot | awk '{print $1}')
## check USB device
#if [ -z "$usb_devices" ]; then
#    echo "No search USB devices."
#fi
## original string
#original_string=$usb_devices
## We want remvoe device
#substring=$boot_device
## remove device name
#filtered_usb_devices=${original_string//$substring/}
## create a test file.
#test_file="test_file.txt"
#echo "This is a test file." > $test_file
#
## test every USB devices
#for device in $filtered_usb_devices; do
#    # create a mount folder
#    mount_point="/home/root/usb_$device"
#    mkdir -p $mount_point
#    # mount device
#    mount "/dev/$device" $mount_point
#
#    if ! [ $? -eq 0 ]; then
#        echo "Can't mount USB device( $device )."
#        usb_err=$((usb_err+1))
#        continue
#    fi
#
#    # copy file to usb device
#    cp $test_file "$mount_point/$test_file"
#
#    if ! [ $? -eq 0 ]; then        
#        echo "Copy file to $device failed."
#        usb_err=$((usb_err+1))
#        umount $mount_point
#        continue
#    fi
#
#    # Read USB file
#    read_file="$mount_point/read_file.txt"
#    cp "$mount_point/$test_file" $read_file
#    if ! [ $? -eq 0 ]; then
#        echo "Can't read $device file."
#        usb_err=$((usb_err+1))
#        umount $mount_point
#        continue
#    fi
#    # clear file
#    rm $read_file
#    
#    # umount device
#    umount $mount_point
#    #clear folder
#    rmdir $mount_point
#done
#-----------------------------------------------------------------------------#
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END USB Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[USB Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="


}
##############################################################################################
#				CPU / RAM / COM Port
##############################################################################################
BurnIn()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START BurnIn Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#UnableTTYS
#xterm -e bash "/home/root/SCB100_GUI/MainBoard/BurnIn.sh"  &
#sleep 1
#res=-1
#check_log=-1
#burn_in_err=0
#while [ ! $res = 1 ]
#do
#	if [ ! "$check_log" = "1" ]
#	then
#		check_log=$(find /tmp/ -name BiTLog2.log |grep -c log)
#	else
#		res=$(cat /tmp/BiTLog2.log |grep -c RESULT)
#	fi
#	sleep 1
##	res=$(cat /tmp/BiTLog2.log |grep -c RESULT)
#done
#
#CPU=$(cat /tmp/BiTLog2.log |grep Maths |grep -c "PASS")
#MEM=$(cat /tmp/BiTLog2.log |grep Memory |grep -c "PASS")
#COM1=$(cat /tmp/BiTLog2.log |grep ttyS0 |grep -c "PASS")
#COM2=$(cat /tmp/BiTLog2.log |grep ttyS1 |grep -c "PASS")
#
#if [ ! "$CPU" = "1" ]
#then
#	echo "Failed : CPU failed."
#	burn_in_err=$((burn_in_err+1))
#fi
#
#if [ ! "$MEM" = "1" ]
#then
#	echo "Failed : Memory failed."
#	burn_in_err=$((burn_in_err+1))
#fi
#
#if [ ! "$COM1" = "1" ]
#then
#	echo "Failed : COM1 failed."
#	burn_in_err=$((burn_in_err+1))
#fi
#
#if [ ! "$COM2" = "1" ]
#then
#	echo "Failed : COM2 failed."
#	burn_in_err=$((burn_in_err+1))
#fi
#
#rm /tmp/BiTLog2.log
#-----------------------------------------------------#
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END BurnIn Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[BurnIn Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}


###############################################################################################
#			miniPCIe / Bluetooth
###############################################################################################
miniPCIe()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START miniPCIe Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#	cnt_Bluetooth=$(lsusb |grep -c Bluetooth)				
#	pci_err=0
#	pci_err_msg=""
#	if [ ! "$cnt_Bluetooth" = "1" ]					
#	then
#		echo "Failed: No search miniPCIe-bluetooth device."
#		pci_err=$((pci_err+1))
#	fi
#
#	cnt_miniPCIe=$(lspci |grep -c RTL)				
#
#	if [ ! "$cnt_miniPCIe" = "1" ]					
#	then
#		echo "Failed: No search miniPCIe device."
#		pci_err=$((pci_err+1))
#	fi
#----------------------------------------------------------#
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END miniPCIe Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[miniPCIe Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}
###############################################################################################
################################################################################################
#				DIO
###############################################################################################
DIO()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START DIO Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#DO1_A=0xFD6E07F0
#DO1_B=0xFD6A07B0
#DO2_A=0xFD6E0800
#DO2_B=0xFD6A07C0
#DO3_A=0xFD6E0810
#DO3_B=0xFD6A07D0
#DO4_A=0xFD6E0830
#DO4_B=0xFD6A07E0
#DO_A_Array=($DO1_A $DO2_A $DO3_A $DO4_A)
#DO_B_Array=($DO1_B $DO2_B $DO3_B $DO4_B)
#DI1_A=0xFD6E09A0
#DI1_B=0xFD6D0840
#DI2_A=0xFD6E09B0
#DI2_B=0xFD6D0850
#DI3_A=0xFD6E09C0
#DI3_B=0xFD6D0860
#DI4_A=0xFD6E0B10
#DI4_B=0xFD6D0870
#DI5_A=0xFD6E09D0
#DI5_B=0xFD6E0930
#DI6_A=0xFD6E09E0
#DI6_B=0xFD6E0940
#DI7_A=0xFD6E09F0
#DI7_B=0xFD6E0960
#DI8_A=0xFD6E0A00
#DI8_B=0xFD6E0970
#DI9_A=0xFD6D0A10
#DI9_B=0xFD6A07F0
#DI10_A=0xFD6D0A20
#DI10_B=0xFD6A0840
#DI11_A=0xFD6D0A30
#DI11_B=0xFD6A0850
#DI12_A=0xFD6D0A40
#DI12_B=0xFD6A0860
#DI_A_Array=($DI1_A $DI2_A $DI3_A $DI4_A $DI5_A $DI6_A $DI7_A $DI8_A $DI9_A $DI10_A $DI11_A $DI12_A)
#DI_B_Array=($DI1_B $DI2_B $DI3_B $DI4_B $DI5_B $DI6_B $DI7_B $DI8_B $DI9_B $DI10_B $DI11_B $DI12_B)
#dio_err=0
#
#	#init DO A ch
#	for cnt in $(seq 0 3)
#	do
#		DOA_Init=$(devmem2 ${DO_A_Array[$cnt]} w 0x44000200)
#	done
#
#	#init DO B ch
#	for cnt in $(seq 0 3)
#	do
#		DOB_Init=$(devmem2 ${DO_B_Array[$cnt]} w 0x44000200)
#	done
#
#	sleep 0.5
#	#set DO1~DO4 is high
#	devmem2 $DO1_A w 0x44000201 |grep readback |grep null
#	devmem2 $DO2_A w 0x44000201 |grep readback |grep null
#	devmem2 $DO3_A w 0x44000201 |grep readback |grep null
#	devmem2 $DO4_A w 0x44000201 |grep readback |grep null
#	sleep 0.03
#	#Check DI signal is high
#	for cnt in $(seq 0 11)
#	do
#		DI_A_Val[$cnt]=$(devmem2 ${DI_A_Array[$cnt]} |grep Read |cut -d "x" -f4)
#		DI_B_Val[$cnt]=$(devmem2 ${DI_B_Array[$cnt]} |grep Read |cut -d "x" -f4)
#		
#		#Get DIA/DIB last value
#		DI_A_Val_Last[$cnt]=${DI_A_Val[$cnt]:7}
#		DI_B_Val_Last[$cnt]=${DI_B_Val[$cnt]:7}
#		
#		#Check DIA is not high and DIB is low.
#		if [[ ${DI_A_Val_Last[$cnt]} -ne 2 ]] || [[ ${DI_B_Val_Last[$cnt]} -ne 0 ]];
#		then
#			echo "Error DI turn on: $cnt A:${DI_A_Array[$cnt]} 0x${DI_A_Val[$cnt]} B:${DI_B_Array[$cnt]} 0x${DI_B_Val[$cnt]}"
#			dio_err=$((dio_err+1))
#		fi
#
#		sleep 0.5
#	done
#
#
#	#Set DO1~4 signal is low
#	devmem2 $DO1_A w 0x44000200 |grep readback |grep null
#	devmem2 $DO2_A w 0x44000200 |grep readback |grep null
#	devmem2 $DO3_A w 0x44000200 |grep readback |grep null
#	devmem2 $DO4_A w 0x44000200 |grep readback |grep null
#	sleep 0.03
#	for cnt in $(seq 0 11)
#	do
#		DI_A_Val[$cnt]=$(devmem2 ${DI_A_Array[$cnt]} |grep Read |cut -d "x" -f4)
#		DI_B_Val[$cnt]=$(devmem2 ${DI_B_Array[$cnt]} |grep Read |cut -d "x" -f4)
#		
#		#Get DIA/DIB last value
#		DI_A_Val_Last[$cnt]=${DI_A_Val[$cnt]:7}
#		DI_B_Val_Last[$cnt]=${DI_B_Val[$cnt]:7}
#		
#		#Check DIA is high and DIB is low.
#		if [[ ${DI_A_Val_Last[$cnt]} -ne 0 ]] || [[ ${DI_B_Val_Last[$cnt]} -ne 2 ]];
#		then
#			echo "Error DI turn off: $cnt A:${DI_A_Array[$cnt]} 0x${DI_A_Val[$cnt]} B:${DI_B_Array[$cnt]} 0x${DI_B_Val[$cnt]}"
#			dio_err=$((dio_err+1))
#		fi
#
#	sleep 0.5
#	done
#
#	sleep 0.5
#	#init DO A ch
#	for cnt in $(seq 0 3)
#	do
#		DOA_Init=$(devmem2 ${DO_A_Array[$cnt]} w 0x44000200)
#	done
#
#	#init DO B ch
#	for cnt in $(seq 0 3)
#	do
#		DOB_Init=$(devmem2 ${DO_B_Array[$cnt]} w 0x44000200)
#	done
#
#
#	if [ ! $dio_err = 0 ]
#	then
#		echo "1"
#	fi
#-----------------------------------------------------------
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END DIO Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[DIO Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}
###############################################################################################
#				EMMc
###############################################################################################
EMMc()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START eMMC Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#	emmc_err=0
#	emmc_err_msg=""
#	emmc_ret=$(lsblk |grep -c mmc)
#	check_boot=$(lsblk |grep mmcblk| grep boot/efi -c)
#
#	
#	if [ "$emmc_ret" = "0" ];
#	then
#		emmc_err=$((emmc_err+1))
#		echo "Failed : No search EMMc device."
#	else
#		if [ ! "$check_boot" = "1" ]
#		then
#	    	    mkfs.ext4 /dev/mmcblk0> /dev/null 2>&1
#
#	    	   mount /dev/mmcblk0 /home/root/SCB100_GUI/MainBoard/EMMc_Test> /dev/null 2>&1
#	    	   if [ "$?" -eq "0" ]
#	    	   then
#	    	       mkdir /home/root/SCB100_GUI/MainBoard/EMMc_Test/hello
#	    	   
#	    	       res=$(find /home/root/SCB100_GUI/MainBoard/EMMc_Test/  -name hello |grep -c hello)
#	    	       if [ ! $res = 1 ]
#	    	       then
#	    	     	#fail
#	    	   	echo "Failed: EMMc Read/Write file failed."
#	    	   	emmc_err=$((emmc_err+1))
#	    	   	break
#	    	       else
#	    	   	rm -r /home/root/SCB100_GUI/MainBoard/EMMc_Test/hello
#	    	       fi
#	    	   	
#	    	   	    umount /dev/mmcblk0
#	    	   else
#	    	   	echo "Failed: EMMc mount failed."
#	    	   fi
#
#		fi
#	fi
#
#
#	if [ ! $emmc_err = 0 ]
#	then
#		echo "1"
#	fi
#-----------------------------------------------------
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END eMMC Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[eMMC Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}
###############################################################################################
#				Total Memory
###############################################################################################
TotalMemory()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START Memory Size Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#	total_mem_err=0
#	total_mem_err_msg=""
#
#	mem_size=$(grep MemTotal /proc/meminfo |awk '{print int($2 / 1024)}')
#	max_size=7000
#	if [ $mem_size -lt $max_size ]
#	then
#		echo "Memory size fail , memory size is $mem_size."
#		total_mem_err=$((total_mem_err+1))
#	fi
#
#	if [ ! $total_mem_err = 0 ]
#	then
#		echo "1"
#	fi
 #-------------------------------------------------------------------
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END Memory Size Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[Memory Size Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="

}
###############################################################################################
#				SATA Test
###############################################################################################
SATA()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START SATA Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#	sata_err=0
#	sata_err_msg=""
#
#	sleep 1
#	check_sata=$(lsblk --nodeps --output NAME,TRAN |grep -c sata)				
#	if [  "$check_sata" = "0" ];				 
#	then
#		sata_err=$((sata_err+1))
#		echo "Failed : No search SATA."
#		sata_err_msg="Failed : No search SATA."
#	fi

#------------------------------------------------------------------------
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END SATA Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[SATA Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="

}
###############################################################################################
#				TPM Test
###############################################################################################
TPM()
{
    start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START TPM Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
    sleep 1
#----------------------------------------------------------------------------------#
#	tpm_err=0
#	tpm_err_msg=""
#
#	err1=$(dmesg |grep TPM |grep -c error)
#	if [ ! "$err1" = "0" ];
#	then
#		tpm_err=$((tpm_err+1))					
#	fi
#
#	err2=$(lsmod |grep tpm |tail -n1 |cut -d " " -f23 )
#	if [ ! "$err2" = "5" ];
#	then
#		tpm_err=$((tpm_err+1))
#	fi
#
#	err3=$(tpm2_createprimary -C o -g sha256 -G ecc -c context.out |grep -c "Error")
#	if [ ! "$err3" = "0" ];
#	then
#		tpm_err=$((tpm_err+1))
#	fi
#
#	if [ ! $tpm_err = "0" ];
#	then
#		echo "Failed : TPM test failed."
#	fi
 #-------------------------------------------------------------------
 # ?取?束??的日期??和??戳
    end_date=$(date +'%Y%m%d%H%M%S')
    end_timestamp=$(date +%s)
    echo "[END TPM Test $end_date]"

    # ?算??差
    elapsed_seconds=$((end_timestamp - start_timestamp))
    elapsed_minutes=$((elapsed_seconds / 60))
    elapsed_seconds=$((elapsed_seconds % 60))

    # ?出??差，并添加?行
    echo -e "[TPM Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds \n"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}

case "$1" in
	Buzzer)	Buzzer;;
	 Network)	Network;;
	 USB	)	USB;;
	 BurnIn )	BurnIn;;
	 PCIe	)	miniPCIe;;
	 DIO	)	DIO;;
	 EMMc	)	EMMc;;
	 TotalMemory) 	TotalMemory;;
	 SATA	)	SATA;;
	 TPM	)	TPM;;
esac
