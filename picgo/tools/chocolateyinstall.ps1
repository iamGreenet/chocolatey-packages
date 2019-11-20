
$ErrorActionPreference = 'Stop';
$url        = 'https://github.com/Molunerfinn/PicGo/releases/download/v2.1.2/picgo-setup-2.1.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url

  softwareName  = 'PicGo*'

  checksum      = '6650B71FBB75D2D8A60950548D332D52E680F66E4920DB26194F4AAC3DE719E9'
  checksumType  = 'sha256'

  validExitCodes= @(0, 3010, 1641)
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
