$releases = 'https://github.com/YerongAI/Office-Tool/releases'

function global:au_GetLatest{
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = '.zip$'
    $url = $download_page.links | ? href -match $regex | select -First 1 -expand href
    $url = -Join('https://github.com', $url)

	$url -match 'releases/download/([\d.]+)/'
    $version = $matches[1]
	
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