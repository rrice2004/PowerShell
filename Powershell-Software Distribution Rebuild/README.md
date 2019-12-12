# Powershell-Software Distribution Rebuild
Powershell script to repair Windows update issues on Windows 7, 8 and 10

## Getting Started

1. Copy the script into your PowerShell ISE, save and run. Can be run from standalone PowerShell terminal. 
2. Download and save the file, open in PowerShell

### Prerequisites

PowerShell 5

## Usage

The script will stop the repository services. Check to see if there is altready a back up file (.bak) of the repository directory. If there is, it will remove it before renmaing the current repository directory.Once it verifies the directory has been renamed, it will restart the services.


```
Enter Computer to Update, or EXIT to quit: OFFICEDESKTOP
Checking for existing bak directory...
Stopping services...
WARNING: Waiting for service 'Cryptographic Services (cryptsvc)' to stop...
Renaming directory...
Starting Services....
WARNING: Waiting for service 'Windows Update (wuauServ)' to start...
Waiting to see if directory rebuilds...
SUCCESS: SoftwareDistribution Exists
Enter Computer to Update, or EXIT to quit: 

Enter Computer to Update, or EXIT to quit: OFFICEDESKTOP12
Checking for existing bak directory...
ERROR: Backup SoftwareDistribution directory already exists - Removing
Stopping services...
Renaming directory...
Starting Services....
Waiting to see if directory rebuilds...
SUCCESS: SoftwareDistribution Exists
Enter Computer to Update, or EXIT to quit: 




```


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


