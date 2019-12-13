

Clear-Host


while (1 -ne 2){
    
    $Computer = $Null
    $Computer = Read-Host "Enter Computer name, or EXIT to quit"
    Write-Host ""
    if ($Computer -eq "EXIT") {exit;}
    Write-Host -foregroundcolor Cyan "[ INFO ]:  Getting Installed Updates for $Computer"
    Write-Host -foregroundcolor Cyan "[ INFO ]:  Checking if machine is online."
if(Test-Connection -ComputerName $Computer -Count 1 -Quiet -WarningAction SilentlyContinue -ErrorAction SilentlyContinue) {
    Write-Host -foregroundcolor Yellow "[ Alert ]: Machine is online...continuing."

    Get-HotFix -ComputerName $Computer | Where-Object {$_.Installedon -gt ((Get-Date).Adddays(-360))}|Select-Object -Property PSComputerName,Description,InstalledOn, HotFixID, InstalledBy| sort InstalledOn  | Out-GridView -Title "Installed Updates for $Computer"
    Write-Host -foregroundcolor Cyan "[ INFO ]: See Output Grid for results."
    Write-Host ""

    } else {
        Write-Host -foregroundcolor Red "[ ERROR ]: $Computer is not online.`n";continue
    }


} else{

Clear-Host
continue

}
