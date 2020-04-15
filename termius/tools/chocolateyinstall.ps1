$ErrorActionPreference = 'Stop';
$url = 'https://autoupdate.termius.com/win/Termius.exe'
$checksum = 'ae486938890e1c83bc5c29f0f5e8994fb38ffc255d253d863d28d0d2f9132a2a'

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
