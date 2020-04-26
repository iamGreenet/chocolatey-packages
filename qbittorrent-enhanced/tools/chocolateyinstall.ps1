$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.10/qbittorrent_4.2.5.10_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.10/qbittorrent_4.2.5.10_x64_setup.exe'
$checksum = '9b4dcebddaf0c60eaa243d3de668f57e200647ddf278f5ee5ecbd294213eeb00'
$checksum64 = 'c8a32b597e5ecd6dc0bac8d5f21da9e85c8c0a020c9f028a9123906bebfea7eb'

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
