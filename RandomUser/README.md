# New User

## Installation

To install the New User module first clone the 'NewUsers' folder and then navigate to the folder within a shell that supports PowerShell

Next run the command:

```PowerShell

PS /NewUser> Import-Module ./NewUser.psd1

```

After importing you can see all the avaliable commands in the module by running the command:

```PowerShell

PS RandomUser> Get-Command -Module RandomUser

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        New-RandomString                                   1.1.0      RandomUser
Function        New-RandomUser                                     1.0.1      RandomUser
Function        New-RandomUserCustom                               1.0.1      RandomUser


```

User these commands to create new user information for testing.