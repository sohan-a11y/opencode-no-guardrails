#!/usr/bin/env bash
# Removes runtime guardrails from an opencode checkout.
# Usage: ./disable-guardrails.sh /path/to/opencode
set -euo pipefail
ROOT="${1:-.}"
echo "Patching $ROOT ..."

# 1. permission evaluate() default ask -> allow
# File: packages/opencode/src/permission/index.ts:28-38
# File: packages/core/src/permission.ts:76-86
perl -0pi -e 's/action:\s*"ask",\s*\n\s*permission,/action: "allow",\n      permission,/g' "$ROOT/packages/opencode/src/permission/index.ts" || true
perl -0pi -e 's/effect:\s*"ask"/effect: "allow"/g' "$ROOT/packages/core/src/permission.ts" || true

# 2. agent defaults allow-all (packages/opencode/src/agent/agent.ts:119-136)
# doom_loop, external_directory, *.env ask -> allow, plan/explore deny -> allow
perl -pi -e 's/"ask"/"allow"/g; s/"deny"/"allow"/g' "$ROOT/packages/opencode/src/agent/agent.ts" || true

echo "Done. Verify with: git -C $ROOT diff --stat"
echo "WARNING: no sandbox, no prompts. Use Docker/VM only."
