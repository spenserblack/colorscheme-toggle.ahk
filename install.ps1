$WSShell = New-Object -ComObject WScript.Shell
$BinDir = $PSScriptRoot
$StartupDir = [Environment]::GetFolderPath("Startup")
$ScriptNames = @("colorscheme-toggle.ahk", "terminal.ahk")

ForEach ($ScriptName in $ScriptNames) {
    $ShortcutName = "$ScriptName.lnk"

    $TargetPath = Join-Path $BinDir $ScriptName
    $ShortcutPath = Join-Path $StartupDir $ShortcutName

    Write-Output "Writing shortcut `"$ShortcutPath`" to `"$TargetPath`""

    $Shortcut = $WSShell.CreateShortcut($ShortcutPath)
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.WorkingDirectory = $BinDir
    $Shortcut.Save()
}

Write-Output "Installed!"
