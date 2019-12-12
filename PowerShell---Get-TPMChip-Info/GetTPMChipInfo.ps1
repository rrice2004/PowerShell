foreach ($computersystem in Get-Content C:\Scripts\tpmmachines.txt)
{
$computerinfo = get-wmiobject -computername $computersystem Win32_ComputerSystem
$computerBIOS = get-wmiobject -computername $computerSystem Win32_BIOS
$computerOS = get-wmiobject -computername $computerSystem Win32_OperatingSystem
$tpm = Get-WmiObject -class Win32_Tpm -namespace root\CIMV2\Security\MicrosoftTpm -ComputerName $computerSystem -Authentication PacketPrivacy | Select-Object IsEnabled_InitialValue,ManufacturerId,ManufacturerVersion,ManufacturerVersionInfo,PhysicalPresenceVersionInfo,SpecVersion
"System Information for: " + $computerinfo.Name
""
"Manufacturer: " + $computerinfo.Manufacturer
"Model: " + $computerinfo.Model
"Serial Number: " + $computerBIOS.SerialNumber
"Bios Version: " + $computerBIOS.Version
"TPM OEM ID: " + $tpm.ManufacturerId
"TPM OEM Ver: " + $tpm.ManufacturerVersion
"TPM Enabled: " + $tpm.IsEnabled_InitialValue
"Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion

"User logged In: " + $computerinfo.UserName
"Last Reboot: " + $computerinfo.ConvertToDateTime($computerOS.LastBootUpTime)
""
""

}




