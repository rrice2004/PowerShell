# PowerShell---Check Remote File Patch
Dirty, but simple PowerShell script to check if a remote patch exists on a computer and save the results in a csv file.

## Usage
Add the computer(s) to the computers.txt file and save to you C:\Temp folder.
Locate the program folder you're searching for and modify the script to lookin both the Program Files (x86) and Program Files directory.
Run the powershell script. 
Once complete, check the temp folder for the csv report.


```sh
C:\Scripts\Check File Path Remotley.ps1
Computer1 Adobe Directory present x86
Computer2 Adobe Directory present x86
Computer3 Adobe Unknown
Computer4 Adobe Directory present

```
