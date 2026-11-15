#!/usr/bin/env bash
# Adds the permissions the QR pairing scanner and voice input need.
set -euo pipefail
M=android/app/src/main/AndroidManifest.xml

for p in CAMERA RECORD_AUDIO MODIFY_AUDIO_SETTINGS; do
  grep -q "android.permission.$p" "$M" || \
    sed -i "s#<application#<uses-permission android:name=\"android.permission.$p\" />\n    <application#" "$M"
done

grep -q "android.hardware.camera" "$M" || \
  sed -i 's#<application#<uses-feature android:name="android.hardware.camera" android:required="false" />\n    <application#' "$M"

echo "Patched $M"
