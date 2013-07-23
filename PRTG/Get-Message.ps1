function Get-Message {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false, Position=0)]
		[ValidateNotNull()]
		[Alias("Message","MessageName")]
		[string]$Name = "*",

		[Parameter(Mandatory = $false)]
		[ValidateNotNull()]
		[ThomyKay.Prtg.PrtgSession]$Session = (prtg\Get-Session -Current)
	)
begin {
}
process {
$result = ConvertFrom-Json ((Invoke-WebRequest "$($Session.Url)/api/table.json?content=messages&output=json&columns=objid,datetime,parent,type,name,status,message&username=$($Session.Credential.Username)&passhash=$($Session.Credential.Password)").Content)
#$result.groups | Where-Object {$_.name -like $Name}
}
end {
}
}
