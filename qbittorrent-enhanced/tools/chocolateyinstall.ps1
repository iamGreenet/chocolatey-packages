$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.2.10/qbittorrent_4.2.2.10_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.2.10/qbittorrent_4.2.2.10_x64_setup.exe'
$checksum = '39bc35112eaf64192f8060329c1ceeb83265880a7b942a47e0dabe990b363f13'
$checksum64 = '3ec37e793de366229ef730f3dc16b1530e59a8fc62e0562a11d05a99f4362860'

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
