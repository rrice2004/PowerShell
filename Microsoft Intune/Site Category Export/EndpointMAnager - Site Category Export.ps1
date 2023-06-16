#Export the Device site categories from Azure.

Import-Module Microsoft.Graph.Intune
Connect-MSGraph

# Set the output file path
$outputFilePath = "C:\Temp\EPM Device Category.csv"

# Retrieve the device categories and store them in a variable
$deviceCategories = Get-DeviceManagement_DeviceCategories

# Export the data to a CSV file
$deviceCategories | Export-Csv -Path $outputFilePath -NoTypeInformation
