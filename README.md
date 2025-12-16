# `colorscheme-toggle.ahk`

Switch between dark and light themes in Windows from the system tray (AKA notification area)

Inspired by the dark mode toggle included in recent versions of Ubuntu.

## Setup

Make sure to install [AutoHotkey](https://www.autohotkey.com/) v2 before setting up
the AutoHotkey script.

1. Clone this repository
2. Follow one of these methods:
   - To automatically install, run [`install.ps1`](./install.ps1)
   - To manually install:
     1. Press `Win + R`, type `shell:startup`, and press Enter to open the Startup folder
     2. Create a shortcut to [`colorscheme-toggle.ahk`](./colorscheme-toggle.ahk) in
        the Startup folder to run the script automatically on login

## Usage

- Double-click the system tray icon to toggle between dark and light themes
- Right-click and...
  - Click "Toggle" to switch themes
  - Click "Dark Theme" to set dark theme
  - Click "Light Theme" to set light theme
