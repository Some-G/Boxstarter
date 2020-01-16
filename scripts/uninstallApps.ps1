# Remove Windows 10 Metro Apps

Write-Output "Removing Windows 10 Metro apps..."

Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage
Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage
Get-AppxPackage Microsoft.Print3D | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
Get-AppxPackage *Autodesk* | Remove-AppxPackage
Get-AppxPackage *Twitter* | Remove-AppxPackage
Get-AppxPackage *Dropbox* | Remove-AppxPackage
Get-AppxPackage *Netflix* | Remove-AppxPackage
Get-AppxPackage *Solitaire* | Remove-AppxPackage
Get-AppxPackage *Xbox* | Remove-AppxPackage
Get-AppxPackage *Keeper* | Remove-AppxPackage
Get-AppxPackage *Plex* | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrushSaga | Remove-AppxPackage
Get-AppxPackage king.com.BubbleWitch3Saga | Remove-AppxPackage
Get-AppxPackage *McAfee* | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.Wallet | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsCamera | Remove-AppxPackage
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.Getstarted | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
Get-AppxPackage Microsoft.ScreenSketch | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.YourPhone | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.OneNote | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsSoundRecorder | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxPackage
Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage
Get-AppxPackage *OneConnect* | Remove-AppxPackage
Get-AppxPackage *MarchofEmpires* | Remove-AppxPackage
Get-AppxPackage *PandoraMediaInc* | Remove-AppxPackage
Get-AppxPackage *Houzz* | Remove-AppxPackage
Get-AppxPackage *Viber* | Remove-AppxPackage

# Prevent applications from re-installing
$cdm = @(
  "ContentDeliveryAllowed"
  "FeatureManagementEnabled"
  "OemPreInstalledAppsEnabled"
  "PreInstalledAppsEnabled"
  "PreInstalledAppsEverEnabled"
  "SilentInstalledAppsEnabled"
  "SubscribedContent-314559Enabled"
  "SubscribedContent-338387Enabled"
  "SubscribedContent-338388Enabled"
  "SubscribedContent-338389Enabled"
  "SubscribedContent-338393Enabled"
  "SubscribedContentEnabled"
  "SystemPaneSuggestionsEnabled"
)

foreach ($key in $cdm) {
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name $key -Type DWord -Value 0
}

If (-Not (Test-Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent)) {
  New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent | Out-Null
}
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent -Name DisableWindowsConsumerFeatures -Type DWord -Value 1

Write-Output "Removed Windows 10 Metro apps."