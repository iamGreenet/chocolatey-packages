$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/2020%2F3%2F5/Netch.Prx86.2020_3_5.7z'
$checksum = 'F5556395772AC6C1472ED9D84AE9018B668A5E1D42F4F6837B67F331257D4437'
$url64 = 'https://github.com/NetchX/Netch/releases/download/2020%2F3%2F5/Netch.Prx64.2020_3_5.7z'
$checksum64 = '371D7A54A226CE93B93F69D6654479662D99DEC4C884453FF1ABBF2F947763E6'
$title = $env:ChocolateyPackageTitle

$localAppData = $Env:LOCALAPPDATA
$shortcutsPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$localAppData\$title\"
  url            = $url
  url64          = $url64

  softwareName   = 'netch*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Netch.lnk') -Target (Join-Path -Path $localAppData -ChildPath "$title\Netch.exe")
