#!/bin/bash
	#xterm -geometry 1x1 -e "journalctl -f |grep SMIS" &
	#xterm -geometry 1x1 -e "bash /data/SCB100_Tool/RunTest/SetupDIO.sh" &
	sleep 5
	#DO1~4 Signal
	DO1_A=0xFD6E07F0
	DO1_B=0xFD6A07B0
	DO2_A=0xFD6E0800
	DO2_B=0xFD6A07C0
	DO3_A=0xFD6E0810
	DO3_B=0xFD6A07D0
	DO4_A=0xFD6E0830
	DO4_B=0xFD6A07E0
	DO_A_Array=($DO1_A $DO2_A $DO3_A $DO4_A)
	DO_B_Array=($DO1_B $DO2_B $DO3_B $DO4_B)
	#DO_MON 1~4
	DO1_MON=0xFD6E0740
	DO2_MON=0xFD6E0750
	DO3_MON=0xFD6E0760
	DO4_MON=0xFD6E0770
	DO_MON_Array=($DO1_MON $DO2_MON $DO3_MON $DO4_MON)
	#DI1~12
	DI1_A=0xFD6E09A0
	DI1_B=0xFD6D0840
	DI2_A=0xFD6E09B0
	DI2_B=0xFD6D0850
	DI3_A=0xFD6E09C0
	DI3_B=0xFD6D0860
	DI4_A=0xFD6E0B10
	DI4_B=0xFD6D0870
	DI5_A=0xFD6E09D0
	DI5_B=0xFD6E0930
	DI6_A=0xFD6E09E0
	DI6_B=0xFD6E0940
	DI7_A=0xFD6E09F0
	DI7_B=0xFD6E0960
	DI8_A=0xFD6E0A00
	DI8_B=0xFD6E0970
	DI9_A=0xFD6D0A10
	DI9_B=0xFD6A07F0
	DI10_A=0xFD6D0A20
	DI10_B=0xFD6A0840
	DI11_A=0xFD6D0A30
	DI11_B=0xFD6A0850
	DI12_A=0xFD6D0A40
	DI12_B=0xFD6A0860
	DI_A_Array=($DI1_A $DI2_A $DI3_A $DI4_A $DI5_A $DI6_A $DI7_A $DI8_A $DI9_A $DI10_A $DI11_A $DI12_A)
	DI_B_Array=($DI1_B $DI2_B $DI3_B $DI4_B $DI5_B $DI6_B $DI7_B $DI8_B $DI9_B $DI10_B $DI11_B $DI12_B)
	#DI TEST PIN
	DI_TEST1=0xFD6D0A60
	DI_TEST2=0xFD6D0A70
	DI_TEST3=0xFD6D0A80
	DI_TEST4=0xFD6D0A90
	DI_TEST5=0xFD6E0A10
	DI_TEST6=0xFD6E0A20
	DI_TEST7=0xFD6E0A30
	DI_TEST8=0xFD6E0A40
	DI_TEST9=0xFD6D0AA0
	DI_TEST10=0xFD6D08C0
	DI_TEST11=0xFD6D08D0
	DI_TEST12=0xFD6D08F0
	DI_TEST_Array=($DI_TEST1 $DI_TEST2 $DI_TEST3 $DI_TEST4 $DI_TEST5 $DI_TEST6 $DI_TEST7 $DI_TEST8 $DI_TEST9 $DI_TEST10 $DI_TEST11 $DI_TEST12)
	dio_err=0
	echo "The path is :"$(pwd)
#	DevMem=$(pwd)"/MainBoard/DevMem2"
	DevMem="/home/nexcobot/Documents/SCB100_GUI/Source/IO_Board/DevMem2"
#	DevMem=./DevMem2
DO_MON_TEST() 
{
	for cnt in $(seq 0 3)
	do
		$DevMem ${DO_A_Array[$cnt]} b 0 |grep readback |grep null;$DevMem ${DO_B_Array[$cnt]} b 0 |grep readback |grep null	#Set DO_A and DO_B to 0 and 0
#		$DevMem ${DO_A_Array[$cnt]} b 0 ;$DevMem ${DO_B_Array[$cnt]} b 0	#Set DO_A and DO_B to 0 and 0

		DO_MON_VAL[$cnt]=$($DevMem ${DO_MON_Array[$cnt]} b |grep Value |cut -d ' ' -f6)
		if [ !  "${DO_MON_VAL[$cnt]}" = "0x0" ];					#Check DO1 Mon change to 0
		then
		#	echo "Set DO_A and DO_B to 0 and 0 failed."
			dio_err=$((dio_err+1))
		fi
	done	

	
	for cnt in $(seq 0 3)
	do
		$DevMem ${DO_A_Array[$cnt]} b 0 |grep readback |grep null;$DevMem ${DO_B_Array[$cnt]} b 1 |grep readback |grep null	#Set DO_A and DO_B to 0 and 1
		DO_MON_VAL[$cnt]=$($DevMem ${DO_MON_Array[$cnt]} b| grep Value | cut -d ' ' -f6)
		if [ !  "${DO_MON_VAL[$cnt]}" = "0x0" ];					#Check DO1 Mon change to 0
		then
			#echo "Set DO_A and DO_B to 0 and 1 failed."
			dio_err=$((dio_err+1))
		fi
	done	

	for cnt in $(seq 0 3)
	do
		$DevMem ${DO_A_Array[$cnt]} b 1 |grep readback |grep null;$DevMem ${DO_B_Array[$cnt]} b 0 |grep readback |grep null	#Set DO_A and DO_B to 1 and 0
		DO_MON_VAL[$cnt]=$($DevMem ${DO_MON_Array[$cnt]} b| grep Value | cut -d ' ' -f6)
		if [ !  "${DO_MON_VAL[$cnt]}" = "0x2" ];					#Check DO1 Mon change to 1
		then
			#echo "Set DO_A and DO_B to 1 and 0 failed."
			dio_err=$((dio_err+1))
		fi
	done

	for cnt in $(seq 0 3)
	do
		$DevMem ${DO_A_Array[$cnt]} b 1 |grep readback |grep null;$DevMem ${DO_B_Array[$cnt]} b 1 |grep readback |grep null	#Set DO_A and DO_B to 1 and 1
		DO_MON_VAL[$cnt]=$($DevMem ${DO_MON_Array[$cnt]} b| grep Value | cut -d ' ' -f6)
		if [ !  "${DO_MON_VAL[$cnt]}" = "0x0" ];					#Check DO1 Mon change to 0
		then
			#echo "Set DO_A and DO_B to 1 and 1 failed."
			dio_err=$((dio_err+1))
		fi
	done
	echo -e "\nDO_MON_TEST Error Loop: "$dio_err
}
	

DI_TEST_PIN_0()
{
	for cnt in $(seq 0 11)
	do
		$DevMem ${DI_TEST_Array[$cnt]} b 0 |grep readback |grep null
	done
	#---------------------------------------------#	
	for cnt in $(seq 0 11)
	do
		DI_A_Val[$cnt]=$($DevMem ${DI_A_Array[$cnt]} b| grep Value | cut -d ' ' -f6);DI_B_Val[$cnt]=$($DevMem ${DI_B_Array[$cnt]} b| grep Value | cut -d ' ' -f6)
		if [ !  "${DI_A_Val[$cnt]}" = "0x2" ] & [ !  "${DI_B_Val[$cnt]}" = "0x0" ];
		then
			#echo "Check test pin is 0 then DIA adn DIB is 1 and 0."
			dio_err=$((dio_err+1))
		fi 

	done
	echo "DI_TEST_PIN_0 Error Loop: "$dio_err
}

DI_TEST_PIN_1()
{
	for cnt in $(seq 0 11)
	do
		$DevMem ${DI_TEST_Array[$cnt]} b 1 |grep readback |grep null
	done

	#---------------------------------------------#	
	for cnt in $(seq 0 11)
	do
		DI_A_Val[$cnt]=$($DevMem ${DI_A_Array[$cnt]} b| grep Value | cut -d ' ' -f6);DI_B_Val[$cnt]=$($DevMem ${DI_B_Array[$cnt]} b| grep Value | cut -d ' ' -f6)
		if [ !  "${DI_A_Val[$cnt]}" = "0x0" ] & [ !  "${DI_B_Val[$cnt]}" = "0x2" ];
		then
			#echo "Check test pin is 0 then DIA and DIB is 0 and 1."
			dio_err=$((dio_err+1))
		fi 

	done
	echo "DI_TEST_PIN_1 Error Loop: "$dio_err
}

case "$1" in
	 DO_MON_TEST)	DO_MON_TEST;;
	 DI_TEST_PIN_0)	DI_TEST_PIN_0;;
	 DI_TEST_PIN_1)	DI_TEST_PIN_1;;
	 * ) echo "Input failed.";;
esac

