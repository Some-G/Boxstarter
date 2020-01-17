# Configure apps

Write-Output "Configuring apps..."

New-PSDrive -Scope script -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR

# Make "Open in Code" context menu start a WSL session
# https://thisdavej.com/right-click-on-windows-folder-and-open-with-visual-studio-code/
If (Test-Path HKCR:\Directory\shell\VSCode\command) {
  # See `wslScripts/createLinks.sh`
  $binary = "$env:USERPROFILE\.wslbin\runhidden.vbs"
  $template = '"C:\Windows\system32\wscript.exe" "' + $binary + '" "wsl code $(wslpath -a '''

  Set-ItemProperty -Path HKCR:\Directory\Background\shell\VSCode\command -Name "(default)" -Type ExpandString -Value ($template + '%V'')"')
  Set-ItemProperty -Path HKCR:\Directory\shell\VSCode\command -Name "(default)" -Type ExpandString -Value ($template + '%V'')"')

  Write-Output "Due to the asterisk, you must change the following registry value manually:"
  Write-Output ("Path: HKCR:\*\shell\VSCode\command Name: (default) Value: " + $template + '%1'')"')
}

Remove-PSDrive -Scope script -Name HKCR

Write-Output "Applications successfully configured."