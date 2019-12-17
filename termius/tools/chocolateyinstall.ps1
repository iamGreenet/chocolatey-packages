$ErrorActionPreference = 'Stop';
$url = 'https://autoupdate.termius.com/win/Termius.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'termius*'

  checksum       = '8EB7AD02E5528E6167AB7F4987BCF2D5116D65C2A77A8D1212B7DC634619597A'
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
