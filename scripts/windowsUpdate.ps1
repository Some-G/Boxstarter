# Windows Update settings

Write-Output "Applying Windows Update settings..."

# Notify to schedule restart
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name UxOption -Type DWord -Value 1
# Disable P2P Update downlods outside of local network
If (-Not (Test-Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization)) {
  New-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization | Out-Null
  New-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config | Out-Null
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config -Name DODownloadMode -Type DWord -Value 1
If (-Not (Test-Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization)) {
  New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization -Name SystemSettingsDownloadMode -Type DWord -Value 3

Write-Output "Windows Update settings have been changed."