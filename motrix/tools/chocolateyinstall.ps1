$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.5.10/Motrix-Setup-1.5.10.exe'
$checksum = '11d8984dc17a8c4e424daa69e84bba397b033eb5267c3dc728ce49da447e2336'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'motrix*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
