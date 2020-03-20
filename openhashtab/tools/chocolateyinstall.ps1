$ErrorActionPreference = 'Stop';
$url        = 'https://github.com/namazso/OpenHashTab/releases/download/v2.2.0/OpenHashTab_setup.exe'
$checksum = 'ab2a232a3b2833ef92cae9053d39af90ced0ea19f653a9e09fe1389457adedee'

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
