---
external help file: RandomUser-help.xml
Module Name: RandomUser
online version:
schema: 2.0.0
---

# New-RandomUser

## SYNOPSIS
Creates a user with a username that is an 8 character random string.

## SYNTAX

### NoAttributes (Default)
```
New-RandomUser [<CommonParameters>]
```

### Attributes
```
New-RandomUser [-Attributes] [<CommonParameters>]
```

## DESCRIPTION
Creates a new user with a username that is an 8 character string.

## EXAMPLES

### Example 1
```
PS C:\> New-RandomUser
```

Creates a random user

### Example 2
```
PS C:\> New-RandomUser -Attributes
```

Creates a random user with attributes

## PARAMETERS

### -Attributes
A switch parameter to add three attributes to the random user.

```yaml
Type: SwitchParameter
Parameter Sets: Attributes
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Help New-RandomUser](https://github.com/scottd3v/PlayGround/blob/master/RandomUser/Docs/New-RandomUser.md)
