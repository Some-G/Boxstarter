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
  Set-ItemProperty -LiteralPath "HKCR:\*\shell\VSCode\command" -Name "(default)" -Type ExpandString -Value ($template + '%1'')"')
}

# Make "Open Linux shell here" always show in context menu
# This requires a registry ownership change described at
# https://windowsreport.com/error-while-deleting-key-fix/
#Remove-ItemProperty -Path HKCR:\Directory\Background\shell\WSL -Name "Extended"
Write-Output "Due to registry ownership issues, you must remove the following registry value manually:"
Write-Output "Path: HKCR:\Directory\Background\shell\WSL`nName: Extended"

# Add icon to "Open Linux shell here" context menu
Set-ItemProperty -Path HKCR:\Directory\Background\shell\WSL -Name Icon -Type ExpandString -Value "D:\Users\$env:UserName\.wslbin\Ubuntu.ico"

Remove-PSDrive -Scope script -Name HKCR

Write-Output "Applications successfully configured."