﻿Get-ADUser -Filter *  -Properties DisplayName,Office, EmailAddress | Select DisplayName, Enabled, EmailAddress | Export-Csv -Path C:\Temp\MissingADEmails.csv -NoTypeInformation