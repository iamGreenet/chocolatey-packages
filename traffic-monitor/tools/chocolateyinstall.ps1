$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.77/TrafficMonitor_V1.77_x86.7z'
$url64 = 'https://github.com/zhongyang219/TrafficMonitor/releases/download/V1.77/TrafficMonitor_V1.77_x64.7z'
$checksum = '3973D2DB7B9869ECBE40A0C6B12FBAD3155F40A14DBF11DBB4AAC975B3831487'
$checksum64 = '3ECBB52A939301544B293A05BDD39F76C3329604221F6660824F8150D0BE493A'
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
