function Connect-MXOnline (){

    [CmdletBinding()]
  
     param
      (
          [Parameter(Mandatory=$True,HelpMessage="Please enter your MXToolBox API key. This key can be found by navigating to 'https://mxtoolbox.com/restapi.aspx' in a web browser") ]
          [ValidateScript({
              If (($_).Length -ne 36){
                  Throw "Please enter your MXToolBox API key. This key can be found by navigating to 'https://mxtoolbox.com/restapi.aspx' in a web browser"
              }
              Else {$true}
          })]
          [string]$MXAPI_key
      )
  
       begin
          {
              $hdrs = @{
                'Authorization' = $MXAPI_key
              }
  
              $URL = "https://api.mxtoolbox.com/api/v1/usage/"
              
              Write-Verbose $URL
          }
  
      process
          {
  
                  try {
                      $results = Invoke-RestMethod -Method GET -Uri $URL -Header $hdrs
                      }
                  catch {
                      Write-Host "Incorrect API key OR no network connectivity. To locate your navigating to 'https://mxtoolbox.com/restapi.aspx' in a web browser"
                      $MXAPI_key = $null
                      break}
          }
  
          end {
              $global:MXAPIKey = $MXAPI_key
              Write-Host -BackgroundColor Green -ForegroundColor Black "Successfully connected to MxToolBox"
              Write-Host -BackgroundColor Green -ForegroundColor Black "Stats: DnsRequests = $($results.DnsRequests); DnsMax = $($results.DnsMax)"

          }
  
  }