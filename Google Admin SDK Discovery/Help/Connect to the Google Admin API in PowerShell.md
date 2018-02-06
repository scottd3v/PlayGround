# Connect to the Google Admin API in PowerShell

## Part 1 : Create a Google API Project

#### Step 1

Log into the [Google Developers Console](https://console.developers.google.com/)

#### Step 2 

Create a 'New Project' 

![Create a New Project](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Help/Gifs/GAPI_NewProject.gif)

#### Step 3

Enable the Admin SDK API

![Enable the Admin SDK API](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Help/Gifs/GAPI_AdminSDK.gif)

#### Step 4

Give OAuth Consent 

![Give OAuth Consent](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Help/Gifs/GAPI_OAuthConsent.gif)

#### Step 5 

Create credentials

![Create credentials](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Help/Gifs/GAPI_CreateCredentials.gif)

**In the Authorized redirect URIs box enter:  http://localhost/oauth2callback**



## Part 2 : Getting access tokens in PowerShell 

#### Step 1
Clone the [PlayGround repo](https://github.com/scottd3v/PlayGround) or load the [Google Admin SDK Discovery Functions](https://github.com/scottd3v/PlayGround/tree/master/Google%20Admin%20SDK%20Discovery/Functions) into a PowerShell terminal.

#### Step 2 
Run the Connect-GGAdminDirectory function

![Run the Connect-GGAdminDirectory command](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Help/Gifs/Connect-GGAdminDirectory.gif)

The tokens will live within the global variable $GSuiteAdminDirectoryToken

This token is valid for one hour and scoped to the https://www.googleapis.com/auth/admin.directory.group scope. 

Once authenticated the functions [Add-GGroupMember](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Functions/Add-GGroupMember.ps1) and [Get-GGroupMember](https://github.com/scottd3v/PlayGround/blob/master/Google%20Admin%20SDK%20Discovery/Functions/Get-GGroupmember.ps1) will reference this token.
