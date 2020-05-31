$releases = 'https://github.com/ventoy/Ventoy/releases'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex = '-windows.zip$'
    $url = -Join ('https://github.com', ($download_page.links | ? href -match $regex | select -First 1 -expand href))

    $url -match '/download/v?([\w-.]+)/'
    $version = $matches[1] -replace 'beta','-beta'
	
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

if ($MyInvocation.InvocationName -ne '.') { update }