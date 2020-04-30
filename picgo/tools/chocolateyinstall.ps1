$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.3.0-beta.0/PicGo-Setup-2.3.0-beta.0.exe'
$checksum = '0a2a55c4309c9e61e43ec7acc307f43880297d59ed48c9ee4304efce7e2158b6'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url
  softwareName   = 'PicGo*'
  checksum       = $checksum
  checksumType   = 'sha256'
  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
