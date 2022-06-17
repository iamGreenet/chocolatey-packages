# Office Tool
# └── Office Tool Plus.exe

$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName32 = 'Office_Tool_v9.0.1.6.zip'
$shortcutPath = [Environment]::GetFolderPath("Programs") + '\Office Tool Plus.lnk'
$packageName = $env:ChocolateyPackageName
$unzipLocation = "$Env:LOCALAPPDATA\$packageName"

$packageArgs = @{
  packageName    = $packageName
  file           = "$toolsDir\$fileName32"
  unzipLocation  = "$unzipLocation"
  validExitCodes = @(0, 3010, 1641)
}

Remove-Item -Path "$unzipLocation\*" -Force -Recurse -ErrorAction SilentlyContinue
Install-ChocolateyZipPackage @packageArgs
Remove-Item -Path $packageArgs.file -Force -ErrorAction SilentlyContinue

$exePath = (Get-Childitem -Path $unzipLocation -Filter "Office Tool Plus.exe" -Recurse).FullName
Install-ChocolateyShortcut -shortcutFilePath "$shortcutPath" -targetPath "$exePath"
