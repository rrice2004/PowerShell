# ===================================================================
# NAME: SCCM Collection Mass Import
# AUTHOR: Robert Rice
# DATE: 1/16/18
#
# Import computers already in SCCM into a single collection.
# 
# v1.0
# ===================================================================


# Site configuration
$SiteCode = "SITE CODE HERE" # Site code 
$ProviderMachineName = "SERVER NAME HERE" # SMS Provider machine name

# Customizations
$initParams = @{}
#$initParams.Add("Verbose", $true) # Uncomment this line to enable verbose logging
#$initParams.Add("ErrorAction", "Stop") # Uncomment this line to stop the script on any errors

# Do not change anything below this line

# Import the ConfigurationManager.psd1 module 
if((Get-Module ConfigurationManager) -eq $null) {
    Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" @initParams 
}

# Connect to the site's drive if it is not already present
if((Get-PSDrive -Name $SiteCode -PSProvider CMSite -ErrorAction SilentlyContinue) -eq $null) {
    New-PSDrive -Name $SiteCode -PSProvider CMSite -Root $ProviderMachineName @initParams
}

# Set the current location to be the site code.
Set-Location "$($SiteCode):\" @initParams

#Add machines to txt file. Update CollectionName to required Collection.
Get-Content "C:\TEMP\CollectionMembers.txt" | foreach { Add-CMDeviceCollectionDirectMembershipRule -CollectionName "COLLECTION NAME HERE" -ResourceID (Get-CMDevice -Name $_).ResourceID }