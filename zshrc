# vim: fmr={{{,}}} fdl=1 fdm=marker
#
# https://zsh.sourceforge.io/Doc/Release/Zsh-Modules.html#Zsh-Modules

# Better ssh, scp autocomplete {{{
zstyle ':completion:*:(ssh|scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'
# }}}

# Autocomplete {{{
autoload -Uz compinit && compinit
# Small letters match small and capital letters
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# }}}
#
# promt config {{{
setopt prompt_subst

# git {{{
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' actionformats ' %F{196}[%b]%u%c%f'
zstyle ':vcs_info:git:*' formats ' %F{72}[%b]%u%c%f'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
# }}}

NL=$'\n'
PROMPT_TEMPLATE='%F{111}%n%f%F{98}@%m%f %F{178}%5~%f${vcs_info_msg_0_}${NL}%(!.#.)${VIMODE} '
PROMPT="${PROMPT_TEMPLATE}"

function zle-line-init() {
  zle -K viins
}
zle -N zle-line-init

# toggles vi mode in the prompt
function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/<}/(main|viins)/>}"
  PROMPT="${PROMPT_TEMPLATE}"
  zle reset-prompt
}
zle -N zle-keymap-select

# }}}

# vi mode {{{
# 'v' in visual mode opens VIM to edit the command
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# emacs flavor control keys
bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
bindkey "^Y" yank
# }}}

export DOTFILES_PATH=$(dirname ${(%):-%N})
#
export LANG=en_US.UTF-8
export PATH=$DOTFILES_PATH/bin/:$PATH

export ZK_NOTEBOOK_DIR="$HOME/Notes"

for file in "$DOTFILES_PATH"/includes/*.zsh; do
    [ -r "$file" ] && source "$file"
done
unset file

# autosuggestions {{{
source $DOTFILES_PATH/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}

# homebrew {{{
if ! command -v brew &> /dev/null; then
  # detect liklely Homebrew installation directory
  export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
  if command -v brew &> /dev/null; then
    eval "$(brew shellenv)"
  fi
fi
# }}}

# fzf {{{
if command -v rg &> /dev/null; then
  export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
  export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore --glob '!.git/*'"
fi
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# # Map alternative Esc for iPad
# export FZF_DEFAULT_OPTS="--bind §:abort"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

## Set SSH authentication socket location
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi