#!/usr/bin/bash
SRC="./bin"
mkdir -p $HOME/bin/cdd
cp "${SRC}/cdd.sh" $HOME/bin/cdd
cp "${SRC}/cdo.sh" $HOME/bin/cdd
cp "${SRC}/gcdd" $HOME/bin/cdd

echo 'export PATH=$PATH":$HOME/bin/cdd"' >> ~/.bashrc

if [ "$(type -t cdd)" = 'alias' ]; then
    echo 'Alias cdd is already present'
else
    echo "alias cdd='. $HOME/bin/cdd/cdd.sh'" >> ~/.bashrc
    echo "alias cdo='. $HOME/bin/cdd/cdo.sh'" >> ~/.bashrc
    . ~/.bashrc
fi

. ~/.bashrc