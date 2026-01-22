param ($Results)

Start-Process "shell:AppsFolder\4DF9E0F8.Netflix_mcm4njqhnhss8!Netflix"

Start-Sleep 10

$process = Get-Process | Where-Object { $_.ProcessName -like "*Netflix*" }

$Results.UI = @{
    AppLaunched = $null -ne $process
}

if (-not $process) {
    throw "UI test failed: Netflix did not launch."
}
