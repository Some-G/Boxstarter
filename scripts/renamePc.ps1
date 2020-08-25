# Rename the computer (requires restart)

$computername = Read-Host -Prompt "Input the computer name"
if ($env:computername -ne $computername) {
  Rename-Computer -NewName $computername
}

Write-Output "Computer has been renamed to $computername."