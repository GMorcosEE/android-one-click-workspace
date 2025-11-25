FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install required dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        openjdk-17-jdk \
        curl \
        unzip \
        zip \
        git \
        libc6 \
        libstdc++6 \
        libgcc-s1 \
        libncurses5 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up Android SDK environment
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/34.0.0:${ANDROID_HOME}/emulator

# Create Android SDK directory
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools

# Download and install Android command-line tools
RUN curl -o /tmp/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip \
    && unzip -q /tmp/cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools \
    && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest \
    && rm /tmp/cmdline-tools.zip

# Install Android SDK components
RUN yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses || true
RUN ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --update
RUN ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager \
    "platform-tools" \
    "platforms;android-34" \
    "platforms;android-33" \
    "build-tools;34.0.0" \
    "build-tools;33.0.2" \
    "ndk;26.1.10909125" \
    "cmake;3.22.1" \
    "emulator" \
    "system-images;android-34;google_apis;x86_64"

# Set permissions for vscode user (user exists in base image)
RUN chown -R vscode:vscode ${ANDROID_HOME}

# Switch to vscode user to create AVD in their home directory
USER vscode
RUN echo "no" | ${ANDROID_HOME}/cmdline-tools/latest/bin/avdmanager create avd \
    -n "Pixel_6_API_34" \
    -k "system-images;android-34;google_apis;x86_64" \
    -d "pixel_6" \
    || true

# Switch back to root for final steps
USER root

# Set Java home
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Verify installations
RUN java -version && \
    ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --version && \
    ${ANDROID_HOME}/platform-tools/adb version
