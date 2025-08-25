# About
This is repo for my personal settings of various Windows apps and Windows itself. Powered by [chezmoi](https://github.com/twpayne/chezmoi/).

# Managed Apps
- Firefox
- Starship
- PowerShell
- Windows Terminal
- Git
- SSH
- Sing-box
- Rclone
- Resticprofile

# Quick start
This guide assumes that you have `winget` installed.

1. Run setup script **as admin**
> irm https://raw.githubusercontent.com/zumm/dotfiles/refs/heads/main/setup.ps1 | iex

It will install chezmoi, apps required by chezmoi, and all apps managed by this repo. Also it will configure Windows as follows:
- Enable `sudo`
- Enable `ssh-agent`
- Disable app capture feature
- **Disable Windows Defender**

2. Apply settings
> chezmoi init --apply git@github.com:zumm/dotfiles.git

# Secret Managment
Ideally secrets should be managed by KeePassXC. But at this moment `keepassxc-cli` lacks [kee feature](https://github.com/keepassxreboot/keepassxc/issues/12282) to make it possible in sane way. When this feature is released i plan to switch to KeePassXC managment.

Until then all secrets are stored in age encrypted files in repo.

# Cavets
## Firefox
Apply config *before* you launch the browser for the first time. Otherwise you will need to delete auto-generated profiles manually.

Useful links:
- https://github.com/twpayne/chezmoi/issues/3702
