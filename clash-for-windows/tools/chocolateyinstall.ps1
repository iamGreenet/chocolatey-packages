$ErrorActionPreference = 'Stop';
$url = 'https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.9.3/Clash.for.Windows.Setup.0.9.3.exe'
$checksum = '2706d67ad0753185efc1dfb46dcdce847629c4b955a9bc19874a5a56b3780afc'

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
