# Source https://lazyadmin.nl/it/connect-to-google-api-with-powershell/
# Help https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Help/Connect%20to%20the%20Google%20Admin%20API%20in%20PowerShell.md
Function Connect-GGAdminDirectory {
    [CmdletBinding()]
    param (

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName=$True)]
        [string]
        $ClientID,

        [Parameter(Mandatory,
        ValueFromPipelineByPropertyName=$True)]
        [string]
        $ClientSecret,

        [Parameter(
        ValueFromPipelineByPropertyName=$True)]
        [string]
        $Scope = 'https://www.googleapis.com/auth/admin.directory.group'
        
    )
    
    begin {
    }
    
    process {

        $Url = "https://accounts.google.com/o/oauth2/auth?client_id=$($ClientID)&scope=$($Scope)&response_type=code&redirect_uri=http://localhost/oauth2callback&access_type=offline&approval_prompt=force"

        Write-Host "`nNavigate to the following link in your web browser`n"
        Write-Host "`n$URL`n" -Foregroundcolor Yellow
        Write-Host "`n After singing in with your G-Suite admin account, grant access and then copy and paste the full URL returned by your web browser below`n" -ForegroundColor Green
        $AuthorizationURL = Read-Host "Authorization URL"
        
        $AccessToken = ($AuthorizationURL.Split('=')[1]).Replace('#','') #Captures AccessToken from URL

        $RedirctURI = 'http://localhost/oauth2callback'

        $requestUri = "https://www.googleapis.com/oauth2/v4/token"
 
        $body = @{
            
            code = $AccessToken;
            client_id = $ClientID;
            client_secret= $ClientSecret;
            redirect_uri= $RedirctURI;
            grant_type= "authorization_code";
        }

        $Global:GSuiteAdminDirectoryToken = Invoke-RestMethod -Uri $requestUri -Method POST -Body $body;

    }
    
    end {

        Return $GSuiteAdminDirectoryToken
    }
}
