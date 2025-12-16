# `colorscheme-toggle.ahk`

AutoHotkey scripts to make Windows a bit more comfy.

## Setup

Make sure to install [AutoHotkey](https://www.autohotkey.com/) v2 before setting up
the AutoHotkey script.

1. Clone this repository
2. Follow one of these methods:
   - To automatically install all scripts, run [`install.ps1`](./install.ps1)
   - To manually install on or more scripts:
     1. Press `Win + R`, type `shell:startup`, and press Enter to open the Startup folder
     2. Create a shortcut to to script(s) in the Startup folder to run the script
        automatically on login

## AutoHotkey Scripts

### `colorscheme-toggle.ahk`

Inspired by the dark mode toggle included in recent versions of Ubuntu.

#### Usage

- Double-click the system tray icon to toggle between dark and light themes
- Right-click and...
  - Click "Toggle" to switch themes
  - Click "Dark Theme" to set dark theme
  - Click "Light Theme" to set light theme

### `terminal.ahk`

Technically this can run *any* command, but it's intended to mimic the terminal shortcut
on Linux.

#### Usage

- Double-click to launch the terminal
- Right-click and...
  - Click "Run ..." to execute the command
  - Click "Change terminal command" to register a different command to start the terminal
- Press `Ctrl` + `Alt` + `T` to start the terminal
