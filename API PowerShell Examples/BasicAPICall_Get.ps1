# API Call - GET Example

$APIkey = "Replace with API KEY"

$Url = "Replace with URL"

$hdrs = @{
    
    'Content-Type' = 'application/json'
    'Accept'       = 'application/json'
    'X-API-KEY'    = $APIkey

} #Example headers. Headers are unique to the RESTful API. 

$APIresults = Invoke-RestMethod -Method GET -Uri $Url  -Header $hdrs

$APIresults | ConvertTo-Json #Shows data structure. "Poor mans Show-Object"
