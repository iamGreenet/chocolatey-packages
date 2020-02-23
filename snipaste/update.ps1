$releases = 'https://www.snipaste.com'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = "win-x86-beta"
    $regex64 = "win-x64-beta"
    $url = $download_page.links | Where-Object href -Match $regex | Select-Object -First 1 -expand href
    $url64 = $download_page.links | Where-Object href -Match $regex64 | Select-Object -First 1 -expand href

    $download_page -match 'v([\d.]+) Beta'
    $version = $Matches[1] + '-Beta'
    
    return @{ Version = $version; URL = $url; URL64 = $url64 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]url64\s*=\s*)('.*')"    = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update