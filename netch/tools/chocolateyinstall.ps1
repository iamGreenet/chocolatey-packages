$ErrorActionPreference = 'Stop';
#$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/NetchX/Netch/releases/download/v1.4.1-Beta3/Netch.x86-v1.4.1-Beta3.zip'
$checksum = '770A03AA6B5A500282BF684A67A2134E54C1F5BBD7D45A1E136AF06888066E31'
$url64 = 'https://github.com/NetchX/Netch/releases/download/v1.4.1-Beta3/Netch.x64-v1.4.1-Beta3.zip'
$checksum64 = 'E52A030C9EF6263E301F8DC7B279C453C69896C3E002ED3C6A5B6F603D21F775'
$title = $env:ChocolateyPackageTitle

$localAppData = $Env:LOCALAPPDATA
$shortcutsPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$localAppData\$title\"
  url            = $url
  url64          = $url64

  softwareName   = 'netch*'

  checksum       = $checksum
  checksumType   = 'sha256'
  checksum64     = $checksum64
  checksumType64 = 'sha256'

  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut -shortcutFilePath (Join-Path -Path $shortcutsPath -ChildPath 'Netch.lnk') -Target (Join-Path -Path $localAppData -ChildPath "$title\Netch.exe")
