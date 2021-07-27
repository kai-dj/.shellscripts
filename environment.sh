#!/usr/bin/env bash
export ALTERNATE_EDITOR="emacs"
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:/home/aik/.config/aik/linux/bin:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/:/usr/lib/eclipse/:$HOME/.node_modules/bin:/home/aik/bin
export npm_config_prefix=~/.node_modules

export ANDROID_SDK=/opt/android-sdk
export ANDROID_NDK=/opt/android-sdk/ndk-bundle
export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:/root/.gem/ruby/2.7.0/bin
