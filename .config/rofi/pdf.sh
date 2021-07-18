#!/bin/zsh

FILE="$(find $HOME/**/*.pdf | rofi -p Zathura -dmenu -i)"
if [[ -f $FILE ]]; then
	zathura $FILE
fi
