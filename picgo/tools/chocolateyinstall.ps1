$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.3.0-beta.3/PicGo-Setup-2.3.0-beta.3.exe'
$checksum = 'e459ece4ee6d9c9692c2685842df54da4cf045010817c1a0cc651aecb72f73b2'

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
