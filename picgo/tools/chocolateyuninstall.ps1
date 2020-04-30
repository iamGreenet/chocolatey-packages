$ErrorActionPreference = 'Stop';
$packageName = $env:ChocolateyPackageName
$softwareName = 'PicGo*'
$fileType = 'exe'
$uninstallArgs = '/currentuser /S'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $file = $key[0].QuietUninstallString.Split('/')[0]
  Uninstall-ChocolateyPackage $packageName $fileType $uninstallArgs $file
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $($_.DisplayName)"}
}