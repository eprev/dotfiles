# https://raw.github.com/mathiasbynens/dotfiles/master/.bash_profile

for file in $HOME/.dotfiles/lib/{prompt,exports,aliases,functions}.sh; do
    [ -r "$file" ] && source "$file"
done
unset file

# http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

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
