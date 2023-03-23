function Set-WindowsTerminalSettings($path) {
    $settingsFile = "${env:LOCALAPPDATA}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    Remove-Item $settingsFile -Force
    New-Item -ItemType SymbolicLink -Path $settingsFile -Target "$path\windowsterminal\settings.json"
}

function Set-VSCodeSettings($path) {
    $keybindingsFile = "${env:APPDATA}\Code\User\keybindings.json"
    Remove-Item $keybindingsFile -Force
    New-Item -ItemType SymbolicLink -Path $keybindingsFile -Target "$path\vscode\keybindings.json"

    $settingsFile = "${env:APPDATA}\Code\User\settings.json"
    Remove-Item $settingsFile -Force
    New-Item -ItemType SymbolicLink -Path $settingsFile -Target "$path\vscode\settings.json"
}

function Install-VsCodeExtensions($path) {
    foreach ($line in Get-Content "$path\vscode\extensions.txt") {
        code --install-extension $line
    }
}

function Set-PowerShellSettings($path) {
    $powerShellProfilePath = "C:\Users\Jared\Documents\PowerShell"
    Remove-Item -Recurse -Force $powerShellProfilePath
    New-Item -ItemType Directory $powerShellProfilePath
    New-Item -ItemType SymbolicLink -Path "$powerShellProfilePath\profile.ps1" -Target "$path\powershell\profile.ps1"
}

$path = (Get-Location).Path
Set-WindowsTerminalSettings $path 
Set-VSCodeSettings $path
Install-VsCodeExtensions $path
Set-PowerShellSettings $path