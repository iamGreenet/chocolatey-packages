$ErrorActionPreference = 'Stop';
$url        = 'https://github.com/mellow-io/mellow/releases/download/v0.1.10/Mellow.Setup.0.1.10.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'mellow*'

  checksum      = '41D2E9946F517893901E108B64ABC5D10968172DED8FEB897480C62A1378A8BE'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
