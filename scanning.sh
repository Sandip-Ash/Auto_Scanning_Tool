#!/bin/bash


if [ `whoami` != 'root' ]   							#Checking root user
then
	echo "You must have root priviledges to do this."
	sleep 1      								#Halt the program for a second
	exit 127     								#127 is the error number here
	#If the condition does not fulfills, then the program will exit
fi

clear

#echo "- - - - - - - - - - - - - - - - - - -[AUTO SCANNING TOOL] - - - - - - - - - - - - - - - - - - -"
figlet "[ Auto Scanning Tool ]"

echo "1. FULL TCP CONNECT SCAN"
echo "2. HALF-OPEN OR STEALTH SCAN"
echo "3. PING SCAN"
echo "4. UDP SCAN"
echo "5. FULL PORT TCP CONNECT SCAN" 
echo "6. FULL PORT STEALTH SCAN"
echo "7. FULL PORT UDP SCAN"
echo "8. VERSION/SERVICE DETECTION SCAN"
echo "9. OS DETECTION SCAN"
echo "10. AGGRESIVE SCAN"
echo "CHOOSE ONE OPTION: "
read option									#Stores the option value (i.e., 1, 2, ... 10)

echo "Enter Target IP address or Domain Name"
read IP

if [ "$option" = 1 ];
then
	nmap -sT $IP								#FULL TCP CONNECT SCAN

elif [ "$option" = 2 ];
then
	nmap -sS $IP								#HALF-OPEN OR STEALTH SCAN

elif [ "$option" = 3 ];
then
        nmap -sn $IP								#PING SCAN

elif [ "$option" = 4 ];
then
        nmap -sU $IP								#UDP SCAN

elif [ "$option" = 5 ];
then
        nmap -p- -sT $IP							#FULL PORT TCP CONNECT SCAN

elif [ "$option" = 6 ];
then
        nmap -sS -p- $IP							#FULL PORT STEALTH SCAN

elif [ "$option" = 7 ];
then
        nmap -sU -p- $IP							#FULL PORT UDP SCAN

elif [ "$option" = 8 ];
then
        nmap -sV $IP								#VERSION/SERVICE DETECTION SCAN

elif [ "$option" = 9 ];
then
        nmap -O $IP								#OS DETECTION SCAN

elif [ "$option" = 10 ];
then
        nmap -A $IP								#AGGRESIVE SCAN

else
	echo "Invalid Input"
fi
