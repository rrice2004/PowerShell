<#Get a list of all  Device ID's and Azure Device ID's and device category from Intune, exported to csv
Azure Device ID's required for bulk importing into groups.
Group will show current group device belongs to.
See end of script for additional properties that can be pulled.
#>


Import-Module Microsoft.Graph.Intune
Connect-MSGraph
Get-IntuneManagedDevice | Get-MSGraphAllPages | Select DeviceName,azureADDeviceId, ID, deviceCategoryDisplayName |Export-Csv -Path "c:\Temp\Listdevice.csv"








<#

Optional properties that can be pulled:
id                                
userId                                   
deviceName                              
enrolledDateTime                         
lastSyncDateTime                      
complianceState                       
azureADDeviceId
deviceCategoryDisplayName                
isEncrypted                            
userPrincipalName                
model                     
serialNumber                      
userDisplayName     
wiFiMacAddress      
managedDeviceName

#>
