#!/usr/bin/env bash
set -euo pipefail
share="${XDG_DATA_HOME:-$HOME/.local/share}"
bin="${NIXE_BIN_DIR:-$HOME/.local/bin}"
# Remove installed program resources only; never remove application data.
rm -f -- "$bin/nixe-archive"  "$share/applications/io.github.design_nexus.nixe.Archive.desktop"  "$share/icons/hicolor/scalable/apps/io.github.design_nexus.nixe.Archive.svg"
command -v update-desktop-database >/dev/null && update-desktop-database "$share/applications" || true
