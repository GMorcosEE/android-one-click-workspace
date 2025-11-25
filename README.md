# Android Development Environment

A fully configured, self-contained Android development environment using Dev Containers and Ona automations. Zero manual setup required—just open and start coding.

> **Version 2 - Phase 1 Complete**: This workspace now includes a working sample app with launcher icons, unit and instrumentation tests, and a pre-configured Android emulator.

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
- **Build Tools**: 34.0.0
- **Platforms**: Android 14 (API 34)
- **Command-line Tools**: sdkmanager, avdmanager
- **Emulator**: Android Emulator with software rendering
- **System Image**: Android 34 Google APIs (x86_64)

### Development Tools
- **Java**: OpenJDK 17
- **Gradle**: 8.2 (via wrapper)
- **Kotlin**: 1.9.20
- **Git**: For version control
- **VS Code Extensions**:
  - Kotlin language support
  - Java extension pack
  - Gradle for Java
  - Red Hat Java support

### Sample Application
- Basic Kotlin Android app with Material Design
- Configured for API 34 (minSdk 24)
- Includes launcher icons for all densities
- Unit tests and instrumentation tests included
- Ready to build and extend

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

### Automatic Tasks

These run automatically when the workspace starts:

1. **validateEnvironment**: Verifies ADB, SDK Manager, Java, and Gradle are working
2. **displayEnvironmentInfo**: Shows environment variables and paths

### Available Tasks

Run these manually via Ona CLI or command palette:

- **buildDebug**: Build the app in debug mode (`./gradlew assembleDebug`)
- **buildRelease**: Build the app in release mode (`./gradlew assembleRelease`)
- **clean**: Clean Gradle build cache
- **updateSdk**: Update Android SDK components to latest versions
- **listDevices**: List connected Android devices

### Services

Long-running services that can be started/stopped:

- **emulator**: Start the Android emulator (Pixel 6 API 34)

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

## 🏗️ Building and Testing

The workspace includes a sample Kotlin Android app ready to build:

```bash
# Build debug APK
./gradlew assembleDebug

# Build release APK
./gradlew assembleRelease

# Run unit tests
./gradlew test

# Run instrumentation tests (requires emulator or device)
./gradlew connectedAndroidTest

# Install on connected device or emulator
./gradlew installDebug

# List all available tasks
./gradlew tasks
```

## 📱 Using the Emulator

### Starting the Emulator

Start the emulator service via Ona:

```bash
# Via Ona CLI
gitpod automations service start emulator

# Or manually
emulator -avd Pixel_6_API_34 -no-snapshot-load &
```

### Verifying Emulator Status

```bash
# Wait for device to be ready
adb wait-for-device

# List devices
adb devices

# Check if emulator is booted
adb shell getprop sys.boot_completed
```

### Installing and Running the App

```bash
# Install the debug APK
./gradlew installDebug

# Or manually install
adb install -r app/build/outputs/apk/debug/app-debug.apk

# Launch the app
adb shell am start -n com.example.androiddevenv/.MainActivity
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
├── app/                      # Sample Android app (Kotlin)
│   ├── build.gradle         # App-level build configuration
│   └── src/                 # Application source code
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

### Emulator Issues

```bash
# List available AVDs
emulator -list-avds

# Check emulator version
emulator -version

# Start with verbose logging
emulator -avd Pixel_6_API_34 -verbose
```

### ADB Connection Issues

```bash
# Restart ADB server
adb kill-server
adb start-server

# Check devices
adb devices
```

### Test Failures

```bash
# Run tests with more detail
./gradlew test --info

# Run specific test
./gradlew test --tests "com.example.androiddevenv.ExampleUnitTest"

# Clean before testing
./gradlew clean test
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
**First build**: ~1-2 minutes (dependency download)  
**Subsequent builds**: Seconds (incremental)

---

**Built with ❤️ for Android developers who value their time**
