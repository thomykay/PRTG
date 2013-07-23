#
# Script.ps1
#
function Enter-Session {
param (
	[Parameter(Mandatory=$true, Position=0)]
	[string]$Url,
	
	[Parameter(Mandatory=$true, Position=1)]
	[Management.Automation.PSCredential]$Credential
)
$Url = $Url.TrimEnd("/")
$nwc = $Credential.GetNetworkCredential()
$nwc.Password = (Invoke-WebRequest "$Url/api/getpasshash.htm?username=$($nwc.Username)&password=$($nwc.Password)").Content
$session = New-Object ThomyKay.Prtg.PrtgSession -Property @{
		Url = $Url;
		Credential = $nwc
	}
	
$PrtgSessionManager.Enter($session)
}
