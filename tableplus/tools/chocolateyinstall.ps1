$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$fileName = 'TablePlusSetup.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  file           = "$toolsPath\$fileName"
  fileType       = 'exe'
  softwareName   = 'TablePlus'
  validExitCodes = @(0, 3010, 1641)
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
