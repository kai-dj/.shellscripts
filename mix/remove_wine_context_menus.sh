#!/usr/bin/env sh
# remove wine applications from context menus etc.

rm -f ~/.local/share/mime/packages/x-wine*;
rm -f ~/.local/share/applications/wine-extension*;
rm -f ~/.local/share/icons/hicolor/*/*/application-x-wine-extension*;
rm -f ~/.local/share/mime/application/x-wine-extension*;


