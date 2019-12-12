# PowerShell---EndPointProtectionStatus
Simple powershell script to quickly get important information from Microsoft's End Point Protection software from remote machines.
Just enter a machine name on the network and get what you need. Will list time stamps, engine versions, recently cleaned infections, pending reboots and more.

The script utilizes the Get-WmiObject function. Once th script has completed, it loops back to enter another machine to check or you can exit the script. 
