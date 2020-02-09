$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/1.3.8/Netch.1.3.8.x86.7z'
$checksum = '36f7b1eb65af3baeab46ba0ada739888df8f8c32076420cbbc10df06069798c7'
$url64 = 'https://github.com/NetchX/Netch/releases/download/1.3.8/Netch.1.3.8.x64.7z'
$checksum64 = '04276cbd7766efa690fc91424bd4b7e9f94791940133a181e476a0e6587b75cb'
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
