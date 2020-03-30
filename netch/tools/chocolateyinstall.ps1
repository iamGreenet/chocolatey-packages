$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/v1.4.1/Netch.x86-v1.4.1.zip'
$checksum = '4faa31059ec8752f357697e584a21271c5bc1ad5ac9a34db9e68e4d456164c34'
$url64 = 'https://github.com/NetchX/Netch/releases/download/v1.4.1/Netch.x64-v1.4.1.zip'
$checksum64 = '7170ed0ade0b261c2cbab4861116f3cb1fef93d18c5268ebde59facf15656012'
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
