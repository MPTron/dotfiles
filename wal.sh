#!/usr/bin/env bash
# Dependencies:
# python, pywal
# wal-telegram
# pywal_sublime
# pywal-discord (and better discord)

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
DFILE="$HOME/.cache/wal/colors-dunst"
alpha=46
# Get colors
pywal_get() {
	wal -i "$1" -q -t
}

# Change colors
change_color() { 
	#polybar
	sed -i -e "s/background = #.*/background = #$alpha$(echo $background | tr -d "#")/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $foreground/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $foreground/g" $PFILE
	sed -i -e "s/red = #.*/red = $color1/g" $PFILE
	sed -i -e "s/pink = #.*/pink = $color2/g" $PFILE
	sed -i -e "s/blue = #.*/blue = $color3/g" $PFILE
	sed -i -e "s/cyan = #.*/cyan = $color4/g" $PFILE
	sed -i -e "s/teal = #.*/teal = $color5/g" $PFILE
	sed -i -e "s/green = #.*/green = $color6/g" $PFILE
	sed -i -e "s/lime = #.*/lime = $color7/g" $PFILE
	sed -i -e "s/yellow = #.*/yellow = $color8/g" $PFILE
	sed -i -e "s/amber = #.*/amber = $color9/g" $PFILE
	sed -i -e "s/orange = #.*/orange = $color10/g" $PFILE
	sed -i -e "s/brown = #.*/brown = $color11/g" $PFILE
	sed -i -e "s/indigo = #.*/indigo = $color12/g" $PFILE
	sed -i -e "s/gray = #.*/gray = $color13/g" $PFILE
	sed -i -e "s/blue-gray = #.*/blue-gray = $color14/g" $PFILE

	# change dunsts background trancparency
	sed -i -e 's/background = "#.*"/background = "'"#$(echo $background | tr -d "#")$alpha"'"/g' $DFILE

	# restart dunst
	killall dunst
	dunst -config $DFILE &
	polybar-msg cmd restart
}

# Main
if [[ -f "/usr/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"
		python .local/bin/pywal_sublime.py
		wal-telegram -g
		pywal-discord
		mv $HOME/.cache/wal/colors-rofi-dark.rasi $HOME/.config/rofi/config.rasi
		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./wal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
