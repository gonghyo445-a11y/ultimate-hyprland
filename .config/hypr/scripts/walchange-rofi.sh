#!/bin/bash

walchange() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: walchange <path_to_image>"
        return 1
    fi

    local image="$1"

    notify-send "Changing wallpapers"

    awww img "$image" --transition-type="center" --transition-step=1 --transition-fps="60"

    notify-send "Completed"
}

main() {
    WAL_DIR="$HOME/Pictures/Wallpapers"
    CWD="$(pwd)"

    # Move into the wallpaper directory
    cd "$WAL_DIR" || exit 1

    IFS=$'\n'

    # Show a rofi menu with image previews
    SELECTED_WALL=$(
        for a in *.jpg *.png; do
            echo -en "$a\0icon\x1f$a\n"
        done | rofi -dmenu -show-icons -p ""
    )

    # Apply the wallpaper if one was picked
    if [ -n "$SELECTED_WALL" ]; then
        walchange "$SELECTED_WALL"
	ln -sf "$WAL_DIR/$SELECTED_WALL" "$HOME/.config/hypr/current_wallpaper"
    fi

    # Go back to the original directory
    cd "$CWD" || exit
}

main
