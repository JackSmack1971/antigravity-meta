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

$tool_name = $parsed.tool_name
if ($tool_name -ne "Bash" -and $tool_name -ne "PowerShell" -and $tool_name -ne "run_command" -and $tool_name -ne "run_terminal_command") {
    exit 0
}

$command_str = $parsed.tool_input.command
if ([string]::IsNullOrWhiteSpace($command_str)) {
    $command_str = $parsed.tool_input.CommandLine
}
if ([string]::IsNullOrWhiteSpace($command_str)) {
    $command_str = $parsed.command
}
if ([string]::IsNullOrWhiteSpace($command_str)) { exit 0 }

if ($command_str -notmatch '(^|[^a-zA-Z0-9_-])git\s+commit(\s|$)') { exit 0 }

$msgMatch = [regex]::Match($command_str, '-m\s+"([^"]*)"')
if (-not $msgMatch.Success) { exit 0 }
$msg = $msgMatch.Groups[1].Value

if ([string]::IsNullOrWhiteSpace($msg)) { exit 0 }

function Warn($message) {
    [Console]::Error.WriteLine("GSD commit advisory: $message")
}

if ($msg.Length -lt 10) {
    Warn "commit message is very short ($($msg.Length) chars): `"$msg`""
}

if ($msg -notmatch '^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([^)]+\))?!?:\s+') {
    Warn 'commit message is missing Conventional Commit prefix (e.g. "feat:", "fix(scope):").'
}
exit 0
