

Clear-Host


while (1 -ne 2){
    
    $Computer = $Null
    $Computer = Read-Host "Enter Computer name, or EXIT to quit"
    Write-Host ""
    if ($Computer -eq "EXIT") {exit;}
    Write-Host -foregroundcolor Cyan "[ INFO ]:  Getting Installed Updates for $Computer"
    Write-Host -foregroundcolor Cyan "[ INFO ]:  Checking if machine is online."
if(Test-Connection -ComputerName $Computer -Count 1 -Quiet -WarningAction SilentlyContinue -ErrorAction SilentlyContinue) {
    Write-Host -foregroundcolor Yellow "[ Alert ]: Machine is online...continuing."

    Get-HotFix -ComputerName $Computer | Where-Object {$_.Installedon -gt ((Get-Date).Adddays(-360))}|Select-Object -Property PSComputerName,Description,InstalledOn, HotFixID, InstalledBy| sort InstalledOn  | Out-GridView -Title "Installed Updates for $Computer"
    Write-Host -foregroundcolor Cyan "[ INFO ]: See Output Grid for results."
    Write-Host ""

    } else {
        Write-Host -foregroundcolor Red "[ ERROR ]: $Computer is not online.`n";continue
    }


} else{

Clear-Host
continue

}
# SIG # Begin signature block
# MIIFdgYJKoZIhvcNAQcCoIIFZzCCBWMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU7NCcjPgR9rZnocDtvKfYgUYr
# 122gggMOMIIDCjCCAfKgAwIBAgIQOCGYafIIjKhMl2NMUgjJlzANBgkqhkiG9w0B
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
# FgQUIHDb2tcsPzS53ENps82VD6VrzakwDQYJKoZIhvcNAQEBBQAEggEAdj9ZL/rJ
# LVnjUlVuvbbdlE92MnPFekdA2EfWNpYhmyFLNWrCMTh6dqeOAUZv7L/i8nDrU3dP
# skywZQemWa/3q/KCq/lSeY4Dayb84UCHbKEWTCEb3Adv2eZ0DO1sKi/WY6YDLed5
# Esfaeq0yCFRcZf9IH6vLS7RCRzE4FTS8Lw/H+79sMQ142sAd/iQqH+0s5+bXYFdO
# BlM3xuRg7GeeiMWtLcObfAHFmNJ1TENXJgZnTpu0QaWemh65XRqpm4gn1QyEilJ3
# 1cwbggWTEcqpBiT0KVfy5X/vY8prVXubTyG830VMBkensBYbZWuKkmCKPnKsF2hJ
# eYAq0eVhTj0h3w==
# SIG # End signature block
