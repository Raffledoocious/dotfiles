Import-Module posh-git
[System.Environment]::SetEnvironmentVariable("SSH_AUTH_SOCK", $null)
[System.Environment]::SetEnvironmentVariable("SSH_AGENT_PID", $null)

cd C:\Source