Clear-Host

while (1 -ne 2){
    $Services = @("WINMGMT")
    $Computer = $Null
    $Computer = Read-Host "Enter Computer to Update, or EXIT to quit"
    Write-Host ""
if ($Computer -eq "EXIT") {exit;}

$Services = @("wuauServ","bits","msiserver","cryptsvc")

Write-Host -foregroundcolor Cyan "Checking for existing bak directory..."
[System.Threading.Thread]::Sleep(1500)
if(Test-Path "\\$Computer\C$\Windows\SoftwareDistribution.bak") {
    Write-Host -foregroundcolor red "ERROR: Backup SoftwareDistribution directory already exists - Removing"
    Remove-Item "\\$Computer\C$\Windows\SoftwareDistribution.bak" -recurse
    [System.Threading.Thread]::Sleep(1500)
    
}

Write-Host -foregroundcolor yellow "Stopping services..."
foreach ($Service in $Services) {
    Get-Service $Service -ComputerName $Computer | Stop-Service
    [System.Threading.Thread]::Sleep(1500)
    if((Get-Service $Service -ComputerName $Computer).Status -ne "Stopped") {
        Write-Host -foregroundcolor red "ERROR: Service $Service did not stop.  "
        continue
    }
}

Write-Host -foregroundcolor Cyan "Renaming directory..."
Rename-Item -Path \\$Computer\C$\Windows\SoftwareDistribution  -NewName SoftwareDistribution.bak 
Rename-Item -Path \\$Computer\C$\Windows\System32\catroot2  -NewName catroot2.bak
[System.Threading.Thread]::Sleep(1500)
if(Test-Path "\\$Computer\C$\Windows\SoftwareDistribution") {
    Write-Host -foregroundcolor red " ERROR: Post-Rename: SoftwareDistribution Exists"
    exit
}

Write-Host -foregroundcolor yellow "Starting Services...."
foreach ($Service in $Services) {
    Get-Service $Service -ComputerName $Computer | Start-Service
    [System.Threading.Thread]::Sleep(1500)
    if((Get-Service $Service -ComputerName $Computer).Status -ne "Running") {
        Write-Host "ERROR: Service $Service did not restart."
        exit
    }
}

Write-Host -foregroundcolor Cyan "Waiting to see if directory rebuilds..."
[System.Threading.Thread]::Sleep(1500)

if(Test-Path "\\$Computer\C$\Windows\SoftwareDistribution") {Write-Host -foregroundcolor green "SUCCESS: SoftwareDistribution Exists"} else {Write-Host -foregroundcolor red "ERROR: Post-Check: SoftwareDistribution Does not Exist"}

} else{

Clear-Host
continue

}

# SIG # Begin signature block
# MIIFdgYJKoZIhvcNAQcCoIIFZzCCBWMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU3Xt18NLXo8y0zAobx+7sWJvt
# 0UKgggMOMIIDCjCCAfKgAwIBAgIQOCGYafIIjKhMl2NMUgjJlzANBgkqhkiG9w0B
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
# FgQUFPflBXsUaOFtdZsmRIV+ZBp3GT0wDQYJKoZIhvcNAQEBBQAEggEAnbnxLH43
# Qq6zqAqkCxfIU0JKcAg27u19EDk9UnJeIxTg+20hwrr1gF0BS8Fg/O51gEpFLyeV
# 0g8164yuV8UmnaHna9bAu48eMyP/SQ0mb0sj1GqFpL6iT2aGxZq9o2bvHCS2WK7A
# wVVVnCiJfS6lbneENe3qaGPzGC9QHFMaqvkmNvfZP9sCn06C+G7BbGD+ejRM1gaT
# UkucmnBTPIfZN2+9zEBvMsdOh6q6fLSE/u/ukhco2CQDROJVcnRw8YfMtc4FdMCg
# hLvU30qpBCob19J+azr+2GOXntWv1HUbsGWOTbPlIMTose7CdfWmBIngjTIe/Aqc
# 6mrbQ8aVFXvmxw==
# SIG # End signature block
