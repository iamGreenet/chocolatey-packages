$releases = 'https://github.com/agalwood/Motrix/releases'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = 'ia32-win.zip$'
    $url = -Join ('https://github.com', ($download_page.links | ? href -match $regex | select -First 1 -expand href))
    $url64 = $url -replace 'ia32-',''

    $url -match 'Motrix-([\d.]+)-ia32-win.zip'
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