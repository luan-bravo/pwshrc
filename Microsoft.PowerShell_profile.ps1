oh-my-posh init pwsh --config "~/Documents/PowerShell/gruvbox.omp.json" | Invoke-Expression

Set-Alias -Name c -Value clear
Set-Alias -Name xa -Value ls
Set-Alias -Name py -Value python3
Set-Alias -Name python -Value python3

function gs {git status $args}
function ga {git add $args}
function gaa {git add .}
function gap {git add -p .}
function gc {git commit $args}
function gcm {git commit -m $args}
function gb {git branch $args}
function .. {cd ..}
