#!/bin/sh
# install yaourt and package-query
cd /tmp/ &&
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz &&
tar -xvzf package-query.tar.gz &&
cd package-query &&
makepkg -si &&
cd .. &&
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz &&
tar -xvzf yaourt.tar.gz &&
cd yaourt &&
makepkg -si &&
cd .. &&
rm -Rf package-query &&
rm -Rf yaourt &&
echo "yaourt installed"
