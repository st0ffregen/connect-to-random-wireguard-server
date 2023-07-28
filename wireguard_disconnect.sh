#!/bin/bash

# Create an array of names from the files in /etc/wireguard/ that end with .conf
wireguard_files=(/etc/wireguard/*.conf)

# Remove the file path from each element in the wireguard_files array
wireguard_files=("${wireguard_files[@]##*/}")

# Remove the file extension (.conf) from the file names
wireguard_files=("${wireguard_files[@]%.conf}")

# Use "ip addr" to get the list of interface names
interfaces=($(ip addr | awk '/^[0-9]+:/ {gsub(/:/,"",$2); print $2}'))

for iface in "${interfaces[@]}"
do
        # Check if $iface exists in the array of wireguard_files
        if [[ " ${wireguard_files[*]} " == *" $iface "* ]]
        then
                wg-quick down $iface
        fi
done
