#!/bin/bash
set -e

VERSION=$(grep "^version:" pubspec.yaml | sed 's/version: //' | cut -d'+' -f1)
RELEASE_DIR="build/macos/Build/Products/Release"
APP="$RELEASE_DIR/MCCompanion.app"
ZIP="$RELEASE_DIR/MCCompanion.zip"
ENTITLEMENTS="macos/Runner/Release.entitlements"
CERT="Developer ID Application: Jens Collaert (MQZXJG35BH)"

echo "▶ Building MCCompanion $VERSION..."
flutter build macos --release

echo "▶ Signing app..."
codesign --deep --force \
  --sign "$CERT" \
  --options runtime \
  "$APP" 2>&1

codesign --force \
  --sign "$CERT" \
  --options runtime \
  --entitlements "$ENTITLEMENTS" \
  "$APP" 2>&1

echo "▶ Verifying signature..."
codesign --verify --deep --strict "$APP" && echo "  Signature OK"
spctl --assess --verbose "$APP" 2>&1 | grep -E "accepted|rejected|source" || true

echo "▶ Zipping app..."
rm -f "$ZIP"
ditto -c -k --keepParent "$APP" "$ZIP"

echo "▶ Notarizing app..."
xcrun notarytool submit "$ZIP" \
  --keychain-profile "netherlink-profile" \
  --wait

echo "▶ Stapling app..."
xcrun stapler staple "$APP"

echo "▶ Creating DMG..."
create-dmg "$APP" "$RELEASE_DIR" --overwrite

CREATED_DMG=$(find "$RELEASE_DIR" -name "*.dmg" | head -1)
DMG="$RELEASE_DIR/MCCompanion.dmg"
mv -f "$CREATED_DMG" "$DMG"
echo "  DMG: $DMG"

echo "▶ Notarizing DMG..."
xcrun notarytool submit "$DMG" \
  --keychain-profile "netherlink-profile" \
  --wait

echo "▶ Stapling DMG..."
xcrun stapler staple "$DMG"

echo "✅ Done! $DMG"
