$ErrorActionPreference = 'Stop';
$url = 'https://autoupdate.termius.com/win/Termius.exe'
$checksum = '0c32ae433b194050333a030ab68ae39ce132641414cc6c415171571bfd98692b'

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
