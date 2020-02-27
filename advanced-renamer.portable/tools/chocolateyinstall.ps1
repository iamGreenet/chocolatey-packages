$ErrorActionPreference = 'Stop';

$url = 'https://www.advancedrenamer.com/down/advanced_renamer_portable.zip'
$checksum = 'A3BFDFB14DA2CB1A4C041A1E66C8B09E125E65372C5A10385A4B95F59233E8A1'
$shortcutsPath = [Environment]::GetFolderPath("Programs")
$packageName = $env:ChocolateyPackageName
$unzipLocation = "$Env:LOCALAPPDATA\$packageName"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $unzipLocation
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Advanced Renamer.lnk') -targetPath (Join-Path -Path $unzipLocation -ChildPath 'ARen.exe')
