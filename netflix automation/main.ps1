$Config = Get-Content ".\config.json" | ConvertFrom-Json
$Results = @{
    StartTime = Get-Date
    Status    = "Running"
}

try {
    .\installers\Install-Netflix.ps1 -Config $Config
    .\tests\Metadata.Tests.ps1 -Results $Results
    .\tests\InstallerBehavior.Tests.ps1 -Results $Results
    .\tests\UI.Tests.ps1 -Results $Results

    $Results.Status = "Success"
}
catch {
    $Results.Status = "Failed"
    $Results.Error  = $_.Exception.Message
}
finally {
    .\uninstallers\Uninstall-Netflix.ps1 -Config $Config
    $Results.EndTime = Get-Date
    .\reporting\Generate-Report.ps1 -Results $Results -Config $Config
}
