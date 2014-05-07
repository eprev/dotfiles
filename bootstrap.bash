# https://raw.github.com/mathiasbynens/dotfiles/master/.bash_profile

export TERM=xterm-256color

for file in $HOME/.dotfiles/includes/*.bash; do
    [ -r "$file" ] && source "$file"
done
unset file

# Setup git completion for its alias
__git_complete g __git_main

# http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Save all lines of a multiple-line command in the same history entry (allows easy re-editing of multi-line commands)
shopt -s cmdhist

# Don't autocomplete when accidentally pressing Tab on an empty line. (It takes forever and yields "Display all 15 gazillion possibilites?")
shopt -s no_empty_cmd_completion

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
# for option in autocd globstar; do
#   shopt -s "$option" 2> /dev/null
# done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | awk '{print $2}')" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal TextMate" killall

# If possible, add tab completion for many more commands
# [ -f /etc/bash_completion ] && source /etc/bash_completion
