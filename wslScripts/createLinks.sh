#!/bin/bash

FROM=/mnt/d/Users/Hugo
TO=$HOME

echo "Creating links from $FROM to $TO..."
cd $TO

# Editor settings
ln -s "$FROM/.editorconfig" .editorconfig
ln -s "$FROM/.eslintignore" .eslintignore

# Git settings
ln -s "$FROM/.gitignore" .gitignore
#ln -s "$FROM/.gitconfig" .gitconfig

cd -
echo "Created links."