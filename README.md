# Dotfiles

## Instruction

### 🛠️ Dotfiles Management with Makefile

This project uses a Makefile to manage symlinking your dotfiles using stow. This makes it easy to deploy, remove, and manage your configuration across different machines or environments.

### 📦 Available Targets

| Target           | Description                                                |
| ---------------- | ---------------------------------------------------------- |
| `make all`       | Stows (symlinks) all configuration folders to your `$HOME` |
| `make <folder>`  | Stows a specific folder (e.g. `make tmux` or `make i3`)    |
| `make oh-my-zsh` | Special case: stows `oh-my-zsh` into `~/.oh-my-zsh`        |
| `make unstow`    | Unstows (removes symlinks for) all folders                 |
| `make help`      | Displays help and available targets                        |

### 🗂️ Managed Dotfiles

The following folders are managed and stowed into your home directory:

```
alacritty  hyprland  i3  kitty  lazyvim  picom  polybar  rofi
starship   tmux      waybar  wezterm  wofi  pomodoro  xdg  zsh  private
```

Each corresponds to a config directory or tool, and running make <name> will symlink it into the correct path.

### 📁 Special Handling

oh-my-zsh: Unlike others, this is symlinked into ~/.oh-my-zsh using a custom target:

``` sh
make oh-my-zsh
```

### 🧹 Unstowing

To remove all the symlinks created by stowing, use:

``` sh
make unstow
```

This is useful when resetting or moving between environments.
## Shortcuts

### 🧩 tmux Shortcuts

#### 🔧 General Configuration

| Shortcut      | Action                  | Description                                    |
| ------------- | ----------------------- | ---------------------------------------------- |
| `C-s r`       | Reload config           | Reloads `~/.tmux.conf` without restarting tmux |
| `C-s C-Space` | Send prefix             | Sends the tmux prefix key to the current pane  |
| `C-s c`       | New window              | Opens a new window in the current directory    |
| `C-s "`       | Split pane horizontally | Splits pane below in current dir               |
| `C-s %`       | Split pane vertically   | Splits pane to the right in current dir        |

#### 📐 Pane Navigation

| Shortcut      | Action            | Description                          |
| ------------- | ----------------- | ------------------------------------ |
| `C-s h`       | Select left pane  | Move to the pane on the left         |
| `C-s j`       | Select lower pane | Move to the pane below               |
| `C-s k`       | Select upper pane | Move to the pane above               |
| `C-s l`       | Select right pane | Move to the pane on the right        |
| `Alt + Arrow` | Select pane       | Move to adjacent pane without prefix |

#### 🔀 Window Management

| Shortcut        | Action          | Description                              |
| --------------- | --------------- | ---------------------------------------- |
| `Shift + Left`  | Previous window | Switch to previous window                |
| `Shift + Right` | Next window     | Switch to next window                    |
| `Alt + H`       | Previous window | Vim-style prev window (no prefix needed) |
| `Alt + L`       | Next window     | Vim-style next window (no prefix needed) |

#### 📋 Copy Mode (vi-style)

| Shortcut           | Action                | Description                              |
| ------------------ | --------------------- | ---------------------------------------- |
| `v` (in copy mode) | Begin selection       | Starts visual selection in copy mode     |
| `C-v` (copy mode)  | Toggle rectangle mode | Enables rectangular selection mode       |
| `y` (copy mode)    | Yank selection        | Copies selected text and exits copy mode |

#### 🔐 Session Management

| Shortcut | Action                 | Description                                                 |
| -------- | ---------------------- | ----------------------------------------------------------- |
| `C-s s`  | List sessions          | Shows a list of all tmux sessions                           |
| `C-s $`  | Rename current session | Prompts to rename the current session                       |
| `C-s d`  | Detach                 | Detaches from current session (still running in background) |
| `C-s (`  | Previous session       | Switch to previous session                                  |
| `C-s )`  | Next session           | Switch to next session                                      |


### 🖥️ Hyprland Keyboard Shortcuts

#### 🔑 Common Keyboard Shortcuts

| Shortcut              | Action                        | Description                              |
| --------------------- | ----------------------------- | ---------------------------------------- |
| SUPER + Q             | exec `$terminal`              | Launch terminal (kitty)                  |
| SUPER + B             | exec `$browser`               | Launch browser (firefox -p)              |
| SUPER + C             | killactive                    | Close focused window                     |
| SUPER + M             | exit                          | Exit Hyprland session                    |
| SUPER + SHIFT + M     | exec `shutdown -h now`        | Shutdown system                          |
| SUPER + E             | exec `$fileManager`           | Launch file manager (dolphin)            |
| SUPER + V             | togglefloating                | Toggle floating window                   |
| SUPER + R             | exec `$menu`                  | Open app launcher (wofi)                 |
| SUPER + P             | pseudo                        | Toggle pseudotile mode (dwindle layout)  |
| SUPER + J             | togglesplit                   | Toggle split mode (dwindle layout)       |
| SUPER + N             | exec `reload.sh`              | Reload Hyprland config/script            |
| SUPER + ←             | movefocus l                   | Move focus left                          |
| SUPER + →             | movefocus r                   | Move focus right                         |
| SUPER + ↑             | movefocus u                   | Move focus up                            |
| SUPER + ↓             | movefocus d                   | Move focus down                          |
| SUPER + [1–0]         | workspace [1–10]              | Switch to workspace                      |
| SUPER + SHIFT + [1–0] | movetoworkspace [1–10]        | Move window to workspace                 |
| SUPER + S             | togglespecialworkspace        | Toggle special workspace "magic"         |
| SUPER + SHIFT + S     | movetoworkspace special:magic | Move window to special workspace "magic" |
| SUPER + Mouse Wheel↓  | workspace e+1                 | Switch to next workspace                 |
| SUPER + Mouse Wheel↑  | workspace e-1                 | Switch to previous workspace             |
| SUPER + Print         | exec `hyprshot -m window`     | Screenshot current window                |
| Print                 | exec `hyprshot -m output`     | Screenshot full output (no mod)          |
| SUPER + SHIFT + Print | exec `hyprshot -m region`     | Screenshot selected region               |

#### 🖱️ Mouse Bindings

| Shortcut            | Action       | Description   |
| ------------------- | ------------ | ------------- |
| SUPER + Left Click  | movewindow   | Move window   |
| SUPER + Right Click | resizewindow | Resize window |

#### 🎧 Media / Function Keys

| Shortcut              | Action                                         | Description          |
| --------------------- | ---------------------------------------------- | -------------------- |
| XF86AudioRaiseVolume  | `wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+`    | Increase volume      |
| XF86AudioLowerVolume  | `wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-`    | Decrease volume      |
| XF86AudioMute         | `wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle`   | Toggle audio mute    |
| XF86AudioMicMute      | `wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle` | Toggle mic mute      |
| XF86MonBrightnessUp   | `brightnessctl s 5%+`                          | Increase brightness  |
| XF86MonBrightnessDown | `brightnessctl s 5%-`                          | Decrease brightness  |
| XF86AudioNext         | `playerctl next`                               | Next media track     |
| XF86AudioPrev         | `playerctl previous`                           | Previous media track |
| XF86AudioPlay / Pause | `playerctl play-pause`                         | Toggle play/pause    |

### 🧮 i3

#### 🔑 Common Keyboard Shortcuts

| Shortcut                    | Action                       | Description                       |
| --------------------------- | ---------------------------- | --------------------------------- |
| `$mod + Return`             | `exec alacritty`             | Launch terminal                   |
| `$mod + d`                  | `exec rofi -show drun`       | App launcher (drun mode)          |
| `$mod + space`              | `exec rofi -show combi`      | App launcher (combi mode)         |
| `$mod + Tab`                | `exec rofi -show window`     | Window switcher                   |
| `$mod + h/j/k/l`            | `focus` (left/down/up/right) | Move focus between windows        |
| `$mod + Shift + h/j/k/l`    | `move` (left/down/up/right)  | Move focused window               |
| `$mod + Arrow Keys`         | `focus`                      | Alternative focus keys            |
| `$mod + Shift + Arrow Keys` | `move`                       | Move window via arrow keys        |
| `$mod + f`                  | `fullscreen toggle`          | Toggle fullscreen                 |
| `$mod + s`                  | `layout stacking`            | Switch to stacking layout         |
| `$mod + w`                  | `layout tabbed`              | Switch to tabbed layout           |
| `$mod + e`                  | `layout toggle split`        | Toggle split layout               |
| `$mod + Shift + space`      | `floating toggle`            | Toggle floating mode              |
| `$mod + a`                  | `focus parent`               | Focus parent container            |
| `$mod + Shift + q`          | `kill`                       | Close focused window              |
| `$mod + Shift + c`          | `reload`                     | Reload i3 config                  |
| `$mod + Shift + r`          | `restart`                    | Restart i3 without ending session |
| `$mod + Shift + e`          | `exec i3-msg exit`           | Exit i3                           |

#### 🖼️ Workspace Switching

| Shortcut               | Action                        | Description                      |
| ---------------------- | ----------------------------- | -------------------------------- |
| `$mod + [1–0]`         | `workspace number $wsN`       | Switch to workspace              |
| `$mod + Shift + [1–0]` | `move container to workspace` | Move focused window to workspace |

#### 🖱️ Mouse Bindings

| Shortcut       | Action                | Description         |
| -------------- | --------------------- | ------------------- |
| `$mod + Mouse` | Drag floating windows | Move windows freely |


#### 🧩 Screenshot Bindings

| Shortcut               | Action                                    | Description                |                                |
| ---------------------- | ----------------------------------------- | -------------------------- | ------------------------------ |
| `Print`                | `maim "/home/$USER/Pictures/$(date).jpg"` | Full screenshot            |                                |
| `$mod + Print`         | `maim --window`                           | Screenshot active window   |                                |
| `Shift + Print`        | `maim --select`                           | Screenshot selected region |                                |
| `Ctrl + Print`         | `maim                                     | xclip`                     | Screenshot to clipboard (full) |
| `Ctrl + $mod + Print`  | `maim --window                            | xclip`                     | Screenshot window to clipboard |
| `Ctrl + Shift + Print` | `maim --select                            | xclip`                     | Screenshot region to clipboard |

#### 🔊 Media & Brightness Keys

| Key                     | Action                                          | Description     |
| ----------------------- | ----------------------------------------------- | --------------- |
| `XF86AudioRaiseVolume`  | `pactl set-sink-volume @DEFAULT_SINK@ +10%`     | Volume up       |
| `XF86AudioLowerVolume`  | `pactl set-sink-volume @DEFAULT_SINK@ -10%`     | Volume down     |
| `XF86AudioMute`         | `pactl set-sink-mute @DEFAULT_SINK@ toggle`     | Mute toggle     |
| `XF86AudioMicMute`      | `pactl set-source-mute @DEFAULT_SOURCE@ toggle` | Mic mute toggle |
| `XF86MonBrightnessUp`   | `brightnessctl set +5%`                         | Brightness up   |
| `XF86MonBrightnessDown` | `brightnessctl set 5%-`                         | Brightness down |

#### 📏 Resize Mode ($mod + r)

| Shortcut          | Action                            | Description                    |
| ----------------- | --------------------------------- | ------------------------------ |
| `j/k/l/;`         | Resize (shrink/grow height/width) | Resize focused window via keys |
| `Arrow Keys`      | Resize using arrows               | Alternate resize control       |
| `Return / Escape` | Exit resize mode                  | Return to normal mode          |

## Misc

### 💻 tmux CLI Commands

| Command                              | Description                             |
| ------------------------------------ | --------------------------------------- |
| `tmux new -s <name>`                 | Create a new session with a name        |
| `tmux ls`                            | List all active sessions                |
| `tmux attach -t <name>`              | Attach to a specific session            |
| `tmux switch -t <name>`              | Switch to another session (inside tmux) |
| `tmux kill-session -t <name>`        | Kill a specific session                 |
| `tmux rename-session -t <old> <new>` | Rename session                          |


### 🧩 LazyVim Extras

| Plugin Import Path                            | Feature Area   | Description                                                                  |
| --------------------------------------------- | -------------- | ---------------------------------------------------------------------------- |
| `lazyvim.plugins.extras.coding.mini-comment`  | Coding         | Enables commenting with `mini.comment`, lightweight and fast comment plugin. |
| `lazyvim.plugins.extras.coding.mini-snippets` | Coding         | Adds basic snippet support via `mini.snippets`, integrates with Lua.         |
| `lazyvim.plugins.extras.coding.mini-surround` | Coding         | Surround text objects (quotes, tags, etc.) using `mini.surround`.            |
| `lazyvim.plugins.extras.coding.yanky`         | Clipboard/Yank | Enhances yank/paste history and actions using `yanky.nvim`.                  |
| `lazyvim.plugins.extras.dap.core`             | Debugging      | Adds DAP (Debug Adapter Protocol) for debugging with keymaps and UI.         |
| `lazyvim.plugins.extras.editor.refactoring`   | Refactoring    | Adds powerful refactoring tools using `refactoring.nvim`.                    |
| `lazyvim.plugins.extras.lang.ansible`         | Language       | Syntax highlighting, LSP, and tools for Ansible YAML files.                  |
| `lazyvim.plugins.extras.lang.docker`          | Language       | Dockerfile and `docker-compose` support including LSP and completion.        |
| `lazyvim.plugins.extras.lang.git`             | Git            | Git-specific enhancements (e.g. gitsigns, diffview, fugitive).               |
| `lazyvim.plugins.extras.lang.go`              | Language       | Golang support with formatting, LSP, and DAP.                                |
| `lazyvim.plugins.extras.lang.helm`            | Language       | Helm chart support, adds syntax and tools for Helm YAML templates.           |
| `lazyvim.plugins.extras.lang.java`            | Language       | Adds Java LSP and tools integration (via `nvim-jdtls`).                      |
| `lazyvim.plugins.extras.lang.json`            | Language       | Enhances JSON support (schemas, formatting, etc.).                           |
| `lazyvim.plugins.extras.lang.markdown`        | Language       | Markdown preview, syntax, and productivity tools (e.g. glow, markdownlint).  |
| `lazyvim.plugins.extras.lang.python`          | Language       | Python LSP, formatting, linting, debugging, test runners, etc.               |
| `lazyvim.plugins.extras.lang.sql`             | Language       | SQL LSP, syntax highlighting, and completion.                                |
| `lazyvim.plugins.extras.lang.tailwind`        | Language       | Tailwind CSS IntelliSense and language tools.                                |
| `lazyvim.plugins.extras.lang.terraform`       | Language       | Terraform syntax, linting, LSP, and formatting support.                      |
| `lazyvim.plugins.extras.lang.toml`            | Language       | TOML support including syntax highlighting and schemas.                      |
| `lazyvim.plugins.extras.lang.yaml`            | Language       | YAML support (schemas, validation, autocompletion).                          |
| `lazyvim.plugins.extras.test.core`            | Testing        | Core test framework support (via `vim-test`, `neotest`, etc.).               |
| `lazyvim.plugins.extras.ui.dashboard-nvim`    | UI             | Adds a startup dashboard screen (via `dashboard-nvim`).                      |
| `lazyvim.plugins.extras.ui.mini-animate`      | UI             | Smooth UI transitions using `mini.animate`.                                  |
| `lazyvim.plugins.extras.ui.mini-indentscope`  | UI             | Indentation scope visualization (via `mini.indentscope`).                    |
| `lazyvim.plugins.extras.util.project`         | Utility        | Project root detection and session handling (e.g., via `project.nvim`).      |

### 🧩 Zsh Plugins

| Plugin Name               | Description                                                              |
| ------------------------- | ------------------------------------------------------------------------ |
| `ansible`                 | Adds aliases/functions for [Ansible](https://www.ansible.com/) CLI usage |
| `archlinux`               | Useful commands and aliases for Arch Linux-based systems                 |
| `fzf`                     | Adds key bindings and fuzzy auto-completion using `fzf`                  |
| `git`                     | Enhances git usage with aliases and functions                            |
| `golang`                  | Adds `go` environment helpers and aliases                                |
| `gradle`                  | Aliases and functions for the Gradle build system                        |
| `helm`                    | Aliases and helpers for the Helm package manager for Kubernetes          |
| `kubectl`                 | Tab completion and aliases for `kubectl` CLI                             |
| `rclone`                  | Aliases and functions for [rclone](https://rclone.org/)                  |
| `ssh`                     | SSH-related aliases                                                      |
| `ssh-agent`               | Auto-starts `ssh-agent` and adds SSH keys automatically                  |
| `terraform`               | Adds helpers and aliases for HashiCorp Terraform                         |
| `zsh-autosuggestions`     | Real-time command suggestions as you type (from history)                 |
| `zsh-syntax-highlighting` | Syntax highlighting for Zsh commands as you type                         |
