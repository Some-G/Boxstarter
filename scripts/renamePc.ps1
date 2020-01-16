# Rename the computer (requires restart)

$computername = "hugo"
if ($env:computername -ne $computername) {
  Rename-Computer -NewName $computername
}

Write-Output "Computer has been renamed."