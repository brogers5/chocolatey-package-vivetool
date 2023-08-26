$ErrorActionPreference = 'Stop'

$softwareName = 'ViVeTool'
$process = Get-Process -Name $softwareName -ErrorAction SilentlyContinue
if ($process) {
    Write-Warning "$softwareName is currently running, stopping it to prevent upgrade/uninstall from failing..."
    Stop-Process -InputObject $process -ErrorAction SilentlyContinue

    Start-Sleep -Seconds 3

    $process = Get-Process -Name $softwareName -ErrorAction SilentlyContinue
    if ($process) {
        Write-Warning "$softwareName is still running despite stop request, force stopping it..."
        Stop-Process -InputObject $process -Force -ErrorAction SilentlyContinue
    }

    Write-Warning "If upgrading, $softwareName may need to be manually restarted upon completion"
}
else {
    Write-Debug "No running $softwareName process instances were found"
}
