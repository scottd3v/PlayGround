---
external help file: RandomUser-help.xml
Module Name: RandomUser
online version:
schema: 2.0.0
---

# New-RandomUserCustom

## SYNOPSIS
Creates a new random user with a custom domain.

## SYNTAX

### NoAttributes (Default)
```
New-RandomUserCustom [-Domain] <String> [<CommonParameters>]
```

### Attributes
```
New-RandomUserCustom [-Domain] <String> [-Attributes] [<CommonParameters>]
```

## DESCRIPTION
Creates a new random user with a custom domain.

## EXAMPLES

### Example 1
```
PS C:\>  New-RandomUserCustom -Domain Random
```

Creates a new random user with the domain 'Random'

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

### -Domain
The domain you want to add to the email field of your random user.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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

[Online Help New-RandomUserCustom}](https://github.com/scottd3v/PlayGround/blob/master/RandomUser/Docs/New-RandomUserCustom.md)