# Connect to random OVPN.com server via wireguard

This scripts realizes a connection to a random server of the VPN Provider [OVPN.com](ovpn.com). Tested on Debian 11 Bullseye.

## Preparations

1. Install `wireguard-tools` via `apt install wireguard-tools`
2. Download personalized config files from [OVPN.com](ovpn.com)
3. Move config files to `/etc/wireguard/`
4. Fill in the path to the scripts and the icon file in the `.desktop` files
5. Move the `.desktop` files to `/usr/share/applications/`