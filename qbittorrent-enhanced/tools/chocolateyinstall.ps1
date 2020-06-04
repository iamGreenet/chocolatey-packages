$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.12/qbittorrent_4.2.5.12_x64_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.12/qbittorrent_4.2.5.12_x64_setup.exe'
$checksum = '8fbbdb650c425932c242a1716eeb155443eb2a73ad1b2532bbca324a5c000fc8'
$checksum64 = '8fbbdb650c425932c242a1716eeb155443eb2a73ad1b2532bbca324a5c000fc8'

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
