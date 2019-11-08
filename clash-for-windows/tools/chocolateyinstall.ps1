
$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.1/Clash.for.Windows.Setup.0.8.1.exe'
$checksum = '51bbcdcf386c5861f461dae00c71e7d076a817f4d4a520781a644218ace83ae5'

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
