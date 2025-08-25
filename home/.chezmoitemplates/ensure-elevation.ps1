function Test-IsElevated {
  $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
  $principal = [Security.Principal.WindowsPrincipal]::New($identity)
  return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-IsElevated)) {
  Write-Warning "This script requires local admin privileges. Elevating..."

  $PSPath = (Get-Process -Id $PID).Path

  # using sudo for self-elevation instead of classic Start-Proccess to keep IO in same window
  sudo @($PSPath, $MyInvocation.MyCommand.Source, $MyInvocation.UnboundArguments)

  return
}
