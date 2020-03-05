$releases = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = '_setup.exe$'
    $regex64 = '_x64_setup.exe$'
    $url = -Join ('https://github.com', ($download_page.links | ? href -match $regex | select -First 1 -expand href))
    $url64 = -Join ('https://github.com', ($download_page.links | ? href -match $regex64 | select -First 1 -expand href))
    
    $url64 -match 'qbittorrent_([\d.]+)_x64_setup.exe$'
    $version = $matches[1]
	
    return @{ Version = $version; URL = $url; URL64 = $url64 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

update