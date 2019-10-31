$ErrorActionPreference = 'Stop';
$url = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.5/ShadowsocksR-netcore-win32.zip'
$url64 = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.5/ShadowsocksR-netcore-win64.zip'
$checksum = '06026f1c9e208dd363cd00f490446ec7937dc6a1e32cba9dd4f84b43613a9e11'
$checksum64 = '11fea6f9c1795e79de0f29a4d94a90d5e9d0a0836f70a4fe5b1b42eee4f5d518'

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
