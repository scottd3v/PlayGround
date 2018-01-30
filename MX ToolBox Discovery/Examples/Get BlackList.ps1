# API Call - GET Example
# Interactive version https://mxtoolbox.com/User/Api/Lookup.aspx

$APIkey = "Enter API Key"

$Url = "https://api.mxtoolbox.com/api/v1/lookup/blacklist/entercompanyname.com"

$hdrs = @{
    
    'Authorization'    = $APIkey

}

$APIresults = Invoke-RestMethod -Method GET -Uri $Url  -Header $hdrs

$APIresults | ConvertTo-Json #Show the data structure. "Poor mans Show-Object"
