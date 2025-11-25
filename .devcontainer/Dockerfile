FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install required dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        openjdk-17-jdk \
        curl \
        unzip \
        zip \
        git \
        wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up Android SDK environment
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/34.0.0:${ANDROID_HOME}/emulator

# Create Android SDK directory and set permissions
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    chown -R vscode:vscode ${ANDROID_HOME}

# Switch to vscode user for all Android SDK operations
USER vscode

# Download and install Android command-line tools
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O /tmp/cmdline-tools.zip && \
    unzip -q /tmp/cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    rm /tmp/cmdline-tools.zip

# Accept licenses and install essential SDK components only
RUN yes | ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --licenses && \
    ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --install \
        "platform-tools" \
        "platforms;android-34" \
        "build-tools;34.0.0" \
        "emulator" \
        "system-images;android-34;google_apis;x86_64"

# Create AVD for emulator
RUN echo "no" | ${ANDROID_HOME}/cmdline-tools/latest/bin/avdmanager create avd \
    -n "Pixel_6_API_34" \
    -k "system-images;android-34;google_apis;x86_64" \
    -d "pixel_6"

# Switch back to root
USER root

# Verify installations
RUN java -version && \
    ${ANDROID_HOME}/cmdline-tools/latest/bin/sdkmanager --version && \
    ${ANDROID_HOME}/platform-tools/adb --version
