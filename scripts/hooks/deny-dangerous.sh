#!/usr/bin/env bash
# Refuses commands that destroy work or act outward without a human.
#
# Each entry is here because the damage is INVISIBLE afterwards:
#   * `git checkout --` over uncommitted work deletes it, and `git status` then shows the
#     file CLEAN — there is nothing left to notice.
#   * A force push rewrites history somebody else already pulled.
#   * Merging your own pull request removes the named human approver that 62443-4-1 wants.
#   * Writing to production bypasses just-in-time access with second-person approval.
set -uo pipefail
cmd=$(cat)

block() { printf '{"decision":"block","reason":"%s"}\n' "$1"; exit 0; }

# Fail CLOSED on input this hook cannot read. If the hook contract ever changes to a shape
# that carries no command, every pattern below misses and the deny list silently permits
# everything — with no signal that it stopped working. An empty read is that case, and it
# is indistinguishable from "nothing dangerous" unless it is treated as a failure.
[ -z "${cmd//[[:space:]]/}" ] && block "The command hook received no command. The hook contract may have changed; the deny list cannot be trusted until scripts/hooks/deny-dangerous.sh is checked."

case "$cmd" in
  *"git push"*--force*|*"git push"*" -f"*)
      block "Force push rewrites history others have pulled. Push a new commit instead." ;;
  *"git checkout --"*|*"git restore"*--worktree*)
      block "This deletes uncommitted work and git status then shows the file CLEAN. Copy the file first if you meant to discard it." ;;
  *"rm -rf "*)
      block "Recursive delete. Name the paths explicitly." ;;
  *"gh pr merge"*)
      block "A pull request is merged by a named human, not by the author and not by an agent." ;;
  *kubectl*--context*prod*|*"terraform apply"*prod*|*"psql"*prod*)
      block "Direct production access. It is just-in-time with second-person approval (docs/18 ch. 18.3)." ;;
esac
exit 0
