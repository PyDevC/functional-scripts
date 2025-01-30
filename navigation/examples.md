# FUZZY
Advanced fzf ( fuzzy finder ) usage for file navigation, copying, removing, <br>
file search.

This script can be implemented with various alias such as

```bash
alias cdd='cd $(fuzzy dir ~/personal)'
```
## Additional requirements

- fzf should be of version 0.58
- S_TRASH and OPT_LOCATION should be set 
- works on Linux ( Ubuntu 22.04 or maybe above)


> WARNING: If you find any vulnerability then raise issue imediatley.

## Usage

It is recommended to put these scripts where you can use them easily without
using ./fuzzy to run it or bash fuzzy.

**HINT** put `export PATH="/home/d/bin:$PATH"` in your .bashrc put fuzzy in bin

`fuzzy cp` for copying file from one location to another
use `source fuzzy cp` to get $OPT_LOCATION  as env variable for future use.<br>
But this will be erased as soon as system in rebooted.

you can use `fuzzy mv` same way but to move the file.

`fuzzy remove` will move the file to S_TRASH. <br>
`fuzzy remove --forced` will remove them from system.
