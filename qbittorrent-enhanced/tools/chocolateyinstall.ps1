$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.3.10/qbittorrent_4.2.3.10_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.2.3.10/qbittorrent_4.2.3.10_x64_setup.exe'
$checksum = '5ad2140a2d84a3fa3b480f4cac562d02ceecb5fc52c322d4ad17fa4fdaf3df33'
$checksum64 = 'b78188726cc21d0a744d0e21d8a2ec6a9b33946c373b10283e132daff1fada60'

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
