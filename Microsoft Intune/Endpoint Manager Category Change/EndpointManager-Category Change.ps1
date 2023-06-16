#Script to make bulk changes to device catgeory in Intune.
# Need to pull device id's using the ExportDeviceID script
# Run Get-DeviceManagement_DeviceCategories to get a list of Categories and the associated ID
# Replace the $DeviceCategory below with appropriate ID


Import-Module Microsoft.Graph.Intune
Connect-MSGraph

#Read Device ID's from CSV file.


$DeviceCategory = "ENTER YOUR CATEGORY ID HERE"
$DeviceListID = Get-Content -Path C:\temp\categoryimport.csv
ForEach($DeviceID in $DeviceListID)
    {
    Try
        {
        $requestBody = @{ "@odata.id" = "https://graph.microsoft.com/beta/deviceManagement/deviceCategories/$DeviceCategory" }
          
        Invoke-MSGraphRequest -HttpMethod PUT -Url "deviceManagement/managedDevices/$DeviceID/deviceCategory/`$ref" -Content $requestBody
        Write-Output "Updated $DeviceID" | Export-Csv -Path "C:\Temp\CategoryUpdate.csv" -Append
        Write-Host "Updated $DeviceID"
    }
    Catch
    {
        Write-Output "Failed to update $DeviceID" | Export-Csv -Path "C:\Temp\CategoryUpdate.csv" -Append
        Write-Host "Failed to update $DeviceID"
    }
}






