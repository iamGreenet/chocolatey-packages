$releases = 'https://cn.bohe.com/config.json'

function global:au_GetLatest{
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $download_page -match 'BOHESetup.([\d.]+).exe'
    $version = $matches[1]
    
    $url = "https://hkupdate.bohe.com/soft/win/$version/BOHESetup.$version.exe"
	
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