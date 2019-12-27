$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.7/Clash.for.Windows.Setup.0.8.7.exe'
$checksum = ''

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = $url

  softwareName   = 'Clash for Windows*'

  checksum       = $checksum
  checksumType   = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
