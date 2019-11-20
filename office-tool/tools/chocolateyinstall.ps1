$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/YerongAI/Office-Tool/releases/download/7.2.2.8/Office.Tool.v7.2.2.8.zip'
$checksum = '4552bb1c4d80595098a3bf405871b9bc14031b7633c7bf22280bc77107b5fa32'

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

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Office Tool Plus.lnk') -targetPath (Join-Path -Path $Env:LOCALAPPDATA -ChildPath "Office Tool Plus.exe")
