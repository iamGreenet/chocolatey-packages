$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.9/Clash.for.Windows.Setup.0.8.9.exe'
$checksum = 'b53400d3aa0ca49efdea87b95b9cafa91ec23008efbd882d03770cdaecb6ae91'

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
