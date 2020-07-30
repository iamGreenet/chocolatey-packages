$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.79/TrafficMonitor_V1.79_x86.7z'
$url64 = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.79/TrafficMonitor_V1.79_x64.7z'
$checksum = 'cbb09e38b65e874edaa64ac183283e297ea66fbe428b0190db9b1b399b67b05a'
$checksum64 = 'd489dfd6f0231cc317ab66fe26095cf5b9a8e9a88584d3d75d0815dcdf0394a4'
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
