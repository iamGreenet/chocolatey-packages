$releases = 'https://www.advancedrenamer.com/versionlog'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $download_page -match 'Advanced Renamer ([\d.]+)'
    $version = $matches[1]
    
    $url = 'https://www.advancedrenamer.com/down/advanced_renamer_portable.zip'

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