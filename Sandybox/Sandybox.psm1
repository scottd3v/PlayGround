# Implement your module commands in this script.

Function Connect-SandyOnline ()
{
    [CmdletBinding(DefaultParameterSetName = 'Interactive')]

    param
    (
        [Parameter(
            ParameterSetName = 'force',
            Mandatory,
            ValueFromPipelineByPropertyName,
            Position = 0)]
        
        [Parameter(Mandatory = $True,
            ParameterSetName = 'Interactive',
            Position = 0,
            HelpMessage = "Please enter your favorite color")]

        [string]$FavoriteColor,

        [Parameter(
            ParameterSetName = 'force')]
        [Switch]
        $force
    )

    begin
    {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

        $GitHubModuleInfoURL = 'https://github.com/scottd3v/PlayGround/blob/master/Sandybox/ModuleBanner.md' #Update this

        $ReleaseNotesURL = 'https://github.com/scottd3v/PlayGround/blob/master/Sandybox/ModuleChangelog.md' #Update this


    }

    process
    {


    }

    end
    {
        if ($PSCmdlet.ParameterSetName -eq 'Interactive')
        {

            Write-Host -BackgroundColor Green -ForegroundColor Black "Successfully connected to Sandybox"

            $GitHubModuleInfo = Invoke-WebRequest -uri  $GitHubModuleInfoURL -UseBasicParsing | Select-Object RawContent

            $CurrentBanner = ((((($GitHubModuleInfo -split "</a>Banner Current</h4>")[1]) -split "<pre><code>")[1]) -split "`n")[0]

            $OldBanner = ((((($GitHubModuleInfo -split "</a>Banner Old</h4>")[1]) -split "<pre><code>")[1]) -split "`n")[0]

            $LatestVersion = ((((($GitHubModuleInfo -split "</a>Latest Version</h4>")[1]) -split "<pre><code>")[1]) -split "`n")[0]
    
    
            $InstalledModuleVersion = Get-InstalledModule -Name Sandybox | Select-Object -ExpandProperty Version
    
            if ($InstalledModuleVersion -eq $LatestVersion)
            {
    
                Write-Host -BackgroundColor Green -ForegroundColor Black "$CurrentBanner Module version: $InstalledModuleVersion" 
                
            }
    
            elseif ($InstalledModuleVersion -ne $LatestVersion)
            {
    
                Write-Host "$OldBanner" 
                Write-Host -BackgroundColor Yellow -ForegroundColor Black  "Installed Version: $InstalledModuleVersion " -NoNewline
                Write-Host -BackgroundColor Green -ForegroundColor Black  " Latest Version: $LatestVersion "

                Write-Host  "`nWould you like to upgrade to version: $LatestVersion ?"
                
                $Accept = Read-Host  "`nEnter 'Y' if you wish to update to version $LatestVersion or 'N' to continue using version: $InstalledModuleVersion"


                if ($Accept -eq 'N')
                {

                    return #Exit the function
                }

                While ($Accept -notcontains 'Y')
                {

                    write-warning " Typo? $Accept != 'Y'"

                    $Accept = Read-Host "`nEnter 'Y' if you wish to update to the latest version or 'N' to continue using version: $InstalledModuleVersion `n"

                    if ($Accept -eq 'N')
                    {

                        return # Exist the function
                    }

                }


                if ($PSVersionTable.PSVersion.Major -eq '5')
                {

                    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
                    {

                        Write-Warning "You must have Administrative rights to update the module! To retry close this PowerShell session and open a new PowerShell session with Administrator permissions (Right click the PowerShell application and select 'Run as Administrator') and run the Connect-JCOnline command."
            
                        Return
            
                    }

                    Uninstall-Module -Name Sandybox -RequiredVersion $InstalledModuleVersion

                    Install-Module -Name Sandybox -Scope CurrentUser
                }

                elseif ($PSVersionTable.PSVersion.Major -ge 6)
                {

                    if ($PSVersionTable.Platform -eq 'Unix')
                    {

                        Uninstall-Module -Name Sandybox -RequiredVersion $InstalledModuleVersion

                        Install-Module -Name Sandybox -Scope CurrentUser
                                
                    }

                    elseif ($PSVersionTable.Platform -like "*Win*")
                    {

                        If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
                        {

                            Write-Warning "You must have Administrative rights to update the module! To retry close this PowerShell session and open a new PowerShell session with Administrator permissions (Right click the PowerShell application and select 'Run as Administrator') and run the Connect-JCOnline command."
                
                            Return
                
                        }

                        Uninstall-Module -Name Sandybox -RequiredVersion $InstalledModuleVersion

                        Install-Module -Name Sandybox -Scope CurrentUser
                                
                    }

                }

                    
                $UpdatedModuleVersion = Get-InstalledModule -Name Sandybox | Select-Object -ExpandProperty Version

                if ($UpdatedModuleVersion -eq $LatestVersion)
                {

                    Clear-Host
                
                    $ReleaseNotesRaw = Invoke-WebRequest -uri $ReleaseNotesURL -UseBasicParsing #for backwards compatibility

                    $ReleaseNotes = ((((($ReleaseNotesRaw.RawContent -split "</a>$LatestVersion</h2>")[1]) -split "<pre><code>")[1]) -split "</code>")[0]

                    Write-Host "Module updated to version: $LatestVersion`n"

                    Write-Host "Release Notes: `n"

                    Write-Host $ReleaseNotes

                    Write-Host "`nTo see the full release notes navigate to: `n" 
                    Write-Host "$ReleaseNotesURL`n"

                    Pause
    
                }
                
            }



        } #End if

        
    }#End endblock

}

function Get-Sandy
{
    [CmdletBinding()]
    param (
        
    )
    
    begin
    {

        Connect-SandyOnline
    }
    
    process
    {
    }
    
    end
    {
    }
}


# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*
