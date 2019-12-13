# PowerShell---Dirty-Simple-ADUser-Search
Dirty, but simple PowerShell script to quickly search AD for a user

## Usage
Run the powershell script. Enter the users full name as it's listed in your AD.
Returns the following informationon the user:
* Name
* Last Log on Date
* Account Enabled
* Account Locked
* Is Password Expired
* Bad Logon Count


```sh
Enter user to search, or EXIT to quit: john.doe

Friday 08/30/2019 16:38


Name            : Doe, John
LastLogOnDate   : 8/25/2019 2:26:51 PM
Enabled         : True
LockedOut       : False
PasswordExpired : False
BadLogonCount   : 2



Enter user to search, or EXIT to quit:
```
