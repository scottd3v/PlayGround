Function Get-MxLookup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,Position=0,
        ValueFromPipelineByPropertyName=$True)]
        [ValidateSet("mx","a","dns","spf","txt","soa","ptr","blacklist","Smtp","Http","Https","ping","trace",IgnoreCase = $false)]
        [string]
        $Command
    )

    DynamicParam
    {

        If ($Command -eq 'ptr')
        {
            $attr = New-Object System.Management.Automation.ParameterAttribute
            $attr.HelpMessage = "An IP address"
            $attr.Mandatory = $true
            $attr.ValueFromPipelineByPropertyName = $true
            $attrColl = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $attrColl.Add($attr)
            $attrColl.Add((New-Object System.Management.Automation.ValidateScriptAttribute((({
                If ($_ -match [IPAddress]$_) {
                  $True
                }
                else {
                  Throw "Please enter an IP address $_ is not an IP address"
                }
              })))))
            $param = New-Object System.Management.Automation.RuntimeDefinedParameter('IPAddress',[string],$attrColl)
            $dict = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
            $dict.Add('IPAddress',$param)
            return $dict
        }


        else {

            $attr = New-Object System.Management.Automation.ParameterAttribute
                $attr.HelpMessage = "Enter a domain"
                $attr.Mandatory = $true
                $attr.ValueFromPipelineByPropertyName = $true
                $attrColl = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
                $attrColl.Add($attr)
                $attrColl.Add((New-Object System.Management.Automation.ValidateScriptAttribute((({
                    If ($_ -match "(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}(?<!-)\.)+[a-zA-Z]{2,63}$)") {
                    $True
                    }
                    else {
                    Throw "Please enter a domain such as mycompany.com or mycompany.net $_ is not a domain"
                    }
                })))))
                $param = New-Object System.Management.Automation.RuntimeDefinedParameter('Domain',[string],$attrColl)
                $dict = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
                $dict.Add('Domain',$param)
                return $dict
            
        } 

    } 
    
    begin {

        if ($MXAPIKey.length -ne 36) {Connect-MXOnline}

        $hdrs = @{
            'Authorization' = $MXAPIKey
          }
    }
    
    process {

        $URL = "https://api.mxtoolbox.com/api/v1/lookup/$Command/$($param.Value)"

        $results = Invoke-RestMethod -Method GET -Uri $URL -Header $hdrs
    }
    
    end {

        return $results
    }
}