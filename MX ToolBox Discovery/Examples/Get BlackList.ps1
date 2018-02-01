# API Call - GET Example
# Interactive version https://mxtoolbox.com/User/Api/Lookup.aspx

$Url = "https://api.mxtoolbox.com/api/v1/lookup/blacklist/JumpCloud.com"

$APIkey = "Enter your API key"

$hdrs = @{
    
    'Authorization'    = $APIkey

}

$APIresults = Invoke-RestMethod -Uri $Url -Method GET -Header $hdrs #Results sored in $APIresults variable

$APIresults #Shows the returned data

$APIresults | ConvertTo-Json #Show the data structure as it was returned. 

$APIresults | Get-Member #Shows the avaliable properties to select or filter

$APIresults | Select-Object Failed, Warnings, Passed

$APIresults | Select-Object Failed, Warnings, Passed | Format-List

#Basic Function 

#Basic

function Get-MxLookupBasic ($Command, $Domain) {
    
    $Url = "https://api.mxtoolbox.com/api/v1/lookup/$Command/$Domain"

    $APIkey = "Enter your API key"

    $hdrs = @{
    
      'Authorization'    = $APIkey

        }

    $APIresults = Invoke-RestMethod -Uri $Url -Method GET -Header $hdrs #Results stored in $APIresults 

    Return $APIresults
}
