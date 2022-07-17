#!/usr/bin/env bash
# shellcheck disable=SC2154
export ALTERNATE_EDITOR="emacs"
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:"$HOME"/
export PATH=$PATH:"$HOME"/bin
export PATH=$PATH:"$HOME"/.shellscripts/bin
export PATH=$PATH:"$HOME"/.shellscripts/bin/dyn
export PATH=$PATH:"$HOME"/.config/aik/linux/bin
export PATH=$PATH:"$HOME"/.node_modules/bin
export PATH=$PATH:"$HOME"/.local/bin
export PATH=$PATH:/usr/lib/eclipse
export PATH=$PATH:/opt/android-sdk/tools
export PATH=$PATH:/opt/android-sdk/platform-tools
export npm_config_prefix=~/.node_modules

export ANDROID_SDK=/opt/android-sdk
export ANDROID_NDK=/opt/android-sdk/ndk-bundle
export PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:/root/.gem/ruby/2.7.0/bin
export HISTCONTROL=ignoredups

export PAPERSIZE="a4"