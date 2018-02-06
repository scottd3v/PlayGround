# Connect to the Google Admin API in PowerShell

## Part 1 : Create a Google API Project

#### Step 1

Log into the [Google Developers Console](https://console.developers.google.com/)

#### Step 2 

Create a 'New Project' 

![Create a New Project](https://github.com/scottd3v/PlayGround/blob/master/G-Suite%20Admin%20Discovery/Help/Gifs/GAPI_NewProject.gif)

#### Step 3

Enable the Admin SDK API

![Enable the Admin SDK API](https://github.com/scottd3v/PlayGround/blob/master/G-Suite%20Admin%20Discovery/Help/Gifs/GAPI_AdminSDK.gif)

#### Step 4

Give OAuth Consent 

![Give OAuth Consent](https://github.com/scottd3v/PlayGround/blob/master/G-Suite%20Admin%20Discovery/Help/Gifs/GAPI_OAuthConsent.gif)

#### Step 5 

Create credentials

![Create credentials](https://github.com/scottd3v/PlayGround/blob/master/G-Suite%20Admin%20Discovery/Help/Gifs/GAPI_CreateCredentials.gif)

**In the Authorized redirect URIs box enter:  http://localhost/oauth2callback**



## Part 2 : Getting access tokens in PowerShell 