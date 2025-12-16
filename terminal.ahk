; This allows you to press Ctrl+Alt+T to open the terminal, like you might use on Linux.
#SingleInstance

IniFilename := "terminal.ini"
IniSection := "terminal"
IniKey := "command"
TerminalApplication := IniRead(IniFilename, IniSection, IniKey, "cmd.exe")

; We set the working directory to the system root to prevent executables in the same
; folder from getting run.
CommandWorkingDirectory := EnvGet("SYSTEMROOT")

RunTerminal() {
    Run TerminalApplication, CommandWorkingDirectory
}

RunTerminalWrapper(*) {
    RunTerminal()
}

GetRunCommandMenuItemName() {
    Return 'Run "' . TerminalApplication . '"'
}

RunCommandMenuItemName := GetRunCommandMenuItemName()
EditCommandMenuItemName := "Change terminal command"

SetTerminalApplication(*) {
    global TerminalApplication
    global RunCommandMenuItemName
    InputBoxObj := InputBox("Enter the command to run to start a terminal session", "Set Terminal Application", "", TerminalApplication)
    if (InputBoxObj.Result = "OK") {
        TerminalApplication := InputBoxObj.Value
        RunCommandMenuItemName := GetRunCommandMenuItemName()
        IniWrite TerminalApplication, IniFilename, IniSection, IniKey
        ResetMenuItems()
    }
}

Tray := A_TrayMenu

ResetMenuItems() {
    Tray.Delete() ; Remove standard/all/all/all items
    Tray.Add(RunCommandMenuItemName, RunTerminalWrapper)
    Tray.Add(EditCommandMenuItemName, SetTerminalApplication)
    Tray.Add() ; Add separator
    Tray.Default := RunCommandMenuItemName
    Tray.AddStandard()
}

ResetMenuItems()

; Ctrl+Alt+T
^!t::RunTerminal()
