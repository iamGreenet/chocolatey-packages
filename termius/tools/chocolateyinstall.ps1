$ErrorActionPreference = 'Stop';
$url = 'https://autoupdate.termius.com/win/Termius.exe'
$checksum = '8564d681670430ed779f1d1e5529cc27a63b516d9b5f20c29c137a2a50ea7964'

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
