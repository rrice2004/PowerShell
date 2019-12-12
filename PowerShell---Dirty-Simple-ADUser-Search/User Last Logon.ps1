Clear-Host
$Time = Get-Date -Format "dddd MM/dd/yyyy HH:mm"

while (1 -ne 2){

$User = $Null
$User = Read-Host "Enter user to search, or EXIT to quit"

if ($User -eq "EXIT") {exit;}

Write-Host ""
Write-Host $Time
Get-ADUser -Identity $User -Properties * | Select-Object Name, LastLogOnDate, Enabled, LockedOut, PasswordExpired, BadLogonCount | Format-list

} else{

Clear-Host
continue

}

