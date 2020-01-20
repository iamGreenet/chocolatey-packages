$ErrorActionPreference = 'Stop';
#$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'http://cdn.chuyu.me/Dism++10.1.1001.10_d4ba4eb035254b3326d6adc6638bc9c8daea7018.zip'
$checksum = '9149f635096571cd67a82a2efa113c819b8b9005e4f29d6f0d6eb26bb15ed41c'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$title = $env:ChocolateyPackageTitle
$architecture = (Get-WmiObject Win32_Processor).AddressWidth

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$Env:LOCALAPPDATA\$title\"
  url            = $url

  softwareName   = 'dismplusplus*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Dism++.lnk') -targetPath (Join-Path -Path $Env:LOCALAPPDATA -ChildPath "$title\dism++x$architecture.exe")
