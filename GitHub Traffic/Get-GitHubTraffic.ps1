Function Get-GitHubTraffic {
    [CmdletBinding()]
    param (

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName)]
        [String]$owner,

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName)]
        [String]$repo,

        <#
        referrers: Get the top 10 referrers over the last 14 days.
        paths: Get the top 10 popular contents over the last 14 days.
        views: Get the total number of views and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday.
        clones: Get the total number of clones and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday.
        
        #>

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName=$True)]
        [string]
        [ValidateSet('referrers','paths','views','clones')]
        $traffic, 

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName=$True)]
        [string]
        $GitHubToken    
    )
    
    begin {

        $Base64Token = [System.Convert]::ToBase64String([char[]] $GitHubToken) # Create base64 token
        $Hdrs = @{Authorization = 'Basic {0}' -f $Base64Token} # Set headers 
    }
    
    process {

        switch ($traffic) {

            referrers { 
                
                $ReferrersUrl = "https://api.github.com/repos/$owner/$repo/traffic/popular/referrers"

                $Results = Invoke-RestMethod -Headers $Hdrs -Method Get -Uri $ReferrersUrl

                Return $Results

            }
            paths {

                $PathsURL = "https://api.github.com/repos/$owner/$repo/traffic/popular/paths"

                $Results = Invoke-RestMethod -Headers $Hdrs -Method Get -Uri $PathsURL

                Return $Results

            }
            views {

                $ViewsURL = "https://api.github.com/repos/$owner/$repo/traffic/views"

                $Results = Invoke-RestMethod -Headers $Hdrs -Method Get -Uri $ViewsURL

                Return $Results.views

            }
            clones {

                $ClonesURL = "https://api.github.com/repos/$owner/$repo/traffic/clones"

                $Results = Invoke-RestMethod -Headers $Hdrs -Method Get -Uri $ClonesURL

                Return $Results.clones

            }
        }
    }
    
    end {}
}