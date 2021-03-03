# CDD - Change directories Dynamically

I am a lazy linux user and turns out that basic tab completion wasn't enough for me to navigate through my directories using `cd`

Hence I made `cdd`. This tool helps me create aliases to location which I can jump to at anytime from anywhere.\
There is also a `cdo` command that has the same fuctionality like `cdd` but will open the required path in the file manager rather than in the terminal.

And the best part is that `cdd` also has the basic functionality of `cd`.

You can understand how to use each command by using the `-h` flag for help

## Installation instructions

1. `cd dist`
2. `source ./install.sh`  

> Note: currently only works with bash. Working on adding support for other terminals as well

## Demo

[![asciicast](https://asciinema.org/a/9gq2aq7BabZYz1G9B95RebSvG.svg)](https://asciinema.org/a/9gq2aq7BabZYz1G9B95RebSvG?autoplay=1&speed=2)

## Note
1. In the help section of the cli you might see help text for some commands with `gcdd` rather than `cdd` for now. This is because the main script is a wrapper around a CLI made in golang using cobra. That CLI uses the `gcdd` command as it's root command

2. The `cdo` command might only work on gnome for now. 

---

_Suggestions, criticisms, comments and contributions of any type are always welcome. Feel free to reach out_
