$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/2020%2F2%2F18/Netch.1.3.9Pr.x86.zip'
$checksum = '85f006047c5cdc1afc74b6130f0de6488db6f4fefa1f5feaa26ab86edc1745a2'
$url64 = 'https://github.com/NetchX/Netch/releases/download/2020%2F2%2F18/Netch.1.3.9Pr.x64.zip'
$checksum64 = '8ad3e27289d1f97227348c411ad6bf330a2ad80cc73b1ae4bf5906e883304909'
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
