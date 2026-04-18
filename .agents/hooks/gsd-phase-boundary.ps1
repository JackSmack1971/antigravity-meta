# gsd-hook-version: 1.32.0
$ErrorActionPreference = "SilentlyContinue"

if ($Host.UI.RawUI.KeyAvailable -eq $false -and $myInvocation.ExpectingInput) {
    $inputData = $input -join ""
} else {
    exit 0
}

if ([string]::IsNullOrWhiteSpace($inputData)) { exit 0 }

try {
    $parsed = $inputData | ConvertFrom-Json
} catch {
    exit 0
}

$file_path = $parsed.tool_input.file_path
if ([string]::IsNullOrWhiteSpace($file_path)) {
    $file_path = $parsed.tool_input.path
}
$cwd = $parsed.cwd
if ([string]::IsNullOrWhiteSpace($cwd)) {
    $cwd = $env:CLAUDE_PROJECT_DIR
    if ([string]::IsNullOrWhiteSpace($cwd)) { $cwd = (Get-Location).Path }
}

if ([string]::IsNullOrWhiteSpace($file_path)) { exit 0 }

$base = Split-Path $file_path -Leaf
if ($base -notin @("SPEC.md", "PLAN.md", "VERIFY.md", "SUMMARY.md", "STATE.md", "task_plan.md")) {
    exit 0
}

$log_dir = Join-Path $cwd ".planning"
if (-not (Test-Path $log_dir -PathType Container)) { exit 0 }

$ts = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
"$ts  phase-boundary  file=$base" | Out-File -FilePath "$log_dir\session.log" -Append -Encoding UTF8
exit 0
