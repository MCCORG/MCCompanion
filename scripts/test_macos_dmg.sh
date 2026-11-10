#!/bin/bash
set -euo pipefail

DMG="$1"
MOUNT="$RUNNER_TEMP/mcc-dmg-test"
INSTALL="$RUNNER_TEMP/mcc-install-test"
APP="$INSTALL/MCCompanion.app"
PID=""
ATTACHED=false
mkdir -p "$MOUNT" "$INSTALL"

cleanup() {
  if [ -n "$PID" ]; then
    kill "$PID" 2>/dev/null || true
  fi
  if [ "$ATTACHED" = true ]; then
    hdiutil detach "$MOUNT"
  fi
}
trap cleanup EXIT

xcrun stapler validate "$DMG"
spctl --assess --type open --context context:primary-signature -v "$DMG"
hdiutil attach "$DMG" -readonly -nobrowse -mountpoint "$MOUNT"
ATTACHED=true
test "$(readlink "$MOUNT/Applications")" = /Applications
ditto "$MOUNT/MCCompanion.app" "$APP"
hdiutil detach "$MOUNT"
ATTACHED=false

codesign --verify --deep --strict --verbose=2 "$APP"
xcrun stapler validate "$APP"
spctl --assess --type execute --verbose=4 "$APP"
lipo -verify_arch arm64 x86_64 "$APP/Contents/MacOS/MCCompanion"
open -n "$APP"

for _ in {1..30}; do
  PID="$(pgrep -f "$APP/Contents/MacOS/MCCompanion" | head -1 || true)"
  [ -n "$PID" ] && break
  sleep 1
done
if [ -z "$PID" ]; then
  echo "The installed app did not start." >&2
  exit 1
fi
sleep 10
if ! kill -0 "$PID" 2>/dev/null; then
  echo "The installed app exited during startup." >&2
  PID=""
  exit 1
fi
echo "The installed app launched and remained running (PID $PID)."
