#!/bin/bash

set -e

echo "🚀 Setting up Android ROM Development Environment..."

# Update system
sudo apt update && sudo apt upgrade -y

# Install Android development dependencies
sudo apt install -y \
    git-core gnupg flex bison build-essential zip curl zlib1g-dev \
    gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev \
    x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils \
    xsltproc unzip fontconfig bc rsync schedtool \
    adb fastboot ccache

# Install repo tool
sudo curl https://storage.googleapis.com/git-repo-downloads/repo -o /usr/local/bin/repo
sudo chmod a+rx /usr/local/bin/repo

# Configure ccache
echo 'export USE_CCACHE=1' >> ~/.bashrc
echo 'export CCACHE_DIR=~/.ccache' >> ~/.bashrc
ccache -M 20G

# Create workspace structure
mkdir -p /workspace/{aosp,device,vendor,kernel,roms,tools}

# Create helpful aliases
cat >> ~/.bashrc << 'EOF'

# Android ROM Development Aliases
alias croot='cd /workspace'
alias breakfast='source build/envsetup.sh'
alias brunch='breakfast && lunch'

# Quick navigation
alias cdaosp='cd /workspace/aosp'
alias cddevice='cd /workspace/device'
alias cdvendor='cd /workspace/vendor'

export ANDROID_WORKSPACE=/workspace
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
EOF

echo "✅ Android development environment setup complete!"
