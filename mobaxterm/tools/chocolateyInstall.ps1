$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/2322023060714555/MobaXterm_Installer_v23.2.zip'
$checkSum     = '69994d0fcc11ff65890c0a39d3c3912f0d5c8c7b51778620f4d5fda9f96f9a15'
$checkSumType = 'SHA256'
$MsiInstaller = 'MobaXterm_installer_23.2.msi'
 
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
