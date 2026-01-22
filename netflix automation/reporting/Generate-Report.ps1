param ($Results, $Config)

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$reportFile = "$($Config.ReportPath)\Netflix-TestReport-$timestamp.json"

$Results | ConvertTo-Json -Depth 5 | Out-File $reportFile

Write-Host "Report generated at $reportFile"
