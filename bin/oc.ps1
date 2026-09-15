#!/usr/bin/env pwsh
# oc — no-guardrails alias for opencode. Usage: oc run "do thing", oc --help, etc.
$basedir=Split-Path $MyInvocation.MyCommand.Definition -Parent
if (-not $env:OPENCODE_PERMISSION) { $env:OPENCODE_PERMISSION = '{"*":"allow"}' }
$exe=""
if ($PSVersionTable.PSVersion -lt "6.0" -or $IsWindows) { $exe=".exe" }
$target="$basedir/node_modules/opencode-ai/bin/opencode.exe"
if (-not (Test-Path $target)) {
  # fallback to opencode on PATH (scoop/choco/brew installs)
  if ($MyInvocation.ExpectingInput) { $input | & opencode $args }
  else { & opencode $args }
  exit $LASTEXITCODE
}
if ($MyInvocation.ExpectingInput) { $input | & $target $args }
else { & $target $args }
exit $LASTEXITCODE
