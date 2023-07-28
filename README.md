# Connect to random wireguard server

This scripts realizes a connection to a server specified by a wireguard `.conf` file which is chosen randomly from the `/etc/wireguard/` directory.

## Preparations

1. Install `wireguard-tools` via `apt install wireguard-tools` (debian based distros)
2. Move config files to `/etc/wireguard/`
3. Fill in the path to the scripts and the icon file in the `.desktop` files
4. Move the `.desktop` files to `/usr/share/applications/`
