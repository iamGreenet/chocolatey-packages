$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.11/qbittorrent_4.2.5.11_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.11/qbittorrent_4.2.5.11_x64_setup.exe'
$checksum = '4e708fef593e327622827a868927dd70443ac1cd2a921878cc1c16486d4e79df'
$checksum64 = 'a6be9a4f109ba9239cc7efc644eaea0abf676125fbfa0b504d578e7156e15362'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  url64bit       = $url64

  softwareName   = 'qbittorrent*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
