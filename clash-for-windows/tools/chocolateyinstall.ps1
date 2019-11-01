
$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.0/Clash.for.Windows.Setup.0.8.0.exe'
$checksum = '01dfc9cb8e23bc90e0453c70651b91b2cb8c15611ccf4bdc5dae07255c8235b0'

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
