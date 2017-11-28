# Implement your module commands in this script.

Function New-RandomUserCustom  () {
    [CmdletBinding(DefaultParameterSetName = 'NoAttributes')]
    param
    (
        [Parameter(Mandatory, Position = 0)]
        [String]
        $Domain,

        [Parameter(ParameterSetName = 'Attributes')] ##Test this to see if this can be modified.
        [switch]
        $Attributes

    )

    if (($PSCmdlet.ParameterSetName -eq 'NoAttributes')) {
        $username = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
        $email = $username + "@$Domain.com"

        $RandomUser = [ordered]@{
            FirstName = 'Pester'
            LastName  = 'Test'
            Username  = $username
            Email     = $email
            Password  = 'Temp123!'
        }

        $NewRandomUser = New-Object psobject -Property $RandomUser
    }

    if (($PSCmdlet.ParameterSetName -eq 'Attributes')) {
        $username = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
        $email = $username + "@$Domain.com"

        $RandomUser = [ordered]@{
            FirstName                = 'Pester'
            LastName                 = 'Test'
            Username                 = $username
            Email                    = $email
            Password                 = 'Temp123!'
            NumberOfCustomAttributes = 3
            Attribute1_name          = 'Department'
            Attribute1_value         = 'Sales'
            Attribute2_name          = 'Office'
            Attribute2_value         = '456789'
            Attribute3_name          = 'Lang'
            Attribute3_value         = 'French'
        }
        $NewRandomUser = New-Object psobject -Property $RandomUser
    }


    return $NewRandomUser
}

Function New-RandomUser  () {
    [CmdletBinding(DefaultParameterSetName = 'NoAttributes')]
    param
    (
        [Parameter(ParameterSetName = 'Attributes')] ##Test this to see if this can be modified.
        [switch]
        $Attributes

    )

    if (($PSCmdlet.ParameterSetName -eq 'NoAttributes')) {
        $username = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
        $email = $username + "@RamdomUser.com"

        $RandomUser = [ordered]@{
            FirstName = 'Pester'
            LastName  = 'Test'
            Username  = $username
            Email     = $email
            Password  = 'Temp123!'
        }

        $NewRandomUser = New-Object psobject -Property $RandomUser
    }

    if (($PSCmdlet.ParameterSetName -eq 'Attributes')) {
        $username = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
        $email = $username + "@RamdomUser.com"

        $RandomUser = [ordered]@{
            FirstName                = 'Pester'
            LastName                 = 'Test'
            Username                 = $username
            Email                    = $email
            Password                 = 'Temp123!'
            NumberOfCustomAttributes = 3
            Attribute1_name          = 'Department'
            Attribute1_value         = 'Sales'
            Attribute2_name          = 'Office'
            Attribute2_value         = '456789'
            Attribute3_name          = 'Lang'
            Attribute3_value         = 'French'
        }
        $NewRandomUser = New-Object psobject -Property $RandomUser
    }


    return $NewRandomUser
}

# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function New-RandomUser, New-RandomUserCustom
