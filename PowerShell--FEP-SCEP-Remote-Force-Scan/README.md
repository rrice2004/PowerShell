# PowerShell--FEP-SCEP-Remote-Force-Scan
Simple powershell script that allows you to force scan a computer on the network with FEP/SCEP. The script will determine if the machine is on or offline, what version of Windows and run appropriate command.

This script utilizes PSExec from Microsoft (Sysinternals). Once the scan has started, you'll be presented with the PID for the MpCmdRun.exe utility scan.

Once you've been presented with the PID, script will loop back to allow another scan to be initiaited or you can exit the script.
