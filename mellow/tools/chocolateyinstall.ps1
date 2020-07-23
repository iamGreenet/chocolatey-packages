$ErrorActionPreference = 'Stop';
$url = 'https://github.com/mellow-io/mellow/releases/download/v0.1.21/Mellow.Setup.0.1.21.exe'
$checksum = 'f9d36e53fcdd8053e06fbe5cd9cd76df56c95b1c05bcfa7c8f084fffd2e85c78'

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
