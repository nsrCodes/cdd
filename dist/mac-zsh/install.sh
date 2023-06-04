#!/bin/zsh
SRC="./bin"
INSTALL_LOCAL="$HOME/bin/cdd"
mkdir -p $INSTALL_LOCAL
cp "${SRC}/cdd.sh" $INSTALL_LOCAL
cp "${SRC}/cdo.sh" $INSTALL_LOCAL
cp "${SRC}/gcdd" $INSTALL_LOCAL

unalias cdd 2>/dev/null
# checking if output of last command was error 
# => alias was not present
if [ "$?" -ne 0 ]; then 
  echo "\n\n# cdd setup" >> ~/.zshrc
  echo "\nexport PATH=\"\$PATH:${INSTALL_LOCAL}\"" >> ~/.zshrc
  . ~/.zshrc
  echo "alias cdd='. ${INSTALL_LOCAL}/cdd.sh'" >> ~/.zshrc
  echo "alias cdo='. ${INSTALL_LOCAL}/cdo.sh'" >> ~/.zshrc
  echo "alias gcdd='${INSTALL_LOCAL}/gcdd'" >> ~/.zshrc

  # updating to -rwxr-xr-x in case that wasn't already the case
  chmod -R 755 $INSTALL_LOCAL
else
  echo 'Alias cdd is already present'
fi

. ~/.zshrc