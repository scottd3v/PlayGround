---
external help file: MxLookup-help.xml
Module Name: MxLookup
online version:
schema: 2.0.0
---

# Connect-MXOnline

## SYNOPSIS

Connects to MxToolBox RESTful API by setting the global variable $MXAPIKEY

## SYNTAX

```
Connect-MXOnline [-MXAPI_key] <String> [<CommonParameters>]
```

## DESCRIPTION
Connects to MxToolBox RESTful API by setting the global variable $MXAPIKEY. The MxAPIKEY can be found once logged into the site https://mxtoolbox.com/restapi.aspx

## EXAMPLES

### Example 1
```powershell
PS C:\> Connect-MXOnline -MXAPI_key '8208nota-v317-4787-8841-a16l919i12dk'
```

Sets the MXAPIKEY to '8208nota-v317-4787-8841-a16l919i12dk' and validates connectivity to MxToolbox. 

## PARAMETERS

### -MXAPI_key
The MXToolBox API key.
This key can be found by navigating to 'https://mxtoolbox.com/restapi.aspx' in a web browser

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

[Online Help Connect-MXOnline](https://github.com/scottd3v/PlayGround/blob/master/MxLookup/Docs/Connect-MXOnline.md)
