# sh.vim: bash

# Make vim the default editor
export EDITOR="vim"

# Don’t clear the screen after quitting a manual page
# export MANPAGER="less -X"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$COLOR_YELLOW"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoreboth:erasedups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# <3
export GREP_COLORS="mt=38;5;208:sl=38;5;248:cx=:fn=38;5;72:ln=38;5;237:bn=:se=38;5;237"
export LS_COLORS="di=38;5;111:fi=38;5;72:mi=38;5;167:ex=38;5;208:ln=:no=38;5;248"
