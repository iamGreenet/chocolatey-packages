$releases = 'https://github.com/lltcggie/waifu2x-caffe/releases'

function global:au_GetLatest{
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = 'caffe.zip$'
    $url = -Join('https://github.com', ($download_page.links | ? href -match $regex | select -First 1 -expand href))

    $url -match 'releases/download/([\d.]+)/'
    $version = $matches[1]
    Write-Host $version
	
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

update