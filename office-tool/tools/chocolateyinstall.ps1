$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/YerongAI/Office-Tool/releases/download/7.4.2.8/Office.Tool.v7.4.zip'
$checksum = 'be7542b9d4c2fcc4f59133d1983e1f93b489ba4e79fe6ffa2069808b50808f2c'

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
