$ErrorActionPreference = 'Stop';
$url = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.6.2/ShadowsocksR-net48-5.1.6.2.zip'
$checksum = '2adb061249601ee308e9543a82ca0529d181f65d270ba0dd7b4f69f8531a4a92'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData\$packageName"
  url            = $url
  url64          = $url64

  softwareName   = 'shadowsocksr-windows*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'ShadowsocksR Windows.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\ShadowsocksR.exe")
