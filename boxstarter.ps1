Set-ExecutionPolicy AllSigned -Scope Process -Force

& .\scripts\privacy.ps1
& .\scripts\uninstallApps.ps1
& .\scripts\uiPreferences.ps1
& .\scripts\uxPreferences.ps1
& .\scripts\windowsUpdate.ps1
& .\scripts\installApps.ps1
& .\scripts\wsl.ps1
& .\scripts\renamePc.ps1