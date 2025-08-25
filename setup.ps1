# disable msstore source for winget
winget source remove msstore

# install chezmoi, apps required by chezmoi, and all apps managed by this repo
winget install -e --no-upgrade --id=Microsoft.PowerShell
winget install -e --no-upgrade --id=Microsoft.WindowsTerminal
winget install -e --no-upgrade --id=DEVCOM.JetBrainsMonoNerdFont
winget install -e --no-upgrade --id=Starship.Starship
winget install -e --no-upgrade --id=Microsoft.Git --custom '/components="gitlfs,assoc,windowsterminal" /o:SSHOption=ExternalOpenSSH /o:CURLOption=WinSSL /o:UseCredentialManager=Disabled'
winget install -e --no-upgrade --id=Microsoft.VisualStudioCode

winget install -e --no-upgrade --id=str4d.rage
winget install -e --no-upgrade --id=twpayne.chezmoi

winget install -e --no-upgrade --id=Rclone.Rclone
winget install -e --no-upgrade --id=restic.restic
winget install -e --no-upgrade --id=KeePassXCTeam.KeePassXC

winget install -e --no-upgrade --id=SagerNet.sing-box
winget install -e --no-upgrade --id=mtkennerly.shawl

winget install -e --no-upgrade --id=Schniz.fnm

winget install -e --no-upgrade --id=Mozilla.Firefox
winget install -e --no-upgrade --id=Valve.Steam
winget install -e --no-upgrade --id=Discord.Discord

# enable sudo
sudo config --enable normal

# enable ssh agent
Set-Service -Name ssh-agent -StartupType Automatic
Start-Service ssh-agent

# without XBox Game Bar, "ms-gamingoverlay" related errors will pop up left and right when launching games
# disable app capture to prevent this
$Params = @{
  Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR"
  Name = "AppCaptureEnabled"
  Type = "DWORD"
  Value = 0
  Force = $True
}
New-ItemProperty @Params | Out-Null

# disable Windows Defender
$Params = @{
  Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"
  Name = "DisableAntiSpyware"
  Type = "DWORD"
  Value = 1
  Force = $True
}
New-ItemProperty @Params | Out-Null

$RTProtectionPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"
New-Item -Path $RTProtectionPath -Force | Out-Null

$Params = @{
  Path = $RTProtectionPath
  Type = "DWORD"
  Value = 1
  Force = $True
}
New-ItemProperty @Params -Name "DisableBehaviorMonitoring" | Out-Null
New-ItemProperty @Params -Name "DisableOnAccessProtection" | Out-Null
New-ItemProperty @Params -Name "DisableScanOnRealtimeEnable" | Out-Null
New-ItemProperty @Params -Name "DisableIOAVProtection" | Out-Null
