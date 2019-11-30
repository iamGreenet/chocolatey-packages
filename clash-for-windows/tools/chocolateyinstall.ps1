
$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.5/Clash.for.Windows.Setup.0.8.5.exe'
$checksum = '2b51a2294a2b48d96f0b8d61dd0ba90e91f9a6ee6b3c3caaf49f0ebbe3dabe5c'

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
