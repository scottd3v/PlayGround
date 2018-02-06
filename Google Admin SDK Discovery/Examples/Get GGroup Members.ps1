$GroupUri = "https://www.googleapis.com/admin/directory/v1/groups/testgroup%40demojumpcloud.com/members"
 
$Results = Invoke-RestMethod -Headers @{Authorization = "Bearer $($GSuiteAdminDirectoryToken.access_token)"} -Uri $GroupUri -Method GET -ContentType 'application/json'

$Results | ConvertTo-Json
