#!/bin/bash
# Optional script to install Android Emulator and create AVD
# Run this manually if you need emulator support

set -e

echo "Installing Android Emulator and system image..."
${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --install \
    "emulator" \
    "system-images;android-34;google_apis;x86_64"

echo "Creating AVD..."
echo "no" | ${ANDROID_HOME}/cmdline-tools/latest/bin/avdmanager create avd \
    -n "Pixel_6_API_34" \
    -k "system-images;android-34;google_apis;x86_64" \
    -d "pixel_6"

echo "✅ Emulator setup complete. You can start it with: emulator -avd Pixel_6_API_34"
