FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install Java and basic tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        openjdk-17-jdk \
        wget \
        unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up environment variables
ENV ANDROID_HOME=/opt/android-sdk
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools

# Create SDK directory with proper permissions
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    chown -R vscode:vscode ${ANDROID_HOME}

USER vscode

# Download and extract command-line tools
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O /tmp/cmdline-tools.zip && \
    unzip -q /tmp/cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    rm /tmp/cmdline-tools.zip

USER root
