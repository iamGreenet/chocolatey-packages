$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/YerongAI/Office-Tool/releases/download/7.2.0.0/Office.Tool.v7.2.zip'
$checksum = '3d5c02069f7736aadc6cdd9bd3e6715f2ec1fd7cd360e4ae1c2f83fb91e62d4d'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$title = $env:ChocolateyPackageTitle

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$Env:LOCALAPPDATA\$title"
  url            = $url

  softwareName   = 'otp*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Office Tool Plus.lnk') -targetPath (Join-Path -Path $Env:LOCALAPPDATA -ChildPath "$title\Office Tool Plus.exe")
