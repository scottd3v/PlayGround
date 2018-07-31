function Set-ClipboardMacOS
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, Position = 0,
            ValueFromPipeline = $True)]
        $stringtocopy
    )
    
    begin
    {
    }
    
    process
    {
        [string]$stringtocopy | pbcopy
    }
    
    end
    {
    }
}

Set-Alias -Name clip -Value Set-ClipboardMacOS