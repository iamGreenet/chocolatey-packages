$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/YerongAI/Office-Tool/releases/download/7.6.0.1/Office-Tool-v7.6-without-component.zip'
$checksum = '6705235e9cc1e927cdbea745a164207e985925f8e5a5e4bdc08e41259e1db6db'

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
