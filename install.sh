#!/usr/bin/env bash
set -euo pipefail

APP_NAME="chudsay"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$INSTALL_DIR"

install -m 755 "$repo_dir/$APP_NAME" "$INSTALL_DIR/$APP_NAME"

echo "Installed $APP_NAME to $INSTALL_DIR/$APP_NAME"

case ":$PATH:" in
  *":$INSTALL_DIR:"*)
    echo "You can now run: $APP_NAME"
    ;;
  *)
    echo
    echo "Note: $INSTALL_DIR is not currently in your PATH."
    echo "Add this to your shell config, then restart your shell:"
    echo
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo
    echo "Then run: $APP_NAME"
    ;;
esac
