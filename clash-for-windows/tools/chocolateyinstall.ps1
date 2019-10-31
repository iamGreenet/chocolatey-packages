
$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.7.12/Clash.for.Windows.Setup.0.7.12.exe'
$checksum = 'd37272fbc077858d96b980ade35e0ae6c10feb7952211dd21cb987a787a8de6b'

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
