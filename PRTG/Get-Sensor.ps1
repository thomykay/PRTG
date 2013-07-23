function Get-Sensor {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position=0)]
		[ValidateNotNull()]
		[Alias("Sensor","SensorName")]
		[string]$Name = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Prtg.PrtgSession]$Session = (prtg\Get-Session -Current)
	)
begin {
}
process {
[xml]$result = ((Invoke-WebRequest "$($Session.Url)/api/table.xml?content=sensors&columns=objid,group,device,sensor,status,message,lastvalue,priority,favorite&username=$($Session.Credential.Username)&passhash=$($Session.Credential.Password)").Content)
$result.sensors.item | Where-Object {$_.sensor -like $Name}
}
end {
}
}