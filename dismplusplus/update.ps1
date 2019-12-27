$releases = 'https://www.chuyu.me/zh-Hans/'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = ".zip$"
    $url = $download_page.links | Where-Object href -Match $regex | Select-Object -First 1 -expand href

    $url -match 'Dism\+\+([\d.]+)_'
    $version = $Matches[1]
    
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