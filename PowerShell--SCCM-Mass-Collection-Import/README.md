# PowerShell--SCCM-Mass-Collection-Import
Instead of manually going through and adding a number of computers into a single collection one at a time, 
this Powershell script utilizes a text file of computer names and imports them into a single collection.
Only changes needed to the script are the Site Code, Provider Machine name(Server) of your SCCM server 
and the collection you're going to ad the machines to. 

    # Site configuration
    $SiteCode = "SITE CODE HERE" # Site code 
    $ProviderMachineName = "SERVER NAME HERE" # SMS Provider machine name
    
    
    foreach { Add-CMDeviceCollectionDirectMembershipRule -CollectionName "COLLECTION NAME HERE" -ResourceID 
    (Get-CMDevice -Name $_).ResourceID }


