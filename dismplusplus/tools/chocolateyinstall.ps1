$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://cdn.chuyu.me/Dism++10.1.1000.100_2d2bf466baca088c4b35248f5a7316f4e00cac0b.zip'
$checksum = '3C5887911ABB2A3C47AC7F2D8B9E375583D1742BEAC57EBC3C64E6315218B6A5'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$title = $env:ChocolateyPackageTitle
$architecture = (Get-WmiObject Win32_Processor).AddressWidth

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$Env:LOCALAPPDATA\$title\"
  url            = $url

  softwareName   = 'dismplusplus*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Dism++.lnk') -targetPath (Join-Path -Path $Env:LOCALAPPDATA -ChildPath "$title\dism++x$architecture.exe")
