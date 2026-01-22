param ($Config)

Write-Host "Installing Netflix..."

winget install `
  --id $Config.AppId `
  --source msstore `
  --accept-package-agreements `
  --accept-source-agreements `
  --silent

# Wait until installed
$timeout = (Get-Date).AddSeconds($Config.InstallTimeoutSeconds)
do {
    Start-Sleep 5
    $pkg = Get-AppxPackage | Where-Object { $_.Name -like "*Netflix*" }
} until ($pkg -or (Get-Date) -gt $timeout)

if (-not $pkg) {
    throw "Netflix installation timed out."
}

Write-Host "Netflix installed successfully."
