function Get-Device {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position=0)]
		[ValidateNotNull()]
		[Alias("Device","DeviceName")]
		[string]$Name = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Prtg.PrtgSession]$Session = (prtg\Get-Session -Current)
	)
begin {
}
process {
$result = ConvertFrom-Json ((Invoke-WebRequest "$($Session.Url)/api/table.json?content=devices&output=json&columns=objid,probe,group,device,host,downsens,partialdownsens,downacksens,upsens,warnsens,pausedsens,unusualsens,undefinedsens&username=$($Session.Credential.Username)&passhash=$($Session.Credential.Password)").Content)
#$result.groups | Where-Object {$_.name -like $Name}
}
end {
}
}
