Function Add-GGroupMember {
    [CmdletBinding()]
    param (

        [Parameter(Mandatory,ValueFromPipelineByPropertyName,
        Position=0)]
        [alias("Group")]
        [String]$GroupEmailAddress,

        [Parameter(Mandatory,ValueFromPipelineByPropertyName,
        Position=1)]
        [alias("email","user","Email address")]
        [String]$UserEmailAddress
       
    )
    
    begin {

        $resultsArray = @()

    }
    
    process {

        $GroupsUri = "https://www.googleapis.com/admin/directory/v1/groups/$GroupEmailAddress/members"

        $body = @{
            "email" =  $UserEmailAddress
            "role" = "MEMBER"
        }

        $jsonbody = $body | ConvertTo-Json

        $Results = Invoke-RestMethod -Headers @{Authorization = "Bearer $($GSuiteAdminDirectoryToken.access_token)"} -Uri $GroupsUri -Body $jsonbody -Method POST -ContentType 'application/json'

        $FomattedResult = [pscustomobject]@{

            'Group' = $GroupEmailAddress
            'User' = $Results.email
            'Role' = $Results.role
            'Status' = $Results.status
        }

        $resultsArray += $FomattedResult

    }
    
    end {
        
        Return $resultsArray

    }
}
