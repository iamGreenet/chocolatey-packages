$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.3.0-beta.2/PicGo-Setup-2.3.0-beta.2.exe'
$checksum = '3aa8e5725e22a4dc295c9170590594080b0ff7d16caba5dd9b59e81717a4e2ae'

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
