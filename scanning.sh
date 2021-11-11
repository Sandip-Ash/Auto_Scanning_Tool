#!/bin/bash

#clear

if [ `whoami` != 'root' ]    #Checking root user
then
	echo "You must have root priviledges to do this."
	sleep 1      #Halt the program for a second
	exit 127     #127 is the error number here
fi

#echo "- - - - - - - - - - - - - - - - - - -[AUTO SCANNING TOOL] - - - - - - - - - - - - - - - - - - -"
figlet "[ Auto Scanning ]" | lolcat

echo "1. FULL TCP CONNECT SCAN"
echo "2. HALF-OPEN OR STEALTH SCAN"
echo "3. PING SCAN"
echo "4. UDP SCAN"
echo "5. FULL PORT TCP CONNECT SCAN" 
echo "6. FULL PORT STEALTH SCAN"
echo "7. FULL PORT UDP SCAN"
echo "8. VERSION DETECTION SCAN"
echo "9. OS DETECTION SCAN"
echo "10. AGGRESIVE SCAN"
echo "CHOOSE ONE OPTION: "
read option

echo "Enter Target IP address or Domain Name"
read IP

if [ "$option" = 1 ];
then
	nmap -sT $IP   #

elif [ "$option" = 2 ];
then
	nmap -sS $IP

elif [ "$option" = 3 ];
then
        nmap -sn $IP

elif [ "$option" = 4 ];
then
        nmap -sU $IP

elif [ "$option" = 5 ];
then
        nmap -p- -sT $IP

elif [ "$option" = 6 ];
then
        nmap -sS -p- $IP

elif [ "$option" = 7 ];
then
        nmap -sU -p- $IP

elif [ "$option" = 8 ];
then
        nmap -sV $IP

elif [ "$option" = 9 ];
then
        nmap -O $IP

elif [ "$option" = 10 ];
then
        nmap -A $IP

else
	echo "Invalid Input"
fi
