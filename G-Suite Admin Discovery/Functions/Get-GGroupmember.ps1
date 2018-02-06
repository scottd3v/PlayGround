Function Get-GGroupMember {
    [CmdletBinding()]
    param (

    [Parameter(Mandatory,ValueFromPipelineByPropertyName,
    Position=0)]
    [String]$GroupEmailAddress
        
    )
    
    begin {
    }
    
    process {

        $GroupsUri = "https://www.googleapis.com/admin/directory/v1/groups/$GroupEmailAddress/members"


        $Results = Invoke-RestMethod -Headers @{Authorization = "Bearer $($GSuiteAdminDirectoryToken.access_token)"} -Uri $GroupsUri  -Method GET -ContentType 'application/json'
    }
    
    end {

        Return $Results.members.email
    }
}