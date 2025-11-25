# Android Development Environment

A fully configured, self-contained Android development environment using Dev Containers and Ona automations. Zero manual setup required—just open and start coding.

## 🚀 Quick Start

### Opening the Workspace

1. **Click "Open in Ona"** (or your platform's equivalent workspace launcher)
2. Wait for the container to build and initialise (first time only, ~5-10 minutes)
3. The environment validates automatically on startup
4. Start developing immediately

The workspace is ready when you see:
```
✅ Android environment validation complete
```

## 📦 What's Included

This dev container provides a complete Android development stack:

### Android SDK Components
- **Platform Tools**: Latest ADB and fastboot
- **Build Tools**: 34.0.0, 33.0.2
- **Platforms**: Android 14 (API 34), Android 13 (API 33)
- **NDK**: Version 26.1.10909125
- **CMake**: 3.22.1 for native builds
- **Emulator**: Android Emulator with hardware acceleration support
- **System Image**: Android 34 Google APIs (x86_64)

### Development Tools
- **Java**: OpenJDK 17
- **Gradle**: Wrapper included (version determined by project)
- **Git**: For version control
- **VS Code Extensions**:
  - Kotlin language support
  - Java extension pack
  - Gradle for Java
  - Red Hat Java support

### Pre-configured AVD
- **Device**: Pixel 6
- **API Level**: 34
- **Target**: Google APIs
- **Architecture**: x86_64

## 🔧 Environment Variables

The following environment variables are automatically configured:

```bash
ANDROID_HOME=/opt/android-sdk
ANDROID_SDK_ROOT=/opt/android-sdk
JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
```

The `PATH` includes:
- `/opt/android-sdk/platform-tools` (adb, fastboot)
- `/opt/android-sdk/build-tools/34.0.0`
- `/opt/android-sdk/emulator`
- `/opt/android-sdk/cmdline-tools/latest/bin` (sdkmanager, avdmanager)

## 🤖 Automations

### Prebuild Automations

These run during container build to cache dependencies:

1. **install-android-sdk-components**: Installs all SDK components and accepts licences
2. **warm-gradle-cache**: Pre-downloads Gradle dependencies for faster first build

### Workspace Open Automations

These run automatically when the workspace starts:

1. **validate-android-environment**: Verifies ADB, SDK Manager, Java, and Gradle
2. **display-environment-info**: Shows environment variables and paths

### Custom Commands

Run these via Ona's command palette or CLI:

- `emulator-run`: Start the Android emulator
- `adb-devices`: List connected devices and emulators
- `build-debug`: Build the app in debug mode (`./gradlew assembleDebug`)
- `build-release`: Build the app in release mode (`./gradlew assembleRelease`)
- `clean`: Clean Gradle build cache
- `update-sdk`: Update Android SDK components

## ✅ Verifying the Environment

### Manual Verification

Run these commands to verify the setup:

```bash
# Check ADB version
adb --version

# List installed SDK components
sdkmanager --list_installed

# Check Java version
java -version

# List Gradle tasks (if project exists)
./gradlew tasks

# List connected devices
adb devices
```

### Expected Output

All commands should execute without errors. Example:

```bash
$ adb --version
Android Debug Bridge version 1.0.41
Version 35.0.0-11411520

$ java -version
openjdk version "17.0.x" 2024-xx-xx
OpenJDK Runtime Environment (build 17.0.x+x-Ubuntu-x)
OpenJDK 64-Bit Server VM (build 17.0.x+x-Ubuntu-x, mixed mode, sharing)
```

## 🏗️ Building Your First App

### Using an Existing Project

If you have an Android project with a `gradlew` wrapper:

```bash
# Build debug APK
./gradlew assembleDebug

# Build release APK
./gradlew assembleRelease

# Run tests
./gradlew test

# Install on connected device
./gradlew installDebug
```

### Creating a New Project

1. Use Android Studio's project template or create manually
2. Ensure `gradlew` wrapper is included
3. Run `./gradlew tasks` to verify setup
4. Build with `./gradlew assembleDebug`

## 📱 Using the Emulator

### Starting the Emulator

```bash
# Via automation command
ona run emulator-run

# Or manually
emulator -avd Pixel_6_API_34 -no-snapshot-load &
```

### Checking Emulator Status

```bash
# Wait for device to be ready
adb wait-for-device

# List devices
adb devices
```

### Installing APKs

```bash
# Install debug build
adb install -r app/build/outputs/apk/debug/app-debug.apk

# Or use Gradle
./gradlew installDebug
```

## 🔌 Port Forwarding

The following ports are automatically forwarded:

- **5037**: ADB server (for device communication)

## 📁 Project Structure

```
.
├── .devcontainer/
│   ├── devcontainer.json    # Dev container configuration
│   └── Dockerfile            # Android SDK installation
├── .ona/
│   └── automations.yaml      # Ona automation definitions
├── app/                      # Your Android app code (create this)
├── gradle/                   # Gradle wrapper files
├── gradlew                   # Gradle wrapper script (Unix)
├── gradlew.bat              # Gradle wrapper script (Windows)
├── build.gradle             # Root build configuration
├── settings.gradle          # Project settings
└── README.md                # This file
```

## 🐛 Troubleshooting

### Container Build Fails

- Check internet connectivity (SDK downloads require network access)
- Verify Docker has sufficient resources (4GB+ RAM recommended)
- Review build logs for specific errors

### Gradle Build Fails

```bash
# Clean and rebuild
./gradlew clean build

# Check Gradle version
./gradlew --version

# Update Gradle wrapper
./gradlew wrapper --gradle-version=8.5
```

### Emulator Won't Start

```bash
# Check available AVDs
emulator -list-avds

# Verify system image is installed
sdkmanager --list_installed | grep system-images

# Create AVD manually if needed
avdmanager create avd -n TestDevice -k "system-images;android-34;google_apis;x86_64"
```

### ADB Connection Issues

```bash
# Restart ADB server
adb kill-server
adb start-server

# Check devices
adb devices
```

## 🔄 Updating SDK Components

```bash
# Update all installed components
sdkmanager --update

# Install specific component
sdkmanager "platforms;android-35"

# List available packages
sdkmanager --list
```

## 📚 Additional Resources

- [Android Developer Documentation](https://developer.android.com/docs)
- [Gradle Build Tool](https://gradle.org/guides/)
- [Dev Containers Specification](https://containers.dev/)
- [Ona Documentation](https://www.gitpod.io/docs/ona)

## 🎯 Developer Experience Summary

**The complete workflow:**

1. Developer clones repository
2. Clicks **"Open in Ona"**
3. Workspace starts (container builds and caches SDK/Gradle on first run)
4. Automations validate environment automatically
5. `./gradlew assembleDebug` runs in seconds (cache pre-warmed)
6. Ready to code—no manual configuration required

**First-time setup**: ~5-10 minutes (container build + SDK download)  
**Subsequent opens**: ~30 seconds (cached container)  
**First build**: ~1-2 minutes (Gradle cache pre-warmed)  
**Subsequent builds**: Seconds (incremental)

---

**Built with ❤️ for Android developers who value their time**
