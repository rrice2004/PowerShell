Clear-Host


while (1 -ne 2){
    $Services = @("WINMGMT")
    $Computer = $Null
    $Computer = Read-Host "Enter Computer to Update, or EXIT to quit"
    Write-Host ""
    if ($Computer -eq "EXIT") {exit;}
    Write-Host -foregroundcolor DarkCyan " -----------------------------------------"
    Write-Host -foregroundcolor White " |**WMI Repair Tool for Remote Machines**|"
    Write-Host -foregroundcolor DarkCyan " -----------------------------------------"
    Write-Host ""



Write-Host -foregroundcolor DarkCyan "     Checking if machine is online."
if(Test-Connection -ComputerName $Computer -Count 1 -Quiet -WarningAction SilentlyContinue -ErrorAction SilentlyContinue) {
Write-Host -foregroundcolor Yellow "[ Alert ]: Machine is online...continuing."

if((! (@(($ENV:PATH).Split(";")) -contains "c:\WINDOWS\System32\Wbem")) -and (! (@(($ENV:PATH).Split(";")) -contains "%systemroot%\System32\Wbem"))){
	Write-Warning -foregroundcolor yellow "[ Warning ]: WMI Folder not in search path!."
}

Write-Host -foregroundcolor Cyan "[ Status ]: Rebuilding WMI...Stopping services..."
    foreach ($Service in $Services) {
    Get-Service $Service -ComputerName $Computer | Stop-Service -Force 
    if((Get-Service $Service -ComputerName $Computer).Status -ne "Stopped") {
    Write-Host -foregroundcolor red "[ Error ]: Service $Service did not stop.  Exiting"
    -ErrorAction SilentlyContinue
    }
}



Write-Host -foregroundcolor Cyan "[ Status ]: Checking directory..."
    if(Test-Path "\\$Computer\C$\Windows\System32\wbem\Repository.bak") {Write-Host -foregroundcolor Yellow "[ Alert ]: Repository.bak Exists, Removing Directory"} else {Write-Host -foregroundcolor Yellow "[ Alert ]: No Previous Backup, Sequence Initiated "}
    Remove-Item -Recurse -Force -ErrorAction Ignore  -path \\$Computer\C$\Windows\System32\wbem\Repository.bak

Rename-Item -Path \\$Computer\C$\Windows\System32\wbem\Repository  -NewName Repository.bak -Force
    Write-Host -foregroundcolor Magenta "[ Info ]: Renaming directory..."

if(Test-Path "\\$Computer\C$\Windows\System32\wbem\Repository") {
    Write-Host -foregroundcolor red " [ Error ]: Post-Rename: wbem.bak Exists - Exiting"
    exit
    }

Start-Sleep -Seconds 10


Write-Host -foregroundcolor Magenta "[ Info ]: Reregistering Files..."
    #[String[]]$aWMIBinaries=@("mofcomp.exe","scrcons.exe","unsecapp.exe","winmgmt.exe","wmiadap.exe","wmiapsrv.exe","wmiprvse.exe")
    [String[]]$aWMIBinaries=@("unsecapp.exe","wmiadap.exe","wmiapsrv.exe","wmiprvse.exe","scrcons.exe")
    foreach ($sWMIPath in @(($ENV:SystemRoot+"\System32\wbem"),($ENV:SystemRoot+"\SysWOW64\wbem"))){
	if(Test-Path -Path $sWMIPath){
		push-Location $sWMIPath
		foreach($sBin in $aWMIBinaries){
			if(Test-Path -Path $sBin){
				$oCurrentBin=Get-Item -Path  $sBin
				Write-Host " [*]Register $sBin"
				& $oCurrentBin.FullName /RegServer
			}
			else{
				# Warning only for System32
				if($sWMIPath -eq $ENV:SystemRoot+"\System32\wbem"){
					Write-Warning -foregroundcolor yellow " [ Warning ]: File $sBin not found!"
				}
			}
		}
		Pop-Location
	}
    }
	
    


Write-Host -foregroundcolor Cyan "[ Status ]: Starting Services...."
    foreach ($Service in $Services) {
    Get-Service $Service -ComputerName $Computer | Start-Service 
    if((Get-Service $Service -ComputerName $Computer).Status -ne "Running") {
        Write-Host -foregroundcolor red "[ Error ]: Service $Service did not restart.  Exiting"
        -ErrorAction SilentlyContinue
    }
    }

Write-Host -foregroundcolor Magenta "[ Info ]: Waiting to see if directory rebuilds..."
    While (1 -eq 1){
    if (Test-Path "\\$Computer\C$\Windows\System32\wbem\Repository") {break}

        Start-Sleep -Seconds 10
    }




Write-Host -foregroundcolor Magenta "[ Info ]: Directory Rebuilt"
Write-Host ""
Start-Sleep -Seconds 5


} else {
        Write-Host -foregroundcolor Magenta "[Info] $Computer is not online.`n";continue
    }


} else{

Clear-Host
continue

}