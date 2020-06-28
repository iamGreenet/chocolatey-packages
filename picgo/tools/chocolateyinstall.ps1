$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.3.0-beta.1/PicGo-Setup-2.3.0-beta.1.exe'
$checksum = '9dd16104ff95043e181ab3ab0dc14a931f8c5d1ca288366a7430ac62a2b52779'

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
