# ⚠️ Dev Container Rebuild Required

## Important Notice

The `version2` branch includes significant changes to the dev container configuration that require a **full container rebuild** to take effect.

## What Changed

- Added Android Emulator installation
- Added emulator system dependencies (libpulse0, libgl1, etc.)
- Created pre-configured AVD (Pixel_6_API_34)
- Updated PATH to include emulator directory

## How to Rebuild

### Option 1: Via Gitpod Dashboard
1. Stop the current workspace
2. Delete the workspace
3. Create a new workspace from the `version2` branch

### Option 2: Via Gitpod CLI (if available)
```bash
gitpod environment devcontainer rebuild
```

### Option 3: Manual Rebuild
If you have access to the Gitpod environment settings:
1. Navigate to workspace settings
2. Select "Rebuild Container"
3. Wait for the rebuild to complete (~5-10 minutes)

## Verification

After rebuild, verify the emulator is available:

```bash
# Check emulator is in PATH
which emulator

# Check emulator version
emulator -version

# List available AVDs
emulator -list-avds
```

Expected output:
```
/opt/android-sdk/emulator/emulator
Android emulator version 36.2.12...
Pixel_6_API_34
```

## Current Status

If you're seeing `emulator: command not found`, it means:
- ✅ The emulator was installed manually in the current session
- ❌ The container was not rebuilt from the updated Dockerfile
- ❌ Emulator dependencies (libpulse0, etc.) are missing
- ⚠️ The emulator will not work until container is rebuilt

## Why Rebuild is Necessary

Dev container changes in the Dockerfile only take effect when the container is built. Changes include:
1. System package installation (apt-get install)
2. SDK component installation during build
3. AVD creation during build
4. Environment variable setup

These cannot be applied to a running container and require a fresh build.
