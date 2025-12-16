#SingleInstance
Persistent

Tray := A_TrayMenu

RegKey := "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
SystemRegValueName := "SystemUsesLightTheme"
AppsRegValueName := "AppsUseLightTheme"
RegValueType := "REG_DWORD"
DarkTheme := 0
LightTheme := 1
CurrentTheme := RegRead(RegKey, SystemRegValueName)

Tray.Delete() ; Removes standard items

ToggleItemName := "Toggle"
LightThemeItemName := "Light Theme"
DarkThemeItemName := "Dark Theme"

Tray.Add(ToggleItemName, ToggleTheme)
Tray.Default := ToggleItemName
Tray.Add() ; Adds a separator
Tray.Add(DarkThemeItemName, SetDarkTheme)
Tray.Add(LightThemeItemName, SetLightTheme)

SetDarkTheme(*) {
    SetTheme(DarkTheme)
}

SetLightTheme(*) {
    SetTheme(LightTheme)
}

ToggleTheme(*) {
    if (CurrentTheme = DarkTheme) {
        SetLightTheme()
    } else {
        SetDarkTheme()
    }
}

SetTheme(ThemeValue) {
    global CurrentTheme
    CurrentTheme := ThemeValue
    RegWrite CurrentTheme, RegValueType, RegKey, SystemRegValueName
    RegWrite CurrentTheme, RegValueType, RegKey, AppsRegValueName
    CheckActiveTheme()
}

CheckActiveTheme() {
    if (CurrentTheme = DarkTheme) {
        Tray.Check(DarkThemeItemName)
        Tray.Uncheck(LightThemeItemName)
    } else {
        Tray.Check(LightThemeItemName)
        Tray.Uncheck(DarkThemeItemName)
    }
}

CheckActiveTheme() ; Check the correct theme for the first time
