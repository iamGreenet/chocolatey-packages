$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName64 = 'Clash.for.Windows.Setup.0.11.3.exe'

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'exe'
  file         = "$toolsDir\$fileName64"
  softwareName = 'Clash for Windows*'
  silentArgs   = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
Remove-Item $packageArgs.file
