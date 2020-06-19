$releases = 'https://tableplus.com/blog/2018/09/changelogs-windows.html'

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest{
	$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	
    $regex = 'TablePlusSetup.exe$'
    $url = $download_page.links | ? href -match $regex | select -First 1 -expand href

	$download_page -match 'TablePlus ([\d.]+)'
    $version = $matches[1]
	
    return @{ Version = $version; URL32 = $url }
}

function global:au_SearchReplace {
    @{
        "tools\verification.txt" = @{
            "(?i)(checksum32:\s+).*" = "`${1}$($Latest.Checksum32)"
        }
    }
}


if ($MyInvocation.InvocationName -ne '.') { update -ChecksumFor none }
