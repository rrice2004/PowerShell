#Added error skip for offline machines
$ErrorActionPreference = 'SilentlyContinue'
$Results = @()

#Created custom object list to store results to get printed out. Will get display in powershell window and csv file
foreach ($computersystem in Get-Content C:\Scripts\tpmmachines.txt) 
    { $computerinfo = get-wmiobject -computername $computersystem Win32_ComputerSystem 
    $computerBIOS = get-wmiobject -computername $computerSystem Win32_BIOS 
    $computerOS = get-wmiobject -computername $computerSystem Win32_OperatingSystem 
    $tpm = Get-WmiObject -class Win32_Tpm -namespace root\CIMV2\Security\MicrosoftTpm -ComputerName $computerSystem -Authentication PacketPrivacy | Select-Object IsEnabled_InitialValue,ManufacturerId,ManufacturerVersion,ManufacturerVersionInfo,PhysicalPresenceVersionInfo,SpecVersion 

    $object = New-Object PSObject -Property  ([ordered]@{

    ComputerName = $computerinfo.Name 
    Manufacturer = $computerinfo.Manufacturer
    Model = $computerinfo.Model
    SerialNumber = $computerBIOS.SerialNumber
    BiosVersion = $computerBIOS.Version
    TPM_OEM_ID = $tpm.ManufacturerId
    TPM_OEM_Ver = $tpm.ManufacturerVersion
    TPM_Enabled = $tpm.IsEnabled_InitialValue
    OperatingSystem = $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
    User = $computerinfo.UserName
    Last_Reboot = $computerinfo.ConvertToDateTime($computerOS.LastBootUpTime)
    } )

    $Results += $object

    }


$results | Export-Csv C:\Temp\chiptest.csv -Append -NoTypeInformation


