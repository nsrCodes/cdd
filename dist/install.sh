#!/bin/sh
# Picks the right build for this machine and runs its installer.
# Must be sourced so the shell aliases land in your current session:
#   . ./dist/install.sh
# Per-arch installers live in dist/<target>/install.sh if you want to pick manually.

_cdd_dist_dir="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
# When sourced, $0 is the shell, so fall back to the sourced-file path.
[ -f "${_cdd_dist_dir}/mac-arm64/install.sh" ] || _cdd_dist_dir="$(cd "$(dirname "${BASH_SOURCE:-${(%):-%x}}")" && pwd)"

case "$(uname -s)-$(uname -m)" in
  Darwin-arm64)          _cdd_target="mac-arm64" ;;
  Darwin-x86_64)         _cdd_target="mac-intel" ;;
  Linux-x86_64)          _cdd_target="linux-amd64" ;;
  *) echo "cdd: no prebuilt binary for $(uname -s) $(uname -m). Build gcdd/ with go and run dist/<target>/install.sh manually." ; return 1 2>/dev/null || exit 1 ;;
esac

case "${_cdd_target}" in
  mac-*)  [ -n "$ZSH_VERSION" ]  || { echo "cdd: the macOS installer must be sourced from zsh (. ./dist/install.sh)"; return 1 2>/dev/null || exit 1; } ;;
  linux-*) [ -n "$BASH_VERSION" ] || { echo "cdd: the Linux installer must be sourced from bash (. ./dist/install.sh)"; return 1 2>/dev/null || exit 1; } ;;
esac

echo "Installing cdd for ${_cdd_target}"
_cdd_prev_dir="$PWD"
cd "${_cdd_dist_dir}/${_cdd_target}" && . ./install.sh
cd "${_cdd_prev_dir}"
unset _cdd_dist_dir _cdd_target _cdd_prev_dir
