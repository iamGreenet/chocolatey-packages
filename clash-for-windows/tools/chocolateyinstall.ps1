
$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.6/Clash.for.Windows.Setup.0.8.6.exe'
$checksum = 'd709b564d6c497c2fafbaa3cc6c224f8c87b4bf5c00dd29f3689be8758df7663'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'Clash for Windows*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
