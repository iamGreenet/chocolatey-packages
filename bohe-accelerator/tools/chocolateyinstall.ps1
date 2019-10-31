
$ErrorActionPreference = 'Stop';
$url        = 'https://hkupdate.bohe.com/soft/win/1.0.3.4/BOHESetup.1.0.3.4.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url

  softwareName  = '薄荷加速器'

  checksum      = '8b1f650ba8075d88c1de5770eb8a6a85b0073f3584893cd79b74f325579d9908'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
