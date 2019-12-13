$results = @()
$computers = Get-Content C:\Temp\computers.txt



$results = foreach ($computer in $computers) {
    If (Test-Path "\\$computer\c$\Program Files (x86)\PROGRAM FOLDER HERE\*") {
        $Output =  "Directory present x86"
    }

    elseif (Test-Path "\\$computer\c$\Program Files\PROGRAM FOLDER HERE\*"){
        $Output =  "Directory present"  
    }

    else {
        $Output =  "Unknown"
    }


$details = @{
Computer = $computer
Output = $Output
}

$results += New-Object PSObject -Property $details
$results | Export-Csv C:\Temp\ZSreport.csv -NoTypeInformation
Write-Host $Computer, $Output

}




# SIG # Begin signature block
# MIIFdgYJKoZIhvcNAQcCoIIFZzCCBWMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUNvA78fr0kzq1S2zSrCJqXrCd
# x/ugggMOMIIDCjCCAfKgAwIBAgIQOCGYafIIjKhMl2NMUgjJlzANBgkqhkiG9w0B
# AQUFADAdMRswGQYDVQQDDBJMb2NhbCBDb2RlIFNpZ25pbmcwHhcNMTkwNzEwMTk1
# MjE0WhcNMjAwNzEwMjAxMjE0WjAdMRswGQYDVQQDDBJMb2NhbCBDb2RlIFNpZ25p
# bmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCheGQSnMsQNLoziXg/
# y8lsxfrqB3aSJ8W12FDVFXqA+yquuKUQqiIitpNm0Qmj3eZ+KoQ6n948Qj0L9xSE
# BwazEzls0arJFrxAlKxnR1UExOCEwOB89rLnFAYvwtiGWwaOUVyW647ptqn/ee9S
# dlRbliQtI0biFG9A0YAVQlvAq97mcO8qjN1sPMrW/qhVMlvoK52DMF8lyGKzbhyT
# 8T8ya0O49uxjGFnj7ck2xKVRhP9vI9nYZgMONsBvLG1lcGwKEFlAF/RukiWZwKsP
# Siag0/LSmihoI5hbyMaqVPu5x05OddBr2YekdlqpFf13VhElHHu+i7WWyhAIbWWm
# S6YlAgMBAAGjRjBEMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcD
# AzAdBgNVHQ4EFgQU7M1uspib+srJTai1AJ/UaUjEAiIwDQYJKoZIhvcNAQEFBQAD
# ggEBADU3HVC6YrXidr7ZQIPjUz+MVeRHcZ6hClyQZl2zJDJrM9oPEiX7WiKvcbnX
# BOHXfNLD5q0fI484p1WDhq8y+Upp0CUL8zEVzhWzfZWWX7sHFSzMGzHTTm+4L7VZ
# TFKowwPX8wl8/ivcNRM8hgpzBm/9AB2JWMmdMEM1uLfAHJmnzbKiTNE5RI9VdM7V
# tXSC99vI70HeTYH5QDRyjuLmB8bRNjfwAH4N7P5FbBYqyj590vsnotBEjED+tCKV
# O1/5bKzgdvrCxBkoGXDA/TDqLmFytRnhkbDU2ULa7nTMvIBnVkgMmNA0g3YJMVx6
# HtToJ/U8lnGoH/X9OzKKaN2rcDIxggHSMIIBzgIBATAxMB0xGzAZBgNVBAMMEkxv
# Y2FsIENvZGUgU2lnbmluZwIQOCGYafIIjKhMl2NMUgjJlzAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQUSB7qr0Eb6MKYarH91JraSmkihNkwDQYJKoZIhvcNAQEBBQAEggEAU+S0wKbM
# rwKKJcDOQyv3lFm5OK+TtygoTd8kjltJ3uznuJL7v6ycmLrMqxHijwAPKpYeCIAS
# 3GK0M6ZB9ex1iPjGH93QdjFGJv7F7HB/KvvWM9G0Ld/Qo/gw6EM/FJr//OrvQnfA
# 5LKoFLmrgRoDG8Y5aC8G12Qvbv4fiQODHVj2/w3xA0ADR9OrFMsLPhpHxUxWPZ1q
# ijdNjwhHZWWkvFHPm1L9j7Z6sLzh1WQoFOmbUx8nPtWPfB0IcFYAFUMbNHwa/TKl
# fs0uBzM/390FsxSYIk3FDMShQh7Rp+ZO0qHXTU1h/CqwQVFX9q5EhzPAKmiFB6bX
# sdB/aAstH+1sMA==
# SIG # End signature block
