# ===================================================================
# NAME: FEP/Windows Defender Remote Force Scan
# AUTHOR: Robert Rice
# DATE: 1/16/18
#
# Force remote virus scan on machine located on the domain
# 
# v1.0
# v1.1 - Due to some running it from x86, added OS check to force running 
#        on x64
# ===================================================================

Clear-Host

while (1 -ne 2){

$Computer = $Null
$OS = $Null
$Computer = Read-Host "Enter Computer to Scan, or EXIT to quit"

if ($Computer -eq "EXIT") {exit;}

if (($pshome -like "*syswow64*") -and ((Get-WmiObject Win32_OperatingSystem).OSArchitecture -like "64*")) {
    write-warning "Restarting script under 64 bit powershell"
 
    # relaunch this script under 64 bit shell
    & (join-path ($pshome -replace "syswow64", "sysnative")\powershell.exe) -file $myinvocation.mycommand.Definition @args
 
    # This will exit the original powershell process. This will only be done in case of an x86 process on a x64 OS.
    exit
}

Write-Host ""
Write-Host "Checking if computer is online..."

If (test-connection -count 1 -ComputerName $computer -Quiet) {$OS = gwmi win32_operatingsystem -ComputerName $computer | % caption }
    if ($OS -eq $Null)


        {Write-Host "Machine Offline"}
    elseif ($OS -like "*Win*10*")
        {Write-Host "Windows 10 - Host Online"
          PSexec.exe -s -h -d  \\$Computer -accepteula  "$($env:programfiles)\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
          Wait-Event -Timeout 15
         
}

    elseif ($OS -like "*Win*7*")
        {Write-Host "Windows 7 - Host Online"
          PSexec.exe -s -h -d \\$Computer -accepteula "$($env:programfiles)\Microsoft Security Client\MpCmdRun.exe" -Scan -ScanType 2
             Wait-Event -Timeout 15
         
}




} else{

Clear-Host
continue

}