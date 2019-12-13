Clear-Host

while (1 -ne 2){
    $Services = @("WINMGMT")
    $Computer = $Null
    $Computer = Read-Host "Enter Computer to Update, or EXIT to quit"
    Write-Host ""
if ($Computer -eq "EXIT") {exit;}

$Services = @("wuauServ","bits","msiserver","cryptsvc")

Write-Host -foregroundcolor Cyan "Checking for existing bak directory..."
[System.Threading.Thread]::Sleep(1500)
if(Test-Path "\\$Computer\C$\Windows\SoftwareDistribution.bak") {
    Write-Host -foregroundcolor red "ERROR: Backup SoftwareDistribution directory already exists - Removing"
    Remove-Item "\\$Computer\C$\Windows\SoftwareDistribution.bak" -recurse
    [System.Threading.Thread]::Sleep(1500)
    
}

Write-Host -foregroundcolor yellow "Stopping services..."
foreach ($Service in $Services) {
    Get-Service $Service -ComputerName $Computer | Stop-Service
    [System.Threading.Thread]::Sleep(1500)
    if((Get-Service $Service -ComputerName $Computer).Status -ne "Stopped") {
        Write-Host -foregroundcolor red "ERROR: Service $Service did not stop.  "
        continue
    }
}

Write-Host -foregroundcolor Cyan "Renaming directory..."
Rename-Item -Path \\$Computer\C$\Windows\SoftwareDistribution  -NewName SoftwareDistribution.bak 
Rename-Item -Path \\$Computer\C$\Windows\System32\catroot2  -NewName catroot2.bak
[System.Threading.Thread]::Sleep(1500)
if(Test-Path "\\$Computer\C$\Windows\SoftwareDistribution") {
    Write-Host -foregroundcolor red " ERROR: Post-Rename: SoftwareDistribution Exists"
    exit
}

Write-Host -foregroundcolor yellow "Starting Services...."
foreach ($Service in $Services) {
    Get-Service $Service -ComputerName $Computer | Start-Service
    [System.Threading.Thread]::Sleep(1500)
    if((Get-Service $Service -ComputerName $Computer).Status -ne "Running") {
        Write-Host "ERROR: Service $Service did not restart."
        exit
    }
}

Write-Host -foregroundcolor Cyan "Waiting to see if directory rebuilds..."
[System.Threading.Thread]::Sleep(1500)

if(Test-Path "\\$Computer\C$\Windows\SoftwareDistribution") {Write-Host -foregroundcolor green "SUCCESS: SoftwareDistribution Exists"} else {Write-Host -foregroundcolor red "ERROR: Post-Check: SoftwareDistribution Does not Exist"}

} else{

Clear-Host
continue

}
