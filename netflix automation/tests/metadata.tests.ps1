param ($Results)

$pkg = Get-AppxPackage | Where-Object { $_.Name -like "*Netflix*" }

$Results.Metadata = @{
    Installed     = $null -ne $pkg
    Version       = $pkg.Version
    Publisher     = $pkg.Publisher
    InstallFolder = $pkg.InstallLocation
}

if (-not $pkg) {
    throw "Metadata test failed: Netflix not found."
}
