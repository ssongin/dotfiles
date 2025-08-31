# Makefile for stowing dotfiles

HOME_TARGET := $(HOME)
OH_MY_ZSH_TARGET := $(HOME)/.oh-my-zsh

HOME_FOLDERS := alacritty hyprland i3 kitty lazyvim picom polybar rofi \
                starship tmux waybar wezterm wofi pomodoro xdg zsh private

.PHONY: all
all: $(HOME_FOLDERS) oh-my-zsh
	@echo "✅ All folders stowed."

# Generic rule to stow a folder into HOME
$(HOME_FOLDERS):
	@echo -e "\nLinking $@\n"
	stow --target=$(HOME_TARGET) $@

# Special target for oh-my-zsh because of specific destination path
.PHONY: oh-my-zsh
oh-my-zsh:
	@echo -e "\nLinking oh-my-zsh\n"
	stow --target=$(OH_MY_ZSH_TARGET) oh-my-zsh

# Clean (unstow) folders
.PHONY: unstow
unstow: $(HOME_FOLDERS) oh-my-zsh
	@for dir in $(HOME_FOLDERS) oh-my-zsh; do \
		echo -e "\nUnstowing $$dir\n"; \
		stow --target=$(HOME_TARGET) -D $$dir 2>/dev/null || true; \
	done
	@echo "✅ All folders unstowed."

.PHONY: help
help:
	@echo "Targets:"
	@echo "  all           Stow all folders"
	@echo "  unstow        Unstow all folders"
	@echo "  help          Show this help message"
	@echo "  ==================##=================="
	@for dir in $(HOME_FOLDERS) oh-my-zsh; do \
		printf "  %-13s Stow folder %-15s\n" $$dir $$dir; \
	done

