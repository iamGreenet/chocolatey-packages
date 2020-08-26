$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.14/qbittorrent_4.2.5.14_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.5.14/qbittorrent_4.2.5.14_x64_setup.exe'
$checksum = '853525f011c95a7b0416fa9e59e7a3d6de638929ff218d2e74bfaa1ad0c19261'
$checksum64 = 'e4f6fe6caa39d189d4bab32f9438640cf631d7c6a2b1a78286da85920506b3af'

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
