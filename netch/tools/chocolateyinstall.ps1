$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = $env:ChocolateyPackageName
$localAppData = $Env:LOCALAPPDATA
$shortcutsPath = [Environment]::GetFolderPath("Programs")
$fileName32 = 'Netch.x86-1.4.2.zip'
$fileName64 = 'Netch.x64-1.4.2.zip'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$localAppData\$packageName\"
  file           = "$toolsDir\$fileName32"
  file64         = "$toolsDir\$fileName64"

  softwareName   = 'netch*'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Netch.lnk') -Target (Join-Path -Path $localAppData -ChildPath "$packageName\Netch.exe")
