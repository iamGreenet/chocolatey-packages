$ErrorActionPreference = 'Stop';
$url = 'https://github.com/lltcggie/waifu2x-caffe/releases/download/1.2.0.4/waifu2x-caffe.zip'
$checksum = '6d3ead88280fb43226b856b9b33b79696b5da4f9baf42591f0a9abc58c2a488c'

$shortcutsPath = [Environment]::GetFolderPath("Programs")
$localAppData = $Env:LOCALAPPDATA
$packageName = $env:ChocolateyPackageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = "$localAppData"
  url            = $url

  softwareName   = 'waifu2x-caffe*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'waifu2x-caffe.lnk') -targetPath (Join-Path -Path "$localAppData" -ChildPath "$packageName\waifu2x-caffe.exe")
