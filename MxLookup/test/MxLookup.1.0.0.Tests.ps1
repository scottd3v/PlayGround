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
    
    It 'Gets the MX record for JumpCloud' {

        $MX = Get-MxLookup -Command mx -Domain JumpCloud.com
        $MX.Command | Should -Be "mx"
         
    }

    It 'Gets the A record for JumpCloud' {

        $A = Get-MxLookup -Command A -Domain JumpCloud.com
        $A.Command | Should -Be "A"
         
    }

    It 'Gets the dns record for JumpCloud' {

        $DNS = Get-MxLookup -Command dns -Domain JumpCloud.com
        $DNS.Command | Should -Be "dns"
         
    }

    It 'Gets the SPF record for JumpCloud' {

        $SPF = Get-MxLookup -Command SPF -Domain JumpCloud.com
        $SPF.Command | Should -Be "spf"
         
    }

    It 'Gets the TXT record for JumpCloud' {

        $TXT = Get-MxLookup -Command TXT -Domain JumpCloud.com
        $TXT.Command | Should -Be "TXT"
         
    }

    It 'Gets the SOA record for JumpCloud' {

        $SOA = Get-MxLookup -Command SOA -Domain JumpCloud.com
        $SOA.Command | Should -Be "SOA"
      
    }

    It 'Gets the PTR record for JumpCloud' {

        $PTR = Get-MxLookup -Command PTR -Domain JumpCloud.com
        $PTR.Command | Should -Be "PTR"
         
    }

    It 'Gets the BLACKLIST record for JumpCloud' {

        $BLACKLIST = Get-MxLookup -Command BLACKLIST -Domain JumpCloud.com
        $BLACKLIST.Command | Should -Be "BLACKLIST"
         
    }

    It 'Gets the SMTP record for JumpCloud' {

        $SMTP = Get-MxLookup -Command SMTP -Domain JumpCloud.com
        $SMTP.Command | Should -Be "SMTP"
         
    }

    It 'Gets the TCP record for JumpCloud' {

        $TCP = Get-MxLookup -Command TCP -Domain JumpCloud.com
        $TCP.Command | Should -Be "TCP"
         
    }

    It 'Gets the HTTP record for JumpCloud' {

        $HTTP = Get-MxLookup -Command HTTP -Domain JumpCloud.com
        $HTTP.Command | Should -Be "HTTP"
         
    }

    It 'Gets the HTTP record for JumpCloud' {

        $HTTP = Get-MxLookup -Command HTTP -Domain JumpCloud.com
        $HTTP.Command | Should -Be "HTTP"
         
    }

    It 'Gets the HTTPS record for JumpCloud' {

        $HTTPS = Get-MxLookup -Command HTTPS -Domain JumpCloud.com
        $HTTPS.Command | Should -Be "HTTPS"
         
    }

    It 'Gets the PING record for JumpCloud' {

        $PING = Get-MxLookup -Command PING -Domain JumpCloud.com
        $PING.Command | Should -Be "PING"
         
    }

    It 'Gets the TRACE record for JumpCloud' {

        $TRACE = Get-MxLookup -Command TRACE -Domain JumpCloud.com
        $TRACE.Command | Should -Be "TRACE"
         
    }
}

