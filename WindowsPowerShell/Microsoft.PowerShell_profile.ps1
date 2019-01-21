# My Profile

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Modules -----------------------------------------------------------
Import-Module posh-git
Import-Module Get-ChildItemColor

# Cosmetics ------------------------------------------------------
$host.ui.RawUI.WindowTitle = "notBader" # Change title

# Aliases ---------------------------------------------------------
$SCRIPTPATH = "C:\Users\bdrja\WindowsPowerShell\Scripts" # Script path
$VIMPATH    = "C:\users\bdrja\vim\vim81\vim.exe" # Vim path
Set-Alias vi   $VIMPATH
Set-Alias vim  $VIMPATH
Set-Alias l Get-ChildItemColor -Option AllScope # Vertical list
Set-Alias ls Get-ChildItemColorFormatWide -Option AllScope # Horizental list
New-Alias -name g -value gVim # Open gVim
New-Alias ipconfig -value ip # IP
New-Alias -name ipa -value ipconfig_all_function
New-Alias -name x -value exit_function
New-Alias -name home -value go_home
New-Alias -name vp -value edit_profile

# Functions ----------------------------------------------------------
# ipconfig /all
function ipconfig_all_function() {   
    ipconfig /all
}

# Leave PowerShell
function exit_function() {
    exit
}

# Go home
function go_home() {
    cd $HOME
} 

# Easily edit $PROFILE
function edit_profile() {
   vim $PROFILE
}
function prompt {

    # Your non-prompt logic here
    $prompt = write-prompt '[' -NoNewline
    $prompt = Write-Prompt (Get-Date -UFormat '%T') -ForegroundColor ([ConsoleColor]::Blue) -NoNewline
    $prompt += write-prompt ']: ' -NoNewline
    $prompt = write-prompt (Split-Path (Get-Location) -Leaf) -ForegroundColor ([ConsoleColor]::Red) -NoNewline
   # $prompt = write-prompt ' > ' -ForegroundColor ([ConsoleColor]::yellow) -NoNewline
    $prompt += & $GitPromptScriptBlock 
    if ($prompt) { "$prompt " } else { " " }
}

# function prompt {
# Write-Host '[' -NoNewline
# Write-Host (Get-Date -UFormat '%T') -ForegroundColor Blue -NoNewline
# Write-Host ']: ' -NoNewline
# Write-Host (Split-Path (Get-Location) -Leaf) -ForegroundColor Red -NoNewline # your current directory (only name of directory)
# Write-host ' >' -Foregroundcolor yello -NoNewline

 
# &$GitPromptScriptBlock
# return " " 

# }
