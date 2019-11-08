$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$softwareName = 'Mailspring*'
$fileType = 'exe'
$uninstallArgs = '--uninstall -s'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $file = $key[0].UninstallString.split(' ')[0]
  Uninstall-ChocolateyPackage $packageName $fileType $uninstallArgs $file
}