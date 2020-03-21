$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.78/TrafficMonitor_V1.78_x86.7z'
$url64 = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.78/TrafficMonitor_V1.78_x64.7z'
$checksum = 'd5c5bbf7d9b8c0a7a6052f0c0622664e1bf832d6b685a22e1caef70b56acbca6'
$checksum64 = 'ce16a79ca8b8bed2b50c2e33a3415e58ef50481677dca1024305d4214f864610'
$packageName = $env:ChocolateyPackageName

$shortcutsPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$Env:LOCALAPPDATA\"
  url            = $url
  url64bit       = $url64

  softwareName   = 'traffic-monitor*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Traffic Monitor.lnk') -targetPath (Join-Path -Path "$Env:LOCALAPPDATA" -ChildPath 'TrafficMonitor\TrafficMonitor.exe')
