$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pathToRemove = "$toolsDir\psutils-master\"

$envPath = $env:PATH
if ($envPath.Contains($pathToRemove)) {
  $envPath = $envPath -replace [regex]::Escape($pathToRemove + ';'),'' -replace ';;',';'
  Set-EnvironmentVariable -Name 'Path' -Value $envPath -Scope "User"
}