#!/bin/bash

wg-quick up "/etc/wireguard/"`ls /etc/wireguard/ | shuf -n 1`
