#!/bin/bash

# Print the test details
echo "TBCE52007844"
echo "F0099"
echo "HA-TEST_07"
echo "20240604181238"
echo "20240604181835"
echo "FAIL"
echo "BBT1"
echo "B8A44FFAC5A8;B8A44FFAC5AA"
echo "1.1.1"
echo "3.4.21"
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
echo ""
echo "Parameters:"
echo ""
echo "    cmd_code: 2"
echo "    pBuf: TBCE52007844,HA-TEST_07,"
echo "    nBufLen: 24"
echo ""
echo "Result:"
echo ""
echo "    retval: 1"
echo "    pBufOut: OK"
echo "    nBufLenOut: 2"
echo ""
echo ""
echo "Parameters:"
echo ""
echo "    cmd_code: 5"
echo "    pBuf: C10-04664,TBCE52007844,HA-TEST_07,"
echo "    nBufLen: 34"
echo ""
echo "Result:"
echo ""
echo "    retval: 1"
echo "    pBufOut: OK"
echo "    nBufLenOut: 2"
echo ""
echo ""
echo "Parameters:"
echo ""
echo "    cmd_code: 4"
echo "    pBuf: TBCE52007844"
echo "    nBufLen: 12"
echo ""
echo "Result:"
echo ""
echo "    retval: 1"
echo "    pBufOut: OK;B8A44FFAC5A8;B8A44FFAC5AA;"
echo "    nBufLenOut: 29"
echo ""
echo "MAC: B8A44FFAC5A8;B8A44FFAC5AA;"
echo ""
echo "======= ======= ======= ======= ======= ======= ======= ======= ======="
echo "Customer: AXIS"
echo "Model: S22-Series"
echo "Version: v1.12.0"
echo "SKU: S2208[20Q000S2233X1]"
echo "Start Test Time: 20240604181238.748"
echo ""
echo 'reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\COM Name Arbiter" /v ComDB /f'
echo 'Get-WmiObject -class Win32_PnPEntity -Namespace "root\CIMV2" | where {$_.PNPDeviceID -like "*PID_2303*" -and $_.Status -eq "OK"} | foreach {$_.Caption.Split("()")[1]}'
echo 'Error: Command failed: reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\COM Name Arbiter" /v ComDB /f'
echo '???~: ?t?£Y?????w???n?????X???C'
echo ''
echo '???~: ?t?£Y?????w???n?????X???C'
echo ''
echo 'COM5'
echo 'COM3'
echo ''
echo 'Get-WmiObject -class Win32_PnPEntity -Namespace "root\CIMV2" | where {$_.PNPDeviceID -like "*PID_6001*" -and $_.Status -eq "OK"} | foreach {$_.Caption.Split("()")[1]}'
echo 'Get-WmiObject -class Win32_PnPEntity -Namespace "root\CIMV2" | where {$_.PNPDeviceID -like "*PID_6015*" -and $_.Status -eq "OK"} | foreach {$_.Caption.Split("()")[1]}'
echo 'Get-WmiObject -class Win32_PnPEntity -Namespace "root\CIMV2" | where {$_.PNPDeviceID -like "*PID_7523*" -and $_.Status -eq "OK"} | foreach {$_.Caption.Split("()")[1]}'
echo 'Get-WmiObject -class Win32_PnPEntity -Namespace "root\CIMV2" | where {$_.PNPDeviceID -like "*PNP0501*" -and $_.Status -eq "OK"} | foreach {$_.Caption.Split("()")[1]}'
echo 'Open \\.\COM5 successed!!'
echo 'Open \\.\COM3 successed!!'
echo 'Please power on DUT.'
echo ''
echo '[x86 boot] Spend Time(min:sec) 1:10.229'
echo ''
echo ''
echo '[SoC boot] Spend Time(min:sec) 2:40.67'
echo ''
echo ''
echo ''
echo '/ $export PS1="\w $ "'
echo '/ $cd /'
echo 'x86(\\.\COM3) boot up!!'
echo '/ $'
echo '/ $export PS1="\w $ "'
echo '/ $cd /'
echo 'Login incorrect'
echo '/ $export PYTHONPATH=/usr/ats/sys'
echo 'SoC(\\.\COM5) boot up!!'
echo 'Device boot up!!'
echo '/ $clear'
echo '======= ======= ======= ======= ======= ======= ======= ======= ======='
echo '[START SoC Write RTC 20240604181821.344]'
echo '/ $date --date='\''@1717496301'\'' +'\''%Y-%m-%d %H:%M:%S'\'''
echo '/ $date -s ""'
echo '/ $hwclock -w && echo "PASS"'
echo '/ $date --date='\''@1717496306'\'' +'\''%Y-%m-%d %H:%M:%S'\'''
echo '/ $date -s ""'
echo '/ $hwclock -w && echo "PASS"'
echo '/ $date --date='\''@1717496310'\'' +'\''%Y-%m-%d %H:%M:%S'\'''
echo 'Login incorrect'
echo '/ $date -s "Login incorrect"'
echo '/ $hwclock -w && echo "PASS"'
echo '------- ------- ------- ------- ------- ------- ------- -------'
echo 'SoC Write RTC	[FAIL]'
echo ''
echo '[END   SoC Write RTC 20240604181835.131]'
echo ''
echo '[SoC Write RTC] Spend Time(min:sec) 0:13.787'
echo ''
echo '======= ======= ======= ======= ======= ======= ======= ======= ======='
echo 'End Test Time: 20240604181835.252'
echo ''
echo '[main] Spend Time(min:sec) 5:56.504'
echo ''
echo 'S2208[20Q000S2233X1] in PT Station test:	[FAIL]'
echo '======= ======= ======= ======= ======= ======= ======= ======= ======='
echo 'No need to re-check RFID.'
