# sh.vim: bash
# vim: ft=sh

source $HOME/.bashrc

export TERM=xterm-256color

export PASSBOX_LOCATION="$HOME/Dropbox/.passwords.gpg"
export ZK_NOTEBOOK_DIR="$HOME/Notes"

export DOTFILES_PATH="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

for file in "$DOTFILES_PATH"/includes/*.sh; do
    [ -r "$file" ] && source "$file"
done
unset file

# Setup git completion for its alias
__git_complete g __git_main

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Save all lines of a multiple-line command in the same history entry
# (allows easy re-editing of multi-line commands)
shopt -s cmdhist

# Don't autocomplete when accidentally pressing Tab on an empty line.
# (It takes forever and yields "Display all 15 gazillion possibilites?")
shopt -s no_empty_cmd_completion

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | awk '{print $2}')" scp sftp ssh

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Map alternative Esc for iPad
export FZF_DEFAULT_OPTS="--bind §:abort"
# Use ripgrep in FZF
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Keep Catalina quiet.
export BASH_SILENCE_DEPRECATION_WARNING=1

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash