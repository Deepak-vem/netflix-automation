Netflix Automation Test Suite

Overview
- PowerShell-based test automation for installing, testing, and uninstalling the Netflix app on Windows.

Files
- main.ps1: Orchestrates install, tests, uninstall, and reporting.
- installers/Install-Netflix.ps1: Uses winget to install Netflix.
- uninstallers/Uninstall-Netflix.ps1: Removes the app.
- tests/: PowerShell test scripts that populate a results object.
- reporting/Generate-Report.ps1: Writes a JSON report to `ReportPath`.

Prerequisites
- Windows 10/11
- PowerShell (5.1+ or PowerShell 7)
- `winget` available in PATH and functioning (Install from Microsoft Store App Installer)
- Run the script with elevated privileges if `winget` or install actions require admin.

Required configuration
Create a `config.json` in the project root with these fields:

```json
{
  "AppId": "Netflix.Netflix", 
  "InstallTimeoutSeconds": 300,
  "ReportPath": "C:\\Users\\Public\\Reports"
}
```

How to run
Open PowerShell and run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "main.ps1"
```

Notes
- This repository is PowerShell-first; `requirements.txt` is provided for optional Python utilities but is not required to run the PowerShell scripts.
- If you want me to create a sample `config.json` file in the repo, I can add it for you.
Execution (One Command)
powershell -ExecutionPolicy Bypass -File .\main.ps1