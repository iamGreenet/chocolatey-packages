$ErrorActionPreference = 'Stop';
$url = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.8.6/ShadowsocksR-net48-5.1.8.6.zip'
$checksum = '1e0d144afc1357547154286ad0accf0db7f05dbee840e032f2e88332cc3930fe'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData\$packageName"
  url            = $url

  softwareName   = 'shadowsocksr-windows*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'ShadowsocksR Windows.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\ShadowsocksR.exe")
