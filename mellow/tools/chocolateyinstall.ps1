$ErrorActionPreference = 'Stop';
$url = 'https://github.com/mellow-io/mellow/releases/download/v0.1.11/Mellow.Setup.0.1.11.exe'
$checksum = '842fd716f7cf252a9d86f381bf8f27de19f7f1739fd2d583c17eb709d323f546'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'mellow*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
