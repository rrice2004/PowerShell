# Powershell-WMI-Repair
Powershell script to repair WMI issues on Windows 7, 8 and 10

## Getting Started

1. Copy the script into your PowerShell ISE, save and run. Can be run from standalone PowerShell terminal. 
2. Download and save the file, open in PowerShell

### Prerequisites

PowerShell 5

## Usage

The script will stop the repository services. Check to see if there is altready a back up file (.bak) of the repository directory. If there is, it will remove it before renmaing the current repository directory.Once it verifies the directory has been renamed, it will restart the services.


```
Enter Computer to Update, or EXIT to quit: OFFICEDESKTOP

 -----------------------------------------
 |**WMI Repair Tool for Remote Machines**|
 -----------------------------------------

     Checking if machine is online.
[ Alert ]: Machine is online...continuing.
[ Status ]: Rebuilding WMI...Stopping services...
[ Status ]: Checking directory...
[ Alert ]: Repository.bak Exists, Removing Directory
[ Info ]: Renaming directory...
[ Info ]: Reregistering Files...
 [*]Register unsecapp.exe
 [*]Register wmiadap.exe
 [*]Register wmiapsrv.exe
 [*]Register wmiprvse.exe
 [*]Register scrcons.exe
 [*]Register wmiadap.exe
 [*]Register wmiprvse.exe
[ Status ]: Starting Services....
[ Info ]: Waiting to see if directory rebuilds...
[ Info ]: Directory Rebuilt

Enter Computer to Update, or EXIT to quit:
```


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


