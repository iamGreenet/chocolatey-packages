$releases = 'https://bitbucket.org/liule/snipaste/downloads/'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = 'x86.zip$'
    $regex64 = 'x64.zip$'
    $url = -Join ('https://bitbucket.org', ($download_page.links | ? href -match $regex | select -First 1 -expand href))
    $url64 = -Join ('https://bitbucket.org', ($download_page.links | ? href -match $regex64 | select -First 1 -expand href))

    $url -match 'Snipaste-(.+)-x86.zip'
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