#!/bin/bash
# Update: 04-05-2022
# Description: Scanning


# Color variables 

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

# User root

function user() {
if [ `whoami` != 'root' ]   							#Checking root user ; It could be like: if [ $(id -u) != "0" ]
        then
	echo -e "${GREEN}You must have root priviledges to do this.${NOCOLOR}"
	sleep 1      								#Halt the program for a second
	exit 127     								#127 is the error number here
	#If the condition does not fulfills, then the program will exit
fi
clear
}

# Internet connection check

function connect() {
ping -c 1 -w 3 google.com > /dev/null 2>&1
if [ "$?" != 0 ]
        then
	echo -e "${GREEN}This script needs an active internet connection!${NOCOLOR}"
	exit 1
fi
}

function dependencies() {
#Nmap installation	
if [ ! -x "$(command -v nmap)" ]
        then
        echo -e "\n${RED}[+]${NOCOLOR} nmap not detected...Installing\n"
        sudo apt-get install nmap -y > installing;rm installing
	else
        echo -e "${GREEN}[+]${NOCOLOR} nmap detected\n"
     
fi
#Figlet installation	
if [ ! -x "$(command -v figlet)" ]
        then
        echo -e "\n${RED}[+]${NOCOLOR} figlet not detected...Installing\n"
        sudo apt-get install figlet -y > installing;rm installing
	else
        echo -e "${GREEN}[+]${NOCOLOR} figlet detected\n"
     
fi

function scaningx() {
#echo "- - - - - - - - - - - - - - - - - - -[AUTO SCANNING TOOL] - - - - - - - - - - - - - - - - - - -"
figlet "[ Auto Scanning Tool ]"

echo -e "${GREEN}1.${NOCOLOR} FULL TCP CONNECT SCAN"
echo -e "${GREEN}2.${NOCOLOR} HALF-OPEN OR STEALTH SCAN"
echo -e "${GREEN}3.${NOCOLOR} PING SCAN"
echo -e "${GREEN}4.${NOCOLOR} UDP SCAN"
echo -e "${GREEN}5.${NOCOLOR} FULL PORT TCP CONNECT SCAN" 
echo -e "${GREEN}6.${NOCOLOR} FULL PORT STEALTH SCAN"
echo -e "${GREEN}7.${NOCOLOR} FULL PORT UDP SCAN"
echo -e "${GREEN}8.${NOCOLOR} VERSION/SERVICE DETECTION SCAN"
echo -e "${GREEN}9.${NOCOLOR} OS DETECTION SCAN"
echo -e "${GREEN}10.${NOCOLOR} AGGRESSIVE SCAN"
echo -e "${GREEN}CHOOSE ONE OPTION: ${NOCOLOR}"
read option									#Stores the option value (i.e., 1, 2, ... 10)

echo -e "${GREEN}Enter Target IP address or Domain Name${NOCOLOR}"
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
        nmap -A $IP								#AGGRESSIVE SCAN

else
	echo -e "${RED}Invalid Input${NOCOLOR}"
fi
}

# Call functions

user
connect
dependencies
scaningx
