---
external help file:
Module Name:
online version:
schema: 2.0.0
---

# Get-MxLookup

## SYNOPSIS
The Get-MxLookup command leverages the MxToolBox REST API to lookup DNS or Network attributes for a domain or IP address.

## SYNTAX

```
Get-MxLookup [-Command] <String> -Domain <String> [<CommonParameters>]
```

## DESCRIPTION
The Get-MxLookup command leverages the MxToolBox REST API to lookup DNS or Network attributes for a domain or IP address. Avaliable commands can be found under the 'accepted values' for the '-Command' parameter. 

## EXAMPLES

### Example 1

```powershell
PS C:\> Get-MxLookup -Command BLACKLIST -Domain azzipa.com
```

This command returns the blacklist results for the domain 'azzipa.com' from MxToolBox

## PARAMETERS

### -Command

The lookup for the command to return

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: mx, a, dns, spf, txt, soa, ptr, blacklist, smtp, http, https, ping, trace

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Domain

The domain or IP address to run the lookup against. 

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -IPAddress

Only used when running the 'ptr' Command

```yaml
Type: INT
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Online Help Get-MxLookup](https://github.com/scottd3v/PlayGround/blob/master/MxLookup/Docs/Get-MxLookup.md)