$releases = 'https://github.com/danielng01/product-builds/tree/master/Iris/Windows'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1
	
    $regex = ".exe$"
    $url = $download_page.links | Where-Object href -Match $regex | Select-Object -Last 1 -expand href
    $url = -Join ('https://github.com', $url) -replace 'blob', 'raw'

    $url -match 'Iris-([\d.]+)\.exe'
    $version = $Matches[1]
    
    return @{ Version = $version; URL = $url }
}

function global:au_SearchReplace {
    # @{
    #     "tools\chocolateyInstall.ps1" = @{
    #         "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
    #         "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    #     }
    # }
}

update