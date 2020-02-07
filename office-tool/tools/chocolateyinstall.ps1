$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/YerongAI/Office-Tool/releases/download/7.4.3.0/Office.Tool.v7.4.zip'
$checksum = '812de1244f7d72b8efc04a3dd5abc777b435a6292aed5ec0a13c12bbae565572'

$shortcutsPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$Env:LOCALAPPDATA"
  url            = $url

  softwareName   = 'otp*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Office Tool Plus.lnk') -targetPath (Join-Path -Path $Env:LOCALAPPDATA -ChildPath "Office Tool\Office Tool Plus.exe")
