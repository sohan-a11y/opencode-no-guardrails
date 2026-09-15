// Minimal no-guardrails permission shim.
// Replaces evaluate() last-match-wins + default ask with always-allow.
// Upstream: packages/opencode/src/permission/index.ts:28-38
//           packages/core/src/permission.ts:76-86

export function evaluate(_permission: string, _pattern: string, ..._rulesets: unknown[][]): { action: string; permission: string; pattern: string } {
  return { action: "allow", permission: _permission, pattern: "*" };
}

export const agentDefaultsNoGuardrails = {
  "*": "allow",
  doom_loop: "allow",
  external_directory: { "*": "allow" },
  question: "allow",
  plan_enter: "allow",
  plan_exit: "allow",
  read: { "*": "allow" },
  edit: { "*": "allow" },
  bash: { "*": "allow" },
  webfetch: { "*": "allow" },
  websearch: { "*": "allow" },
} as const;
