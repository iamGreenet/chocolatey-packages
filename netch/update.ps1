$releases = 'https://github.com/NetchX/Netch/releases'

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    $regex64 = 'Netch.*.(zip|7z)$'
    $url64 = 'https://github.com' + ($download_page.links | Where-Object href -match $regex64 | Select-Object -First 1 -expand href)
    
    $url64 -match '/download/v?([\w-.]+)/'
    $version = $matches[1]
	
    return @{ Version = $version; URL64 = $url64 }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]fileName64\s*=\s*)('.*')" = "`$1'$($Latest.FileName64)'"
        }

        "tools\verification.txt"      = @{
            "(?i)(64-Bit.+)\<.*\>"   = "`${1}<$($Latest.URL64)>"
            "(?i)(checksum64:\s+).*" = "`${1}$($Latest.Checksum64)"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { update -ChecksumFor none }