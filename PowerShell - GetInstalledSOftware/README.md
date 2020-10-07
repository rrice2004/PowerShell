
> Get Installed Software


Get installed software from remote computer and display in an HTML window that can be exported to CSV, XLSX or PDF.
Slightly modified version based on Adam Bertrams script: https://adamtheautomator.com/powershell-get-installed-software/



## Installation

Requires the OUT-HTML module by Evotec to be installed.
https://evotec.xyz/out-htmlview-html-alternative-to-out-gridview/
```sh
Install-Module PSWriteHTML -Force
```

<br />
<br />

## Usage example

Get all software installed on a remote machine.
```sh
PS> Get-InstalledSoftware -ComputerName XXXXX
```
![Alt text](https://github.com/rrice2004/PowerShell/blob/master/PowerShell%20-%20GetInstalledSOftware/Screens/all%20software.PNG) 

<br />

Get individual software installed on a remote machine.
```sh
PS> Get-InstalledSoftware -ComputerName XXXXX -Name XXXXX
```
![Alt text](https://github.com/rrice2004/PowerShell/blob/master/PowerShell%20-%20GetInstalledSOftware/Screens/Single%20Software.PNG) 

<br />
<br />


## Release History
* 0.1.1
    * Initial release



