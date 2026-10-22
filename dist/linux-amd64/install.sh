#!/usr/bin/env bash
SRC="./bin"
INSTALL_LOCAL="$HOME/bin/cdd"
mkdir -p $INSTALL_LOCAL
cp "${SRC}/cdd.sh" $INSTALL_LOCAL
cp "${SRC}/cdo.sh" $INSTALL_LOCAL
cp "${SRC}/gcdd" $INSTALL_LOCAL
chmod -R 755 $INSTALL_LOCAL

if grep -q '# cdd setup' ~/.bashrc 2>/dev/null; then
    echo 'cdd is already set up in ~/.bashrc, binaries updated'
else
    printf '\n\n# cdd setup\n' >> ~/.bashrc
    echo "export PATH=\$PATH\":${INSTALL_LOCAL}\"" >> ~/.bashrc
    echo "alias cdd='. ${INSTALL_LOCAL}/cdd.sh'" >> ~/.bashrc
    echo "alias cdo='. ${INSTALL_LOCAL}/cdo.sh'" >> ~/.bashrc
fi

. ~/.bashrc
