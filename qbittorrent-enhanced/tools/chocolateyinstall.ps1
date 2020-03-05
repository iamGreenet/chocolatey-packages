$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.1.10/qbittorrent_4.2.1.10_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.1.10/qbittorrent_4.2.1.10_x64_setup.exe'
$checksum = 'DF7F8F26B284B0719C570B3976F37CBE02BCB5330D6E64F146D9EBCB9B093F0E'
$checksum64 = 'C8967317520DAF96DDD248774799C8540F4776119645638B31967E8FD7071870'

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
