$WSShell = New-Object -ComObject WScript.Shell
$BinDir = $PSScriptRoot
$StartupDir = [Environment]::GetFolderPath("Startup")
$ScriptName = "colorscheme-toggle.ahk"
$ShortcutName = "$ScriptName.lnk"

$TargetPath = Join-Path $BinDir $ScriptName
$ShortcutPath = Join-Path $StartupDir $ShortcutName

Write-Output "Writing shortcut `"$ShortcutPath`" to `"$TargetPath`""

$Shortcut = $WSShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = $BinDir
$Shortcut.Save()

Write-Output "Installed!"