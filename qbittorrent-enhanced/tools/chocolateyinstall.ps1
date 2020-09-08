$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.16/qbittorrent_4.2.5.16_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.16/qbittorrent_4.2.5.16_x64_setup.exe'
$checksum = '11902f421ed125398c8d93cb6c273f9e29d8837d889c6314dca530f09fdd9423'
$checksum64 = 'b5cf31402a6ea215b5334b082d9bfe0dfd0d105a5da8d3ccd2af0f8d99d3ff22'

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
