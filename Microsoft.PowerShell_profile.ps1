oh-my-posh init pwsh --config '~/.config/themes/gruvbox.omp.json' | Invoke-Expression

Set-Alias -Name c -Value clear
Set-Alias -Name xa -Value ls

function gs {git status $args}
function ga {git add $args}
function gaa {git add .}
function gap {git add -p .}
function gc {git commit $args}
function gcm {git commit -m $args}
function gb {git branch $args}
function .. {cd ..}
