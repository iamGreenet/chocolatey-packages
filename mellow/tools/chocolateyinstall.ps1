$ErrorActionPreference = 'Stop';
$url = 'https://github.com/mellow-io/mellow/releases/download/v0.1.12/Mellow.Setup.0.1.12.exe'
$checksum = '58f20447ad628c39891e5557029f58a997caff657e0624f42bd631a6d1146ece'

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
