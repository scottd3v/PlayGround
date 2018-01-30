# https://mxtoolbox.com/User/Api/Lookup.aspx Function To replace this
function Get-MxLookup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName=$True)]
        [ValidateSet("mx","a","dns","spf","txt","soa","ptr","blacklist","smtp","tcp","http","https","ping","trace")]
        [string]
        $Command,

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName=$True)]
        [string]
        [ValidateScript({
            If ($_ -like "*.*") {
              $True
            }
            else {
              Throw "Please enter a domain such as mycompany.com or mycompany.net $_ is not a domain"
            }
          })]
        $Domain
    )
    
    begin {

        if ($MXAPIKey.length -ne 36) {Connect-MXOnline}

        $hdrs = @{
            'Authorization' = $MXAPIKey
          }
    }
    
    process {

        $URL = "https://api.mxtoolbox.com/api/v1/lookup/$Command/$Domain"

        $results = Invoke-RestMethod -Method GET -Uri $URL -Header $hdrs
    }
    
    end {

        return $results
    }
}


