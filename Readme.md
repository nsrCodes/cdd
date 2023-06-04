# CDD - Change directories Dynamically

I am lazy and turns out that basic tab completion wasn't enough for me to navigate through my directories using `cd`

Hence I made `cdd`. This tool helps me create aliases to location which I can jump to at anytime from anywhere.\
There is also a `cdo` command that has the same fuctionality like `cdd` but will open the required path in the file manager rather than in the terminal.

And the best part is that `cdd` also has the basic functionality of `cd`.

## Installation steps

0. Clone the repo. Open a terminal at the cloned path.
1. If you use zsh do `cd dist/mac-zsh` or on bash `cd dist/bash-linux`
2. `. ./install.sh`  

## How to use
You can use the `-h` to get info about the commands that you have, but here's the gist of it

```
# Add an alias
cdd add <alias_name> <target/relative_destination> [flags]

# Delete an alias
cdd delete <alias_name> [flags]

# List all aliases
cdd -l
```

## Note
1. In the help section of the cli you might see help text for some commands with `gcdd` rather than `cdd` for now. This is because the main script is a wrapper around a CLI made in golang using cobra. That CLI uses the `gcdd` command as it's root command

2. The `cdo` works well on mac, but for linux, it only works on gnome.

---

_Suggestions, criticisms, comments and contributions of any type are always welcome_
