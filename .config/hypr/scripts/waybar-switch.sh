#!/bin/bash

WAYBAR_CONFIG="$HOME/.config/waybar/config"
WAYBAR_STYLE="$HOME/.config/waybar/style.css"
themes_dir="$HOME/.config/waybar/themes"

choice=$(ls "$themes_dir" | rofi -dmenu)
[[ -z "$choice" ]] && exit 0

apply_config()  {
	ln -sf "$themes_dir/$choice/config" "$WAYBAR_CONFIG"
	ln -sf "$themes_dir/$choice/style.css" "$WAYBAR_STYLE"

	~/.config/hypr/scripts/wbrestart.sh
}

apply_config
