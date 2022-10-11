function Set-WindowsTerminalSettings {
    $settingsFile = "${env:LOCALAPPDATA}\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    Remove-Item $settingsFile -Force
    New-Item -ItemType SymbolicLink -Path $settingsFile -Target ".\windowsterminal\settings.json"
}

function Set-VSCodeSettings {
    $keybindingsFile = "${env:APPDATA}\Code\User\keybindings.json"
    Remove-Item $keybindingsFile -Force
    New-Item -ItemType SymbolicLink -Path $keybindingsFile -Target ".\vscode\keybindings.json"

    $settingsFile = "${env:APPDATA}\Code\User\settings.json"
    Remove-Item $settingsFile -Force
    New-Item -ItemType SymbolicLink -Path $settingsFile -Target ".\vscode\settings.json"
}

function Install-VsCodeExtensions {
    foreach ($line in Get-Content '.\vscode\extensions.txt') {
        code --install-extension $line
    }
}

function Set-PowerShellSettings {
    Remove-Item $profile
    New-Item -ItemType SymbolicLink -Path $profile -Target ".\powershell\Microsoft.PowerShell_profile.ps1"
}

Set-WindowsTerminalSettings
Set-VSCodeSettings
Install-VsCodeExtensions
Set-PowerShellSettings