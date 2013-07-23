function Get-Session
{
	[CmdletBinding()]
	param(
		[Parameter(Mandatory = $false)]
		[switch]$Current
	)
	
	if ($Current)
		{
			$PrtgSessionManager.CurrentSession
		}
		else
		{
			$PrtgSessionManager.Sessions
		}
}