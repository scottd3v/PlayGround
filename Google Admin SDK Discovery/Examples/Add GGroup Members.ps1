$GroupUri = 'https://www.googleapis.com/admin/directory/v1/groups/testgroup@demojumpcloud.com/members'

$body = @{
   "email" =  "ameet.jani@demojumpcloud.com"
    "role" = "MEMBER"
}

$jsonbody = $body | ConvertTo-Json

$Results = Invoke-RestMethod -Headers @{Authorization = "Bearer $($GSuiteAdminDirectoryToken.access_token)"} -Uri $GroupUri -Body $jsonbody -Method POST -ContentType 'application/json'

$Results | ConvertTo-Json