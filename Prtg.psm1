function Install-Prtg {
	Uninstall-Prtg
	cp '~\Documents\Visual Studio 2012\Projects\Prtg\Prtg' ~\Documents\WindowsPowerShell\Modules -Force -Recurse
}

function Uninstall-Prtg {
	rmdir ~\Documents\WindowsPowerShell\Modules\Prtg -ErrorAction Continue -Recurse
}