$releases = 'https://termius.com/windows'

function global:au_GetLatest{
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = 'Version ([\d.]+) - Released.*</'
    $download_page -match $regex
    $version = $matches[1]
	
	$url = "https://autoupdate.termius.com/win/Termius.exe"
	
    return @{ Version = $version; URL = $url }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { update }