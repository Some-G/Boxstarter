# Privacy settings

Write-Output "Applying Privacy settings..."

# Send info about how I write: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Input\TIPC -Name Enabled -Type DWord -Value 0
# Send contacts to MS: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore -Name HarvestContacts -Type DWord -Value 0
# Handwriting recognition personalization: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\InputPersonalization -Name RestrictImplicitInkCollection -Type DWord -Value 1
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\InputPersonalization -Name RestrictImplicitTextCollection -Type DWord -Value 1
# Let apps use my advertising ID: Disable
If (-Not (Test-Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo)) {
    New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo | Out-Null
}
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Type DWord -Value 0
# SmartScreen Filter for Store Apps: Disable
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost -Name EnableWebContentEvaluation -Type DWord -Value 0

# WiFi Sense: HotSpot Sharing: Disable
If (-Not (Test-Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting)) {
    New-Item -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting | Out-Null
}
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name value -Type DWord -Value 0
# WiFi Sense: Shared HotSpot Auto-Connect: Disable
Set-ItemProperty -Path HKLM:\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name value -Type DWord -Value 0

# Activity Tracking: Disable
@("EnableActivityFeed", "PublishUserActivities", "UploadUserActivities") |% {
  Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\System -Name $_ -Type DWord -Value 0
}

# Start Menu: Disable Bing Search Results
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0
# Start Menu: Disable Cortana
If (-Not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
  New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name AllowCortana -Type DWord -Value 0

# Disable unwanted services
$services = @(
  # Diagnostics services
  "diagnosticshub.standardcollector.service"
  "DiagTrack"
  # HomeGroup
  "HomeGroupListener"
  "HomeGroupProvider"
  # Geolocation
  "lfsvc"
  # Downloaded maps manager
  "MapsBroker"
  # Routing and remote access
  "RemoteAccess"
  "RemoteRegistry"
  # Interet Connection Sharing (ICS)
  "SharedAccess"
  # Distributed Link Tracking Client
  "TrkWks"
  # Windows Media Player network sharing
  "WMPNetworkSvc"
  # Xbox Live
  "XblAuthManager"
  "XblGameSave"
  "XboxNetApiSvc"
)

foreach ($service in $services) {
  Get-Service -Name $service | Set-Service -StartupType Disabled
}

# Disable Telemetry (requires a reboot to take effect)
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
Get-Service DiagTrack,Dmwappushservice | Stop-Service | Set-Service -StartupType Disabled

Write-Output "Privacy settings have been applied."