#!/usr/bin/env sh

setxkbmap de -variant nodeadkeys -option "ctrl:nocaps"
numlockx on

#setxkbmap de -variant nodeadkeys -option "caps:hyper"
#xmodmap -e "remove Mod4 = Hyper_L" -e "add Mod3 = Hyper_L"
#numlockx on