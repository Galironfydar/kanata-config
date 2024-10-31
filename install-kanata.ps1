# Check if running as administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "This script requires administrator privileges."
    # Relaunch as administrator
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Install NSSM using Chocolatey
Write-Host "Installing NSSM using Chocolatey..."
choco install nssm -y

# Define paths
$nssmPath = "C:\ProgramData\chocolatey\bin\nssm.exe"
$kanataExe = "C:\Users\$env:USERNAME\.cargo\bin\kanata.exe"
$configPath = "C:\Users\$env:USERNAME\AppData\Roaming\kanata\kanata.kbd"

# Stop Kanata service if it exists
if (Get-Service "KanataService" -ErrorAction SilentlyContinue) {
    Write-Host "Stopping Kanata service..."
    Stop-Service -Name "KanataService" -Force
    Start-Sleep -Seconds 2  # Give it time to fully stop
}

# Install or upgrade Kanata using Cargo
Write-Host "Installing/Upgrading Kanata using Cargo..."
if (Test-Path $kanataExe) {
    cargo install kanata
} else {
    cargo install kanata
}

# Create config directory if it doesn't exist
$configDir = Split-Path $configPath -Parent
if (-not (Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir -Force
}

# Install Kanata service
& $nssmPath install KanataService $kanataExe "--config $configPath"

# Set the service to start automatically
& $nssmPath set KanataService Start SERVICE_AUTO_START

# Start the Kanata service
Start-Service -Name "KanataService"