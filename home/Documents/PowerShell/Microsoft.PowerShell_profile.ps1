$Env:EDITOR = "code --wait"

$Env:STARSHIP_CONFIG = "$Env:APPDATA\starship\starship.toml"
$Env:STARSHIP_CACHE = "$Env:TEMP\starship"
starship init powershell | Invoke-Expression

$Env:FNM_DIR = "$Env:LOCALAPPDATA\fnm"
$Env:FNM_COREPACK_ENABLED = "true"
$Env:FNM_VERSION_FILE_STRATEGY = "recursive"
fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue
If (-not $?) {
  Install-Module Terminal-Icons -Repository PSGallery -Confirm:$False -Force
  Import-Module -Name Terminal-Icons
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
