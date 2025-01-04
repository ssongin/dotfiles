#!/bin/bash

stow_home_folders=(  alacritty hyprland i3 kitty lazyvim picom polybar rofi 
                starship tmux waybar wofi pomodoro xdg zsh private )

link_files () {
    echo -e "\nLinking $1\n"
    stow --target=$2 $1
}

for i in "${stow_home_folders[@]}"
do
	link_files $i $HOME
done

link_files "oh-my-zsh" "$HOME/.oh-my-zsh"