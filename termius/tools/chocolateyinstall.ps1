$ErrorActionPreference = 'Stop';
$url = 'https://autoupdate.termius.com/win/Termius.exe'
$checksum = 'fd0c20d539f6b14a6755249fc33ff4a79c64dd3a53603045a40cfc75ebefd2d4'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'termius*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
