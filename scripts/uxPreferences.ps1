# UX Preferences

Write-Output "Applying UX Preferences..."

# Display hidden and protected files; show file extensions
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# Easy easy access keyboard keys
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -Type String -Value "506"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name Flags -Type String -Value "122"
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Name Flags -Type String -Value "58"

Write-Output "UX Preferences have been applied."