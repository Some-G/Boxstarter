# Restore Windows Photo Viewer

Write-Output "Restoring Windows Photo Viewer..."

New-PSDrive -Scope script -PSProvider registry -Root HKEY_LOCAL_MACHINE -Name HKLM

If (!(Test-Path -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open)) {
  New-Item HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open
}
If (!(Test-Path -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open\command)) {
  New-Item HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open\command
}
If (!(Test-Path -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open\DropTarget)) {
  New-Item HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open\DropTarget
}
If (!(Test-Path -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\print\command)) {
  New-Item HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\print\command
}
If (!(Test-Path -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\print\DropTarget)) {
  New-Item HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\print\DropTarget
}

# https://www.maketecheasier.com/set-windows-photo-viewer-as-default-windows10/
$command = "%SystemRoot%\System32\rundll32.exe %ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll, ImageView_Fullscreen %1"

Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open -Name "MuiVerb" -Type String -Value "@photoviewer.dll,-3043"
Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open\command -Name "(default)" -Type ExpandString -Value $command
Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\open\DropTarget -Name "Clsid" -Type String -Value "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\print\command -Name "(default)" -Type ExpandString -Value $command
Set-ItemProperty -Path HKLM:\SOFTWARE\Classes\Applications\photoviewer.dll\shell\print\DropTarget -Name "Clsid" -Value "{60fd46de-f830-4894-a628-6fa81bc0190d}" -Type String

Remove-PSDrive -Scope script -Name HKLM

Write-Output "Windows Photo Viewer successfully restored."