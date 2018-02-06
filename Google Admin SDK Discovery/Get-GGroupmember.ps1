Function Get-GGroupMember {
    [CmdletBinding()]
    param (

    [Parameter(Mandatory,ValueFromPipelineByPropertyName,
    Position=0)]
    [String]$GroupEmailAddress
        
    )
    
    begin {

        $resultsArray = @()

    }
    
    process {

        $GroupsUri = "https://www.googleapis.com/admin/directory/v1/groups/$GroupEmailAddress/members"


        $Results = Invoke-RestMethod -Headers @{Authorization = "Bearer $($GSuiteAdminDirectoryToken.access_token)"} -Uri $GroupsUri  -Method GET -ContentType 'application/json'

        foreach ($user in $Results.members){

            $FormattedResult = [pscustomobject] @{

                'Group' = $GroupEmailAddress
                'User' = $user.email
                'Role' = $user.role
                'Status' = $user.Status


            }

            $resultsArray += $FormattedResult

        }
    }
    
    end {

        return $resultsArray
    }
}