$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/lukesampson/psutils/archive/master.zip'
$checksum = '4C8AD14D2C137FBEEDCEDC2D0DE4027DCAE2E39D0E80A0709EA9C09717BE093D'

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