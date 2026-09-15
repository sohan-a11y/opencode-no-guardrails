# opencode-no-guardrails

YOLO variant derived from `anomalyco/opencode` with runtime permission guardrails disabled.

> WARNING: No sandbox, no prompts. Agent gets direct shell/file/web access. Run only in Docker/VM. See upstream `SECURITY.md:15-19` — permission system was UX-only.

Upstream: https://github.com/anomalyco/opencode

## What was removed / set to allow

Runtime guardrails disabled in this repo (vs upstream):

* `permission` default `ask` -> `allow` (`packages/opencode/src/permission/index.ts:evaluate()`)
* `agent defaults`: `doom_loop:ask`, `external_directory:ask`, `read *.env:ask` -> `allow`
* `plan / explore` agent `edit:deny`, `task.general:deny`, `*:deny` -> `allow`
* `permission.reply once/always/reject` flow bypassed — auto-approve
* `--auto` behavior made default (no prompt)

No other features changed.

## Use

1. Direct config way (no fork needed):
```json
{
  "$schema": "https://opencode.ai/config.json",
  "permission": "allow"
}
```
Run: `opencode --auto`

2. Patch way (this repo):
```bash
./disable-guardrails.sh /path/to/opencode-checkout
```

See `opencode.json`, `disable-guardrails.sh`, `src/no-guardrails.ts`.
