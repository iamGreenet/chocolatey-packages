$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName64 = 'Clash.for.Windows.Setup.0.9.11.exe'

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileType     = 'exe'
  file         = "$toolsDir\$fileName64"
  softwareName = 'Clash for Windows*'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
Remove-Item $packageArgs.file
