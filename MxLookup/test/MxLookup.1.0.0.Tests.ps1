$MxAPI_Key = '' #Enter your MxToolBox API key to run the tests 

$ModuleManifestName = 'MxLookup.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}
Describe 'Connect-MXOnline' {
    
    It 'Connects to MX Online' {
            try {
                Connect-MXOnline -MXAPI_key $MxAPI_Key 
                $Success = '1'
            }

            catch {
                $Success = '0'
            }

            $Success | Should Be '1'
         
    }
}


Describe 'Get-MxLookUp' {
    
    It 'Gets the MX record for example.com' {

        $MX = Get-MxLookup -Command mx -Domain example.com
        $MX.Command | Should -Be "mx"
         
    }

    It 'Gets the A record for example.com' {

        $A = Get-MxLookup -Command a -Domain example.com
        $A.Command | Should -Be "a"
         
    }

    It 'Gets the dns record for example.com' {

        $DNS = Get-MxLookup -Command dns -Domain example.com
        $DNS.Command | Should -Be "dns"
         
    }

    It 'Gets the SPF record for example.com' {

        $SPF = Get-MxLookup -Command spf -Domain example.com
        $SPF.Command | Should -Be "spf"
         
    }

    It 'Gets the TXT record for example.com' {

        $TXT = Get-MxLookup -Command txt -Domain example.com
        $TXT.Command | Should -Be "txt"
         
    }

    It 'Gets the SOA record for example.com' {

        $SOA = Get-MxLookup -Command soa -Domain example.com
        $SOA.Command | Should -Be "soa"
      
    }

    It 'Gets the PTR record for example.com' {

        $PTR = Get-MxLookup -Command ptr -IPAddress 199.181.132.250
        $PTR.Command | Should -Be "PTR"
         
    }

    It 'Gets the BLACKLIST record for example.com' {

        $BLACKLIST = Get-MxLookup -Command blacklist -Domain example.com
        $BLACKLIST.Command | Should -Be "blacklist"
         
    }

    It 'Gets the SMTP record for example.com' {

        $SMTP = Get-MxLookup -Command Smtp -Domain example.com
        $SMTP.Command | Should -Be "Smtp"
         
    }

    It 'Gets the HTTP record for example.com' {

        $HTTP = Get-MxLookup -Command Http -Domain example.com
        $HTTP.Command | Should -Be "Http"
         
    }

    It 'Gets the HTTP record for example.com' {

        $HTTP = Get-MxLookup -Command Http -Domain example.com
        $HTTP.Command | Should -Be "Http"
         
    }

    It 'Gets the HTTPS record for example.com' {

        $HTTPS = Get-MxLookup -Command Https -Domain example.com
        $HTTPS.Command | Should -Be "Https"
         
    }

    It 'Gets the PING record for example.com' {

        $PING = Get-MxLookup -Command ping -Domain example.com
        $PING.Command | Should -Be "ping"
         
    }

    It 'Gets the TRACE record for example.com' {

        $TRACE = Get-MxLookup -Command trace -Domain example.com
        $TRACE.Command | Should -Be "trace"
         
    }
}

