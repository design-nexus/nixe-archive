#!/usr/bin/env bash
set -euo pipefail
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
if [[ ${1:-} != --no-build ]]; then
  cargo build --manifest-path "$root/Cargo.toml" --release --locked -p nixe-archive
fi
binary="${CARGO_TARGET_DIR:-$root/target}/release/nixe-archive"
share="${XDG_DATA_HOME:-$HOME/.local/share}"
bin="${NIXE_BIN_DIR:-$HOME/.local/bin}"
install -Dm755 "$binary" "$bin/nixe-archive"
install -Dm644 "$root/apps/archive/data/io.github.design_nexus.nixe.Archive.desktop"   "$share/applications/io.github.design_nexus.nixe.Archive.desktop"
install -Dm644 "$root/apps/archive/data/io.github.design_nexus.nixe.Archive.svg"   "$share/icons/hicolor/scalable/apps/io.github.design_nexus.nixe.Archive.svg"
command -v update-desktop-database >/dev/null && update-desktop-database "$share/applications" || true
command -v gtk-update-icon-cache >/dev/null && gtk-update-icon-cache -q "$share/icons/hicolor" || true
