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

# Secret Managment
Ideally secrets should be managed by KeePassXC. But at this moment `keepassxc-cli` lacks [kee feature](https://github.com/keepassxreboot/keepassxc/issues/12282) to make it possible in sane way. When this feature is released i plan to switch to KeePassXC managment.

Until then all secrets are stored in age enrypted files in repo.

# Cavets
## Firefox
Apply config *before* you launch the browser for the first time. Otherwise you will need to delete auto-generated profiles manually.

Useful links:
- https://github.com/twpayne/chezmoi/issues/3702
