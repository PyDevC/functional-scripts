# Functional Scripts
Repo for all scripts that can be used for programming or other useful purposes
You can freely customize the functions according to your need. It is recommended
to use these with tmux, neovim and other utilities to increase you productivity.
Now added navigation support using fzf it helps to quickly jump between directories.

## CONTRIB
you can provide your suggestions or report a bug by raising issue.
To contibute check [TEMPLATE.md](contrib/TEMPLATE.md) and 
[FEATURE.md](contrib/FEATURE.md)

## WARNINGS

warnings about scripts

`run.sh`<br>
don't use run.sh in the same directory as it will result in continuous execution 
of the script, causing an infinite loop which can onlybe undone by closing the 
terminal. **Ctrl-c won't do a thing.

