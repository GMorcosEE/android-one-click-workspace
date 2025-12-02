# Android Development Environment

A cloud-first Android development workspace designed for **Ona** (Gitpod). Write code in the cloud, test locally, and sync seamlessly with Git.

> **Version 2 - Phase 1 Complete**: Full Android SDK, sample app with tests, and a hybrid workflow that combines cloud development with local testing.

## 🎯 The Hybrid Development Workflow

This workspace is designed for a **best-of-both-worlds approach**:

### ☁️ Develop in Ona (Cloud)
- Write and edit code in your browser
- Build APKs instantly
- Run unit tests
- Commit and push changes to Git
- **Zero local setup required**

### 📱 Test in Android Studio (Local)
- Pull latest changes from Git
- Run the emulator (requires KVM)
- Test on physical devices
- Debug with full Android Studio tools
- **No need to set up SDK or dependencies**

### 🔄 The Complete Workflow

```
1. Open workspace in Ona → 2. Write code → 3. Build & test → 4. Commit & push
                                                                      ↓
5. Open Android Studio ← 6. Pull changes ← 7. Test on emulator/device
                                                                      ↓
                                                    8. Repeat from step 1
```

**Why this works:**
- ✅ Code in the cloud without local SDK setup
- ✅ Test with emulator that requires hardware acceleration
- ✅ Git keeps everything in sync
- ✅ Work from anywhere (cloud) but test properly (local)

## 🚀 Quick Start

### First-Time Setup

**1. Set up Android Studio locally** (one-time, ~10 minutes):
- Download [Android Studio](https://developer.android.com/studio)
- Install and run the setup wizard
- Let it download the Android SDK
- That's it! You're ready for local testing

**2. Clone this repository**:
```bash
git clone <your-repo-url>
cd <repo-name>
```

**3. Open in Android Studio**:
- File → Open → Select project directory
- Wait for Gradle sync
- You're ready to test locally!

Now you can use the hybrid workflow:

### For Cloud Development (Ona)

1. **Open this repository in Ona/Gitpod**
   - Click the Gitpod button or open in your Ona workspace
   - Wait for container build (~3-5 minutes first time)
   - Environment validates automatically

2. **Start coding immediately**
   ```bash
   # Edit code in browser
   # Build your app
   ./gradlew assembleDebug
   
   # Run unit tests
   ./gradlew test
   
   # Commit your changes
   git add .
   git commit -m "Add new feature"
   git push
   ```

3. **Your changes are now in Git** - ready to pull locally for testing!

### For Local Testing (Android Studio)

1. **Clone or pull the repository**
   ```bash
   git clone <your-repo-url>
   # or
   git pull origin main
   ```

2. **Open in Android Studio**
   - File → Open → Select project directory
   - Android Studio will sync Gradle automatically
   - SDK is already configured (from Ona workspace)

3. **Test with emulator or device**
   - Run app on emulator
   - Debug with full Android Studio tools
   - Test on physical devices

4. **Push any local changes back**
   ```bash
   git add .
   git commit -m "Fix bug found in testing"
   git push
   ```

The workspace is ready when you see:
```
✅ Android environment validation complete
```

## 💡 Why This Hybrid Approach?

### The Problem with Cloud-Only Android Development
- ❌ Emulators need hardware acceleration (KVM) - not available in cloud
- ❌ Physical device connection to cloud is complex and unreliable
- ❌ Debugging tools are limited in browser-based IDEs

### The Problem with Local-Only Android Development
- ❌ Requires full Android SDK setup on every machine
- ❌ Can't code from anywhere (need your dev machine)
- ❌ Environment inconsistencies between developers

### Our Solution: Best of Both Worlds
- ✅ **Code in Ona**: Zero setup, work from anywhere, consistent environment
- ✅ **Test locally**: Full emulator support, proper debugging, physical devices
- ✅ **Git syncs everything**: Seamless workflow between cloud and local
- ✅ **Fast iteration**: Build and test in cloud, only pull for device testing

## 📦 What's Included

This dev container provides a complete Android development stack:

### Android SDK Components
- **Platform Tools**: Latest ADB and fastboot
- **Build Tools**: 34.0.0
- **Platforms**: Android 14 (API 34)
- **Command-line Tools**: sdkmanager, avdmanager

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

## 🔄 Recommended Development Workflow

### Daily Development Cycle

**Morning: Start in Ona**
```bash
# Open Ona workspace (already configured)
# Pull latest changes if working with a team
git pull origin main

# Start coding your feature
# Edit MainActivity.kt, add new activities, etc.

# Build to verify
./gradlew assembleDebug

# Run unit tests
./gradlew test

# Commit your work
git add .
git commit -m "Add user profile screen"
git push origin main
```

**Afternoon: Test Locally**
```bash
# On your local machine
cd ~/projects/your-android-app
git pull origin main

# Open in Android Studio
# Run on emulator or device
# Test the new profile screen
# Debug any issues

# If you find bugs, fix them locally
git add .
git commit -m "Fix profile screen layout"
git push origin main
```

**Next Day: Continue in Ona**
```bash
# Back in Ona workspace
git pull origin main  # Get yesterday's bug fixes

# Continue development
# The cycle continues...
```

### When to Use Each Environment

**Use Ona for:**
- ✅ Writing and editing code
- ✅ Building APKs
- ✅ Running unit tests
- ✅ Code reviews and collaboration
- ✅ Quick iterations
- ✅ Working from any device

**Use Android Studio for:**
- ✅ Running the emulator
- ✅ Testing on physical devices
- ✅ UI debugging and inspection
- ✅ Performance profiling
- ✅ Instrumentation tests
- ✅ Complex debugging scenarios

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

## 📱 Testing Your App

### Recommended: Use Android Studio Locally

**This is the primary testing method for the hybrid workflow:**

1. **Commit and push from Ona**:
   ```bash
   # In Ona workspace
   git add .
   git commit -m "Add new feature"
   git push origin main
   ```

2. **Pull and test in Android Studio**:
   ```bash
   # On your local machine
   cd ~/projects/your-android-app
   git pull origin main
   ```

3. **Run in Android Studio**:
   - Open project in Android Studio
   - Click Run (Shift+F10)
   - Select emulator or physical device
   - Test your changes

4. **Push fixes back to Ona**:
   ```bash
   # If you fixed bugs locally
   git add .
   git commit -m "Fix layout issue"
   git push origin main
   ```

### Alternative: Physical Device in Ona (Advanced)

If you need to test directly from Ona without Android Studio:

**ADB over Network:**

1. **On your local machine** (with device connected via USB):
   ```bash
   adb tcpip 5555
   adb shell ip addr show wlan0  # Note the IP address
   ```

2. **In Ona workspace**:
   ```bash
   adb connect <device-ip>:5555
   adb devices  # Verify connection
   ./gradlew installDebug
   ```

**Note:** This is less reliable than the Android Studio workflow and mainly useful for quick tests.

### Verifying Device Connection

```bash
# List connected devices
adb devices

# Check device details
adb shell getprop ro.product.model
adb shell getprop ro.build.version.release

# Install your app
./gradlew installDebug

# Or manually
adb install -r app/build/outputs/apk/debug/app-debug.apk

# Launch the app
adb shell am start -n com.example.androiddevenv/.MainActivity

# View logs
adb logcat | grep AndroidDevEnv
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

### Device Connection Issues

```bash
# Restart ADB server
adb kill-server
adb start-server

# Check devices
adb devices

# If device shows as "unauthorized"
# Check your device screen for authorization prompt

# If ADB over network fails
# Ensure device and workspace are on same network
# Try reconnecting: adb connect <device-ip>:5555

# Check ADB version
adb version
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

**The hybrid workflow in action:**

### In Ona (Cloud Development)
1. Open workspace in browser
2. Write code, build APKs, run unit tests
3. Commit and push changes
4. **Time to productivity**: ~30 seconds (after first build)
5. **No local setup required**

### In Android Studio (Local Testing)
1. Pull latest changes from Git
2. Run on emulator or device
3. Test, debug, profile
4. Push fixes back to Git
5. **Full Android tooling available**

### The Complete Cycle
```
Code in Ona → Commit → Push → Pull in Android Studio → Test → Push fixes → Pull in Ona → Repeat
```

**Time Investment:**
- **First-time Ona setup**: ~3-5 minutes (container build)
- **First-time local setup**: ~5 minutes (git clone + Android Studio sync)
- **Daily workflow**: Seconds to switch between environments
- **Builds**: Fast in both environments (Gradle cache shared via Git)

**Key Benefits:**
- ✅ Code from anywhere (Ona in browser)
- ✅ Test properly (Android Studio with emulator)
- ✅ No environment setup headaches
- ✅ Git keeps everything in sync
- ✅ Team collaboration made easy

---

**Built with ❤️ for Android developers who value their time**
