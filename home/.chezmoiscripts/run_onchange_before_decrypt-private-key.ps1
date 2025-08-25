$CzConfigPath = "$HOME/.config/chezmoi"

if (-not (Test-Path -Path "$CzConfigPath/key.txt")) {
  New-Item -Path $CzConfigPath -ItemType Directory -ErrorAction SilentlyContinue
  chezmoi age decrypt -p -o "$CzConfigPath/key.txt" "$Env:CHEZMOI_SOURCE_DIR/key.txt.age"
  exit $LastExitCode
}
