$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.8.7/Clash.for.Windows.Setup.0.8.7.exe'
$checksum = '5710a91d75d6d93ab2c512069d0988ace63c947cb159f5f0d19e8d5bab984a9e'

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
