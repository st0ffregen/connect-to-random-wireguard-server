#!/bin/bash

# Path to WireGuard configuration files
conf_path="/etc/wireguard/"

function connect_to_random_interface {
    local exclude_iface=$1
    available_interfaces=("$conf_path"*.conf)
    num_interfaces=${#available_interfaces[@]}

    echo "Available interfaces: ${available_interfaces[@]}"

    if [ $num_interfaces -gt 0 ]; then
        # Remove the excluded interface from the available interfaces
        available_interfaces=(${available_interfaces[@]/$exclude_iface})
        echo "Available interfaces after exclusion: ${available_interfaces[@]}"
        
        if [ ${#available_interfaces[@]} -gt 0 ]; then
            random_iface="${available_interfaces[$((RANDOM%num_interfaces))]}"
            echo "Connecting to random interface: $random_iface"
            wg-quick up "$random_iface"
        else
            echo "No WireGuard interfaces found in $conf_path after excluding $exclude_iface."
        fi
    else
        echo "No WireGuard interfaces found in $conf_path."
    fi
}

# Check if any WireGuard interface is currently up
if [[ $(wg show) ]]; then
    # If connected, disconnect from the current interface
    current_iface=$(wg show | awk 'NR==1{print $2}')
    echo "Disconnecting from current interface: $current_iface"
    wg-quick down $current_iface

    # Connect to another random interface excluding the one just disconnected from
    connect_to_random_interface $current_iface
else
    # If not connected, connect to a random interface
    connect_to_random_interface
fi
