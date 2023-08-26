$ErrorActionPreference = 'Stop'

Confirm-Win10 -ReqBuild 18963

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$archiveFileName = 'ViVeTool-v0.3.3.zip'
$archiveFilePath = Join-Path -Path $toolsDir -ChildPath $archiveFileName

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileFullPath  = $archiveFilePath
}
Get-ChocolateyUnzip @packageArgs

#Clean up 7z archive post-install to prevent unnecessary disk bloat
Remove-Item -Path $archiveFilePath -Force -ErrorAction SilentlyContinue
