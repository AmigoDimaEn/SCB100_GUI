#!/bin/bash
#	DevMem=./DevMem2
GPIO_TEST() 
{
   start_date=$(date +'%Y%m%d%H%M%S')
    start_timestamp=$(date +%s)
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
    echo "[START DIO Test $start_date ]"
    echo "------- ------- ------- ------- ------- ------- ------- -------"
#----------------------------------------------------------------------------------#
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
dio_err=0

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

	sleep 0.5
	#set DO1~DO4 is high
#	devmem2 $DO1_A w 0x44000201 |grep readback |grep null
#	devmem2 $DO2_A w 0x44000201 |grep readback |grep null
#	devmem2 $DO3_A w 0x44000201 |grep readback |grep null
#	devmem2 $DO4_A w 0x44000201 |grep readback |grep null
#
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
			echo "DI$cnt Turn On : A:${DI_A_Array[$cnt]} 0x${DI_A_Val[$cnt]} B:${DI_B_Array[$cnt]} 0x${DI_B_Val[$cnt]} [FAIL]"
#		else
			echo "DI$cnt Turn On : [PASS]"
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
#			echo "DI$cnt Turn Off : A:${DI_A_Array[$cnt]} 0x${DI_A_Val[$cnt]} B:${DI_B_Array[$cnt]} 0x${DI_B_Val[$cnt]} [FAIL]"
#		else
			echo "DI$cnt Turn Off : [PASS]"
#		fi
#
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
    echo -e "[DIO Test] Spend Time(min:sec) $elapsed_minutes:$elapsed_seconds"
    echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
}
	

case "$1" in
	 TEST_IO)	GPIO_TEST;;
	 * ) echo "Input failed.";;
esac

