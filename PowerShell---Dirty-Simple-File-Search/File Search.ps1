$Path = Read-Host  " Path to file location. IE: C:\Users\<username "
$Text = Read-Host  " Keyword to search "
$PathArray = @()

Get-ChildItem $Path -Filter "*.txt*" |
Where-Object {$_.Attributes -ne "Directory"}|
ForEach-Object {
if (Get-Content $_.FullName | Select-String -Pattern $Text){
    $PathArray += $_.FullName
   
    }
}
Write-Host ""
Write-Host -foregroundcolor Yellow "Search for $Text found in the following logs:"
Write-Host ""
$PathArray | ForEach-Object {$_}


