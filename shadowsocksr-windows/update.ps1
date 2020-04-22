$releases = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases'

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = 'net48.+zip$'
    $url = -Join ('https://github.com', ($download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href))
	
    $url -match 'releases/download/([\d.]+)'
    $version = $Matches[1]
	
    return @{ Version = $version; URL32 = $url }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]fileName\s*=\s*)('.*')" = "`$1'$($Latest.FileName32)'"
        }

        "tools\verification.txt" = @{
            "(?i)(32-Bit.+)\<.*\>" = "`${1}<$($Latest.URL32)>"
            "(?i)(checksum32:\s+).*" = "`${1}$($Latest.Checksum32)"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { update -ChecksumFor none }