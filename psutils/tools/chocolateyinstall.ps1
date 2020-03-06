$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/lukesampson/psutils/archive/master.zip'
$checksum = 'B327C5A8363BFBF89AB0610D502CAEEA04E05C92B281843D1982999F3D25FEAD'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $url

  softwareName   = 'psutils*'

  checksum       = $checksum
  checksumType   = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Remove-Item -Recurse -ErrorAction SilentlyContinue -Exclude "*.ps1" "$toolsDir\psutils-master\*"
Install-ChocolateyPath "$toolsDir\psutils-master\"