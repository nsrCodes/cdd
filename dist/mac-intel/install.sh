#!/bin/zsh
SRC="./bin"
INSTALL_LOCAL="$HOME/bin/cdd"
mkdir -p $INSTALL_LOCAL
cp "${SRC}/cdd.sh" $INSTALL_LOCAL
cp "${SRC}/cdo.sh" $INSTALL_LOCAL
cp "${SRC}/gcdd" $INSTALL_LOCAL
# updating to -rwxr-xr-x in case that wasn't already the case
chmod -R 755 $INSTALL_LOCAL

if grep -q '# cdd setup' ~/.zshrc 2>/dev/null; then
  echo 'cdd is already set up in ~/.zshrc, binaries updated'
else
  echo "\n\n# cdd setup" >> ~/.zshrc
  echo "\nexport PATH=\"\$PATH:${INSTALL_LOCAL}\"" >> ~/.zshrc
  echo "alias cdd='. ${INSTALL_LOCAL}/cdd.sh'" >> ~/.zshrc
  echo "alias cdo='. ${INSTALL_LOCAL}/cdo.sh'" >> ~/.zshrc
  echo "alias gcdd='${INSTALL_LOCAL}/gcdd'" >> ~/.zshrc
fi

. ~/.zshrc
