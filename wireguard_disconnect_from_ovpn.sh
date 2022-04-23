#!/bin/bash

for iface in $(ifconfig | cut -d ' ' -f1| tr ':' '\n' | awk NF)
do
	if [[ $iface = vpn* ]]
	then
	        wg-quick down $iface
	fi
done
