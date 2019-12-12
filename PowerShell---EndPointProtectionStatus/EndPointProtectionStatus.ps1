# ===================================================================
# NAME: EndPointProtectionStatusCheck.ps1
# AUTHOR: Robert Rice
# DATE: 1/16/18
#
# Check the status and history of FEP on client machine
# 
# v1.0
# v1.1 - Added Malware Client Version number 
# v1.2 - Added Client Display Name and Engine Version
# ===================================================================

Clear-Host
while (1 -ne 2){
    
$Computer = $Null
$OS = $Null
$Computer = Read-Host "Enter Computer to Scan, or EXIT to quit"
Write-Host ""
if ($Computer -eq "EXIT") {exit;}
 if(Test-Connection -ComputerName $Computer -Count 1 -Quiet -WarningAction SilentlyContinue -ErrorAction SilentlyContinue){



$PCHEALTH = Get-WmiObject -Query "select * from AntiMalwareHealthStatus" -Namespace "root\Microsoft\SecurityClient" -ComputerName $Computer | Select-Object PSComputerName,AntispywareEnabled,AntispywareSignatureUpdateDateTime,AntivirusEnabled,AntivirusSignatureUpdateDateTime,LastFullScanDateTimeEnd,RtpEnabled,NisEnabled,NisSignatureVersion,Version, AntispywareSignatureVersion, AntiVirusSignatureVersion, EngineVersion
$PCINFSTAT = Get-WmiObject -Query "select * from AntiMalwareInfectionStatus" -Namespace "root\Microsoft\SecurityClient" -ComputerName $Computer | Select-Object CriticallyFailedDetections,PendingFullScan,PendingReboot,RecentlyCleanedDetections
$PCDETECTION = Get-WmiObject -Query "select * from Malware" -Namespace "root\Microsoft\SecurityClient" -ComputerName $Computer | Select-Object ThreatName,path, SeverityID, User,DetectionTime,ActionSuccess 
$Client = Get-WmiObject -Query "select * from AntiVirusProduct" -Namespace "root\SecurityCenter2" -ComputerName $Computer
Write-Host "EndPoint Status Check"

$Object = New-Object PSObject -Property ([ordered]@{
    ComputerName    = $PCHEALTH.PSComputerName
    Client = $Client.displayname
  
    "Engine Version" = $PCHEALTH.EngineVersion
    "AntiVirus Sig Version"     = $PCHEALTH.AntiVirusSignatureVersion
    "AntiSpyware Sig Version"    = $PCHEALTH.AntispywareSignatureVersion
    "AntiSpyware Enabled"     = $PCHEALTH.AntispywareEnabled    
    "Spyware Definition Update" = $PCHealth.AntispywareSignatureUpdateDateTime
    "AntiVirus Enabled"         = $PCHealth.AntivirusEnabled    
    "AntiVirus Definitions" =$PCHealth.AntivirusSignatureUpdateDateTime
    "Last Full Scan"    = $PCHealth.LastFullScanDateTimeEnd
    "RealTimeProtection" = $PCHealth.RtpEnabled
     
    "AntiMaleware Enabled"    = $PCHealth.NisEnabled
    "AntiMalware Def"   = $PCHealth.NisSignatureVersion

     
   
    "Failed Detections"    = $PCINFSTAT.CriticallyFailedDetections -join "`n"
    "Pending Full Scan"    = $PCINFSTAT.PendingFullScan
    "Pending Reboot"    = $PCINFSTAT.PendingReboot
    "Recently Cleaned"    = $PCINFSTAT.RecentlyCleanedDetections

   

    "Threat Name"   = $PCDETECTION.ThreatName -join "`n"
    "Severity"   = $PCDETECTION.SeverityID
    "Path"    =  $PCDETECTION.Path -join "`n"
    "User"    = $PCDETECTION.User -join "`n"
    "Infection Reported"    = $PCDETECTION.DetectionTime -join "`n"
    "Able To Clean"   = $PCDETECTION.ActionSuccess
} )

Write-Output $Object 




    } else {
        Write-Host "$Computer is not online.`n";continue
    }
}

  

 
   

 
