param ($Results)

$startMenu = Get-ChildItem `
  "$env:ProgramData\Microsoft\Windows\Start Menu\Programs" `
  -Recurse | Where-Object { $_.Name -like "*Netflix*" }

$Results.InstallerBehavior = @{
    StartMenuEntryExists = $null -ne $startMenu
    DesktopShortcut     = Test-Path "$env:Public\Desktop\Netflix.lnk"
    RebootRequired      = $false
}
