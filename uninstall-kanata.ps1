# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script requires administrator privileges."
    # Relaunch as administrator
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Define NSSM path
$nssmPath = "C:\ProgramData\chocolatey\bin\nssm.exe"

# Stop the service first
Write-Host "Stopping Kanata service..."
Stop-Service -Name "KanataService" -ErrorAction SilentlyContinue

# Remove the service
Write-Host "Removing Kanata service..."
& $nssmPath remove KanataService confirm
