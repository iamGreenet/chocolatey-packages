$ErrorActionPreference = 'Stop';
$url = 'https://github.com/mellow-io/mellow/releases/download/v0.1.19/Mellow.Setup.0.1.19.exe'
$checksum = 'bf8e7825f1f275b2f0b327035275808113515a1c3c49305471c9bd37ec2a286d'

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
