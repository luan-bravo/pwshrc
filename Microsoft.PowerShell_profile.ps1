#############
## ALIASES ##
#############
Set-Alias -Name c -Value clear
Set-Alias -Name q -Value exit

Set-Alias -Name v -Value nvim
Set-Alias -Name vi -Value nvim

Set-Alias -Name py -Value python3
Set-Alias -Name python -Value python3
Set-Alias -Name ino -Value arduino-cli
Set-Alias -Name espt -Value "python -m esptool"

function x {eza -l -h -n -s='type' --icons $args}
function ll {eza -l -h -n -s='type' --icons $args}
function xa {eza -l -h -n -s='type' --icons -a $args}
function l {eza -l -h -n -s='type' --icons -a $args}
function xt {eza -l -h -n -s='type' --icons -T $args}
function xta {eza -l -h -n -s='type' --icons -a -T $args}

Remove-Item -Path Alias:g* -Force # Remove default aliases to allow overwriting
function gs {git status $args}

function gd {git diff $args}
function gds {git diff --staged $args}

function ga {git add $args}
function gaa {git add -A $args}
function gap {git add -p $args}

function gc {git commit $args}
function gcv {git commit -v $args}
function gcm {git commit -m $args}
function gcam {git commit -am $args}
function gcma {git commit -am $args}

function grs {git restore $args}
function grst {git restore --staged $args}

function gp {git push $args}

function gf {git fetch $args}
function gfo {git fetch origin $args}

function gl {git pull $args}
function glr {git pull --rebase $args}
function glra {git pull --rebase $args}

function gb {git branch $args}

function glog {git log --oneline --all --graph $args}
function gloga {git log --oneline --all --graph $args}

function gsw {git switch $args}
function gswc {git switch -c $args}

function .. {cd ..}
function ~ {cd ~}

###############
## FUNCTIONS ##
###############
function which {param($Exe) (Get-Command $Exe).path}

function addtopath {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Path
    )

    try {
        # Check if the input is a valid directory path
        if (-not (Test-Path -Path $Path -PathType Container)) {
            throw "Error: '$Path' is not a valid directory or does not exist."
        }

        # Get the current user PATH
        $currentPath = [System.Environment]::GetEnvironmentVariable("Path", "User")

        # Normalize the input path for comparison (resolve to absolute path)
        $resolvedPath = (Resolve-Path -Path $Path).Path

        # Check if the resolved path is in the current PATH
        if ($currentPath -like "*$resolvedPath*") {
            Write-Output "Directory already in `$Env:Path"
        } else {
            # Add the directory to the user PATH
            [System.Environment]::SetEnvironmentVariable("Path", "$currentPath;$resolvedPath", "User")
            Write-Output "Directory '$resolvedPath' added to `$Env:Path"
        }
    }
    catch {
        Write-Error $_.Exception.Message
    }
}

##############
## SOURCING ##
##############
oh-my-posh init pwsh --config "~/Documents/PowerShell/gruvbox.omp.json" | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })
