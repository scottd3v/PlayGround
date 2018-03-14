## SYNOPSIS

Queries the [GitHub Traffic API](https://developer.github.com/v3/repos/traffic/) 

## SYNTAX

```
Get-GitHubTraffic [-owner] <String> [-repo] <String> [-traffic] <String> [-GitHubToken] <String>
```

## DESCRIPTION

Queries one of the four GitHub traffic API endpoints. 


## PARAMETERS

### -owner

The GitHub Owner of the repo.

For this example GitHub repo: https://github.com/scottd3v/PlayGround

'scottd3v' would be the owner

```yaml
Type: String

Required: True
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -repo

The GitHub repo to pull GitHub traffic on

For this example GitHub repo: https://github.com/scottd3v/PlayGround

'PlayGround' would be the repo

```yaml
Type: String

Required: True
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```


### -traffic

The traffic data to return from the [GitHub Traffic API](https://developer.github.com/v3/repos/traffic/)

Possible values are:

* referrers: Get the top 10 referrers over the last 14 days.
        
* paths: Get the top 10 popular contents over the last 14 days.
        
* views: Get the total number of views and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday.
        
* clones: Get the total number of clones and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: trigger, manual, repeated, one-time

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -GitHubToken

A GitHub personal access token.

[Find steps here for creating a token.](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

Once you have the token you'll need to format it with your GitHubUsername:thetoken

Example for user with GitHub username 'scottd3v' and token '1231326466090f318a12908ke56489l6o968l3zz'

-GitHubToken 'scottd3v:1231326466090f318a12908ke56489l6o968l3zz'

## EXAMPLES

### Example 1
```powershell
Get-GitHubTraffic -owner 'scottd3v' -repo 'PlayGround' -traffic views -GitHubToken scottd3v:1231326466090f318a12908ke56489l6o968l3zz
```
Returns the 'views' over the last 10 days for the GitHub repo 'https://github.com/scottd3v/PlayGround'

### Example 2
```powershell
Get-GitHubTraffic -owner 'scottd3v' -repo 'PlayGround' -traffic referrers -GitHubToken scottd3v:1231326466090f318a12908ke56489l6o968l3zz
```
Returns the top 10 'referrers' over the last 14 days for the GitHub repo 'https://github.com/scottd3v/PlayGround'

### Example 3
```powershell
Get-GitHubTraffic -owner 'scottd3v' -repo 'PlayGround' -traffic paths -GitHubToken scottd3v:1231326466090f318a12908ke56489l6o968l3zz
```
Returns the top 10 'paths' (pages) over the last 14 days for the GitHub repo 'https://github.com/scottd3v/PlayGround'



