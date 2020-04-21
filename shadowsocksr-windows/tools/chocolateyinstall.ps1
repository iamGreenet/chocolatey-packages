$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$fileName = 'ShadowsocksR-net48-5.1.9_x32.zip'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData\$packageName"
  file           = Get-Item $toolsPath\$fileName

  softwareName   = 'shadowsocksr-windows*'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'ShadowsocksR Windows.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\ShadowsocksR.exe")
