#NOTE: IF package has been picked up, is in Transit or has been delivered, result will return as invalid. THis script is designed to validate a newly submitted tracking number.

#Required to make a TLS 1.2 conenction. Won't work w/o it.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$Tracking = Read-Host "Enter Tracking Number: "

#Function to use API
$Deltr = @{
    'Uri'         = 'https://www.ups.com/track/api/Track/GetStatus'
    'Method'      = 'POST'
    'ContentType' = 'Application/Json'

    'Body' = @{'TrackingNumber' = @($Tracking)} | ConvertTo-Json 
}

#Convert from JSON to PS Object
$Results = Invoke-RestMethod @Deltr | select -ExpandProperty trackDetails  


$Status = 'Shipment Ready for UPS'

#IF/or Logic
if ($Results.errorCode -eq '402' -Or $Results.errorCode -eq '504' -Or $Results.packageStatus -notlike $Status){
    $Tracking = 'Invalid'
}
else {
    $Tracking = 'Valid'
}

$Tracking


