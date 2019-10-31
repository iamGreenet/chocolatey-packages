$ErrorActionPreference = 'Stop';
$url = 'https://github.com/lltcggie/waifu2x-caffe/releases/download/1.2.0.2/waifu2x-caffe.zip'
$checksum = '73178769313623e6ff078e1c1a831f3fe1f4aedde3922660dae47c58aa04640f'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData"
  url            = $url
  url64          = $url64

  softwareName   = 'waifu2x-caffe*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'waifu2x-caffe.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\waifu2x-caffe.exe")
