$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.79.1/TrafficMonitor_V1.79.1_x86.7z'
$url64 = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.79.1/TrafficMonitor_V1.79.1_x64.7z'
$checksum = '7a203c2ccc7425de26d19fc12f5dc95b725e8f48954ba62c7fe5e8836dbf3d86'
$checksum64 = 'b23c94c8c4c3e9baf6e7da52c91b91523f23cbbb4605c9900df3553b2d91d294'
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
