$ErrorActionPreference = 'Stop';
$url = 'https://github.com/mellow-io/mellow/releases/download/v0.1.18/Mellow.Setup.0.1.18.exe'
$checksum = '5cff3936b9bfaf7e0847b4f151d9297b555617f5d134bbc028645217cf2a3753'

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
