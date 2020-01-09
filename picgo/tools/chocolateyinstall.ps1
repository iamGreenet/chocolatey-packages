
$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.2.1/PicGo-Setup-2.2.1.exe'
$checksum = '794e737a30409e8c80deabd64de179e8dd402b287789fa9e65aaa3b02c726a8c'

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
