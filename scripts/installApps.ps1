# Install apps
# Apps that auto-update themselves use `choco install`, otherwise
# use `cup` to allow running this script to update your programs.

Write-Output "Installing apps..."

# Download & install Chocolatey
if (-Not (Get-Command choco.exe -ErrorAction SilentlyContinue)) {
  iex ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1"))
}

# Fonts
choco upgrade -y firacode

choco install -y firefox
choco install -y office365proplus
choco upgrade -y authy-desktop
choco install -y sharex
choco install -y f.lux
choco install -y discord

# Tools
#choco upgrade -y git -params '"/GitAndUnixToolsOnPath /WindowsTerminal /NoShellIntegration"'
#choco upgrade -y git-lfs
choco upgrade -y winrar
choco install -y robo3t

# SSH
choco upgrade -y putty
choco install -y winscp

# Language libraries
# VS Code fully supports using WSL, but Jetbrains products still rely on a local JDK install
choco upgrade -y openjdk11 # LTS
choco upgrade -y maven
choco upgrade -y gradle

# File editors
choco install -y vscode
choco install -y jetbrainstoolbox

Write-Output "Applications successfully installed."