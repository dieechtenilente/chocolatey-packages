$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/2612026022582601/MobaXterm_Installer_v26.2.zip'
$checkSum     = 'b6e7ffe7899118adde2d18e948a4a565280b6b321060f00e156be3fcbc6b1897'
$checkSumType = 'SHA256'
$MsiInstaller = 'MobaXterm_installer_26.2.msi'
 
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
