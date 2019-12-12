# PowerShell---Get-TPMChip-Info
If a computer has a TPM chip, pull the OEM ID, Ver and if it's enabled on the machine. 

## Usage

Run from PowerShell ISE or PowerShell terminal. Read list of computers from text file. Online computers will report. Save list of computers to text file. Only machines online will report back.

* Currently tested on various Dell machines.

## Example Output
```sh
System Information for: Computer1

Manufacturer: Dell Inc.
Model: OptiPlex 3020
Serial Number: ABC1234
Bios Version: DELL   - 1072009
TPM OEM ID: 
TPM OEM Ver: 
TPM Enabled: 
Operating System: Microsoft Windows 7 Professional , Service Pack: 1
User logged In: DOMAIN\User1
Last Reboot: 08/24/2019 00:00:37


System Information for: Computer2

Manufacturer: Dell Inc.
Model: OptiPlex 3040
Serial Number: ABC1235
Bios Version: DELL   - 1072009
TPM OEM ID: 
TPM OEM Ver: 
TPM Enabled: 
Operating System: Microsoft Windows 7 Professional , Service Pack: 1
User logged In: DOMAIN\User2
Last Reboot: 08/29/2019 12:07:14


System Information for: Computer3

Manufacturer: Dell Inc.
Model: OptiPlex 3060
Serial Number: ABC1236
Bios Version: DELL   - 1072009
TPM OEM ID: 1314145024
TPM OEM Ver: 7.2
TPM Enabled: True
Operating System: Microsoft Windows 10 Pro, Service Pack: 0
User logged In: DOMAIN\User3
Last Reboot: 07/30/2019 11:30:51
```

