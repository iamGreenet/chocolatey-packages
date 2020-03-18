$ErrorActionPreference = 'Stop';
$url        = 'https://github.com/namazso/OpenHashTab/releases/download/v2.1.0/OpenHashTab_setup.exe'
$checksum = '5A126C2DF806F6EF3AE14E65B18B081C55044CF60D255D7DBBDEDE1A371AE0C9'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'openhashtab*'

  checksum      = $checksum
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
