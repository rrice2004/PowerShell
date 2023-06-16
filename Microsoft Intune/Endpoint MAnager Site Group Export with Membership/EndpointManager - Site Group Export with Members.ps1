#Script exports all site groups and displays the devices assigned to the site.
#This script REQUIRES the following modeule: Install-Module -Name ImportExcel
#WHen you run this script, you will have to log into INtune with your credentials.



# Connect to Azure AD
Connect-AzureAD

# Get all Azure AD groups that start with "Site - "
$groups = Get-AzureADGroup -SearchString "Site -"  | Where-Object {$_.DisplayName -like "Site*"}

# Create an empty array to hold the group and member information
$data = @()

# Loop through each group and get a list of its members
foreach ($group in $groups) {
    $members = Get-AzureADGroupMember -ObjectId $group.ObjectId
    foreach ($member in $members) {
        $data += [PSCustomObject]@{
            GroupName = $group.DisplayName
            MemberName = $member.DisplayName
        }
    }
}

# Export the data to an Excel file
$data | Export-Excel -Path "C:\Temp\SiteGroups.xlsx" -AutoSize -NoHeader -FreezeTopRow
