$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/2522025040602403/MobaXterm_Installer_v25.2.zip'
$checkSum     = 'cdcf61ffede716ad566fefcbeebda7f02eb6a51d299b8eff5d87988c8e839c3b'
$checkSumType = 'SHA256'
$MsiInstaller = 'MobaXterm_installer_25.2.msi'
 
$packageArgsZip = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url
  url64bit       = $url
  checksum       = $checkSum
  checksumType   = $checkSumType
  checksum64     = $checkSum
  checksumType64 = $checkSumType
}
 
Install-ChocolateyZipPackage @packageArgsZip
 
$packageArgsMsi = @{
  packageName   = $packageName
  fileType      = 'MSI'
  file          = Join-Path $toolsDir $MsiInstaller 
  file64        = Join-Path $toolsDir $MsiInstaller
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyInstallPackage @packageArgsMsi
