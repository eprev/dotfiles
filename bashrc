# vim: ft=sh

export DOTFILES_PATH="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

export LANG=en_US.UTF-8
export PATH=$DOTFILES_PATH/bin/:$HOME/.yarn/bin:$HOME/Library/Python/3.11/bin:$PATH

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

# GNU grep and ls
export PATH=/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Set SSH authentication socket location
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi
