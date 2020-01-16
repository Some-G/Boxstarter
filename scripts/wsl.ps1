# Install WSL

Write-Output "Enabling WSL..."

# Enable Windows Subsystems
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName VirtualMachinePlatform

# Default to WSL 2
wsl --set-default-version 2

Write-Output "Downloading and installing Ubuntu distro..."

Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
Add-AppxPackage -Path Ubuntu.appx
Remove-Item Ubuntu.appx

Write-Output "WSL successfully enabled."