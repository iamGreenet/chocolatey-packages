$ErrorActionPreference = 'Stop';
$url = 'https://github.com/HMBSbige/ShadowsocksR-Windows/releases/download/5.1.8.5/ShadowsocksR-net48-5.1.8.5.zip'
$checksum = '7899de848ae53996573f0a5b8df149890af9d345588d706651386908369169ee'

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
