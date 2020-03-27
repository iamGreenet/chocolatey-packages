$ErrorActionPreference = 'Stop';
$url = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.1.9.16/qbittorrent_4.1.9.16_setup.exe'
$url64 = 'https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-4.1.9.16/qbittorrent_4.1.9.16_x64_setup.exe'
$checksum = '055F194C15BE2C9C46513EE0E31476A0A4665F07A80BCB6D31F4DC677F0EC80E'
$checksum64 = '16B7F64FFF78887375D42909E8ECF9FDAEEB6E3A7AF11D8686BF14DEA48D9E53'

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
