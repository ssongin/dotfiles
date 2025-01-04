#!/bin/bash

stow_folders=(  alacritty hyprland i3 kitty lazyvim picom polybar rofi starship tmux 
                waybar wofi pomodoro xdg zsh private )

link_files () {
    echo -e "\nLinking $1\n"
    stow --target="$HOME" $1
}

for i in "${stow_folders[@]}"
do
	link_files $i
done
