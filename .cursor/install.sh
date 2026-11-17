#!/usr/bin/env bash
# Validation-only Cloud Agent bootstrap.
# Installs shellcheck so agents can syntax-check scripts.
# Does not SSH, contact a controller or device, or run firmware actions.
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

as_root() {
  if [[ "$(id -u)" -eq 0 ]]; then
    "$@"
  else
    sudo -n "$@"
  fi
}

if ! command -v shellcheck >/dev/null 2>&1; then
  as_root apt-get update
  as_root apt-get install -y --no-install-recommends shellcheck
else
  echo "shellcheck already installed"
fi

# shfmt: no formatter config or format target in this repo.
# bats: no test suite.
# jq / yamllint: no project JSON or YAML configs to lint.

# Device updates need an SSH agent. Validation never uses it.
# Read the name only; do not print the value, and do not fail install.
if [[ -z "${SSH_AUTH_SOCK:-}" ]]; then
  echo "warning: SSH_AUTH_SOCK is unset. Device updates need an SSH agent; this validation environment does not use it." >&2
fi
