#!/bin/bash

echo "Introduce your Windows username: "
read WIN_USER

WIN_HOME=/mnt/d/Users/$WIN_USER
TO=$HOME

echo "Creating links from $WIN_HOME to $TO..."
cd $TO

# Editor settings
ln -s "$WIN_HOME/.editorconfig" .editorconfig
ln -s "$WIN_HOME/.eslintignore" .eslintignore

# Git settings
ln -s "$WIN_HOME/.gitignore" .gitignore
#ln -s "$WIN_HOME/.gitconfig" .gitconfig

cd -

# Some applications like IntelliJ don't support running `wsl` with args, which
# means we need to manually create bridge scripts to allow these programs to
# call Linux binaries.
#
# The $WIN_HOME/.wslbin path is intentionally not added to the path since some
# programs may have expectations not met when the binary is ran from WSL.
cp -r bin/ "$WIN_HOME/.wslbin"

echo "Created links."