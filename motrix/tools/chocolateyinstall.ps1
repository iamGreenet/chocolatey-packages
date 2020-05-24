$ErrorActionPreference = 'Stop';
$url = 'https://github.com/agalwood/Motrix/releases/download/v1.5.12/Motrix-Setup-1.5.12.exe'
$checksum = '31fa9c6a05c8584a23fc2d63a92e4e021fa2af6e9148dd0067fdcf66018ff094'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'motrix*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
