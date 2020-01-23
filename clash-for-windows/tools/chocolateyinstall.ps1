$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.10/Clash.for.Windows.Setup.0.8.10.exe'
$checksum = '79d31258c8a35d3327059272f5b9da5a88ccdd33d9b2264043e7b4adb985bcee'

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
