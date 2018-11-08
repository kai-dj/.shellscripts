#!/bin/bash
# moves everything in home dir besides .dot-files and defined files to ~/tmp/<date>
shopt -s extglob
dirname=$(date +%Y-%m-%d_%H:%M)
mkdir ~/tmp/"$dirname"
cd ~
mv -v !(.*|h6x|dwn|mnt|org|prj|tmp|WRM|README.org) ~/tmp/"$dirname"
