
$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$url = 'https://raw.githubusercontent.com/danielng01/product-builds/master/Iris/Windows/Iris-1.2.0.exe'
$checksum = '35b07c2528d9d2a2a1fba51f28e34b87c2d82809316a0a86b41c9e132537c3a3'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'Iris*'

  checksum       = $checksum
  checksumType   = 'sha256'

  silentArgs     = "/S"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
