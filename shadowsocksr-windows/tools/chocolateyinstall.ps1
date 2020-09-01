$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$fileName64 = 'ShadowsocksR-netcore-5.1.10.7z'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData\$packageName"
  file64         = "$toolsPath\$fileName64"

  softwareName   = 'shadowsocksr-windows*'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'ShadowsocksR Windows.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\ShadowsocksR.exe")
