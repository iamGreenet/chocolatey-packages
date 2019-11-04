$ErrorActionPreference = 'Stop';
$url = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.6.2/ShadowsocksR-netcore-win32-5.1.6.2.zip'
$url64 = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.6.2/ShadowsocksR-netcore-win64-5.1.6.2.zip'
$checksum = 'ef485a52b816d34b6763acc6d6431d402de6f63ef99baac11d7c9bf2f39509f7'
$checksum64 = '009d804aa76851791540cc158657edc9a77c7c1ebfe07c4f2b7002ab4a7c388f'

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
