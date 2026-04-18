# gsd-session-state
$cwd = $env:CLAUDE_PROJECT_DIR
if ([string]::IsNullOrWhiteSpace($cwd)) { $cwd = (Get-Location).Path }

$planning_dir = Join-Path $cwd ".planning"
$state_md = Join-Path $cwd "state.md"
$session_log = Join-Path $planning_dir "session.log"

if ((Test-Path "$planning_dir/STATE.md") -or (Test-Path $state_md)) {
    if (-not (Test-Path $planning_dir -PathType Container)) {
        New-Item -ItemType Directory -Path $planning_dir -Force | Out-Null
    }
}

$stage = "unknown"
if (Test-Path $state_md) {
    $match = ((Get-Content $state_md) -match '^\*\*Current Stage:\s*([A-Z_][A-Z0-9_]*)')
    if ($match) {
        $stageMatch = [regex]::Match($match[0], '^\*\*Current Stage:\s*([A-Z_][A-Z0-9_]*)')
        if ($stageMatch.Success) {
            $stage = $stageMatch.Groups[1].Value.Substring(0, [math]::Min(64, $stageMatch.Groups[1].Value.Length))
        }
    }
}

$ts = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
if (Test-Path $planning_dir -PathType Container) {
    "$ts  session-start  stage=$stage" | Out-File -FilePath $session_log -Append -Encoding UTF8 -ErrorAction SilentlyContinue
}

[Console]::Error.WriteLine("GSD session ready. Stage=$stage")
exit 0
