$ErrorActionPreference = 'Stop';
$url = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.8.3/ShadowsocksR-net48-5.1.8.3.zip'
$checksum = 'b51bc0ddad85bc6b3745d30daa0a54f9dbdf345d266a2f28cddcc7c5dfa3a72b'

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
