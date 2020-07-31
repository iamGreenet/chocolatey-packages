$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.13/qbittorrent_4.2.5.13_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.13/qbittorrent_4.2.5.13_x64_setup.exe'
$checksum = 'ce1b946edb72f2d85a0adc298ebea7a853b8c2061a73347f4c36f17930d64e26'
$checksum64 = '5bf8fec59564f59f0ad989e53be76f23f7417ebd4b592ebb4cdfe3044647a5d1'

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
