#!/usr/bin/env python3
import sys
import os
from pathlib import Path

# Anchor to repo root: script lives 4 levels deep under repo root
script_dir = Path(__file__).resolve().parent
repo_root = script_dir.parents[3]
os.chdir(repo_root)

cwd = Path(sys.argv[1]) if len(sys.argv) > 1 else repo_root
plan = cwd / "task_plan.md"
progress = cwd / "progress.md"

if not plan.exists():
    sys.exit(0)

lines = plan.read_text(encoding="utf-8").splitlines()
goal = next(
    (l.replace("**Goal:**", "").strip() for l in lines if "**Goal:**" in l),
    "unknown"
)
active = next((l.strip() for l in lines if "in_progress" in l), None)

print(f"\n[planning-with-files] CATCHUP: goal={goal}")
if active:
    print(f"[planning-with-files] ACTIVE PHASE: {active}")
else:
    print("[planning-with-files] All phases complete or no active phase.")

if progress.exists():
    tail = progress.read_text(encoding="utf-8").splitlines()[-5:]
    print("[planning-with-files] LAST PROGRESS:")
    for line in tail:
        print(f"  {line}")
print()
