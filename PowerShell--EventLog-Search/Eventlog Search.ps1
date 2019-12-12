# ===================================================================
# NAME: Event Log Search and Analysis 
# AUTHOR: Robert Rice
# DATE: 5/1/18
#
# Search Windows event logs by ID, error level, keyword or provider name
# 
# v1.0
# v1.1 - Added split option to search multiple ID numbers and Error Levels
#        Changed Error LEvel from numeric to text. IE: instead of entering
#        2 for Error Level, now enter the word Error. Same for Warning and Inforation
# ===================================================================

Clear-Host

while (1 -ne 2){

$Computer = $Null
$IDNum = $Null
$Lvl = $Null
$Kwrd = $Null
$Prov = $Null


Write-Host ''
$Computer = Read-Host "Enter Computer or EXIT to quit"
if ($Computer -eq "EXIT") {exit;}

$Log = Read-Host "Enter log set to retrieve"
$IDNum = Read-Host "Enter Instance ID or leave blank"
$IDNum = $IDNum.Split(',')
$MaxNum = $MaxNum = Read-Host "Enter number of logs to retrieve"
$Lvl = Read-Host "Enter error level or leave blank"
$Lvl = $Lvl.Split(',')
$Kwrd = Read-Host "Search logs by keyword or leave blank"
$Prov = Read-Host "Search by Provider or leave blank"



if ($IDNum.Length -gt 1){
   
    Get-EventLog -LogName $Log -InstanceId $IDNum -Newest $MaxNum -ComputerName $Computer | out-gridview -Title "App log events for $Computer"
        }
        
elseif ($Lvl -gt 1 )
   
    {
        Get-EventLog -LogName $Log -EntryType $Lvl -Newest $MaxNum -ComputerName $Computer | out-gridview -Title "App log events for $Computer"
        }
elseif ($Kwrd -gt "a" )
   
    {
        Get-WinEvent -FilterHashtable @{logname=$Log} -ComputerName $Computer | where-object  { $_.Message -like "*$Kwrd*" } | Select-Object -First $Maxnum  |out-gridview -Title "App log events for $Computer"
        }    

elseif ($Prov -gt 1 )
   
    {
        Get-EventLog -LogName $Log -Source $Prov -Newest $MaxNum -ComputerName $Computer | out-gridview -Title "App log events for $Computer"
        }

       

} else{


continue

}