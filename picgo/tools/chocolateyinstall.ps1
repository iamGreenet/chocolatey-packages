
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.2.0/PicGo-Setup-2.2.0.exe'
$checksum = '44847a99206b3009ca357817b04c0005947c941b029dd4963e189d5623109f2d'

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
