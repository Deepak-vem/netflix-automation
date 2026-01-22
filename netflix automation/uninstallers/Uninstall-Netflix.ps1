param ($Config)

Write-Host "Uninstalling Netflix..."

winget uninstall `
  --id $Config.AppId `
  --silent `
  --accept-source-agreements

Start-Sleep 10
