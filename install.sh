#!/usr/bin/env bash
set -euo pipefail

APP_NAME="chudsay"
REPO="segfaultcel/libchud"
BRANCH="${BRANCH:-main}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"

RAW_BASE="https://raw.githubusercontent.com/$REPO/$BRANCH"

mkdir -p "$INSTALL_DIR"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$RAW_BASE/$APP_NAME" -o "$INSTALL_DIR/$APP_NAME"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$INSTALL_DIR/$APP_NAME" "$RAW_BASE/$APP_NAME"
else
  echo "chudsay installer: curl or wget is required" >&2
  exit 1
fi

chmod +x "$INSTALL_DIR/$APP_NAME"

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
