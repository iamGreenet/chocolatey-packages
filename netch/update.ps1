$releases = 'https://github.com/NetchX/Netch/releases'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = 'x86.(zip|7z)$'
    $regex64 = 'x64.(zip|7z)$'
    $url = -Join ('https://github.com', ($download_page.links | ? href -match $regex | select -First 1 -expand href))
    $url64 = -Join ('https://github.com', ($download_page.links | ? href -match $regex64 | select -First 1 -expand href))
    
    $url64 -match 'Netch.([.\w]+).x64.(zip|7z)$'
    $version = $matches[1]

    if ($version -match 'Pr$') {
        $version = $version -replace 'Pr','-pre'
    }
	
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