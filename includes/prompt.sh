# Terminal colors
# http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        COLOR_BLACK=$(tput setaf 234)
        COLOR_RED=$(tput setaf 88)
        COLOR_GREEN=$(tput setaf 28)
        COLOR_YELLOW=$(tput setaf 172)
        COLOR_BLUE=$(tput setaf 26)
        COLOR_MAGENTA=$(tput setaf 92)
        COLOR_CYAN=$(tput setaf 32)
        COLOR_WHITE=$(tput setaf 244)

        COLOR_BRIGHT_BLACK=$(tput setaf 236)
        COLOR_BRIGHT_RED=$(tput setaf 196)
        COLOR_BRIGHT_GREEN=$(tput setaf 118)
        COLOR_BRIGHT_YELLOW=$(tput setaf 214)
        COLOR_BRIGHT_BLUE=$(tput setaf 69)
        COLOR_BRIGHT_MAGENTA=$(tput setaf 135)
        COLOR_BRIGHT_CYAN=$(tput setaf 75)
        COLOR_BRIGHT_WHITE=$(tput setaf 254)

        COLOR_BG_BLACK=$(tput setab 0)
        COLOR_BG_RED=$(tput setab 1)
        COLOR_BG_GREEN=$(tput setab 2)
        COLOR_BG_YELLOW=$(tput setab 3)
        COLOR_BG_BLUE=$(tput setab 4)
        COLOR_BG_MAGENTA=$(tput setab 5)
        COLOR_BG_CYAN=$(tput setab 6)
        COLOR_BG_WHITE=$(tput setab 7)
    else
        COLOR_BLACK=$(tput setaf 0)
        COLOR_RED=$(tput setaf 1)
        COLOR_GREEN=$(tput setaf 2)
        COLOR_YELLOW=$(tput setaf 3)
        COLOR_BLUE=$(tput setaf 4)
        COLOR_MAGENTA=$(tput setaf 5)
        COLOR_CYAN=$(tput setaf 6)
        COLOR_WHITE=$(tput setaf 7)

        COLOR_BRIGHT_BLACK=$(tput setaf 8)
        COLOR_BRIGHT_RED=$(tput setaf 9)
        COLOR_BRIGHT_GREEN=$(tput setaf 10)
        COLOR_BRIGHT_YELLOW=$(tput setaf 11)
        COLOR_BRIGHT_BLUE=$(tput setaf 12)
        COLOR_BRIGHT_MAGENTA=$(tput setaf 13)
        COLOR_BRIGHT_CYAN=$(tput setaf 14)
        COLOR_BRIGHT_WHITE=$(tput setaf 15)

        COLOR_BG_BLACK=$(tput setab 0)
        COLOR_BG_RED=$(tput setab 1)
        COLOR_BG_GREEN=$(tput setab 2)
        COLOR_BG_YELLOW=$(tput setab 3)
        COLOR_BG_BLUE=$(tput setab 4)
        COLOR_BG_MAGENTA=$(tput setaf 5)
        COLOR_BG_CYAN=$(tput setab 6)
        COLOR_BG_WHITE=$(tput setab 7)
    fi
    COLOR_RESET=$(tput sgr0)
    COLOR_BRIGHT=$(tput bold)
else
    COLOR_RESET=$'\033[m'
    COLOR_BRIGHT=$'\033[1m'

    COLOR_BLACK=$'\033[30m'
    COLOR_RED=$'\033[31m'
    COLOR_GREEN=$'\033[32m'
    COLOR_YELLOW=$'\033[33m'
    COLOR_BLUE=$'\033[34m'
    COLOR_MAGENTA=$'\033[35m'
    COLOR_CYAN=$'\033[36m'
    COLOR_WHITE=$'\033[37m'

    COLOR_BRIGHT_BLACK=$'\033[1;30m'
    COLOR_BRIGHT_RED=$'\033[1;31m'
    COLOR_BRIGHT_GREEN=$'\033[1;32m'
    COLOR_BRIGHT_YELLOW=$'\033[1;33m'
    COLOR_BRIGHT_BLUE=$'\033[1;34m'
    COLOR_BRIGHT_MAGENTA=$'\033[1;35m'
    COLOR_BRIGHT_CYAN=$'\033[1;36m'
    COLOR_BRIGHT_WHITE=$'\033[1;37m'

    COLOR_BG_BLACK=$'\033[40m'
    COLOR_BG_RED=$'\033[41m'
    COLOR_BG_GREEN=$'\033[42m'
    COLOR_BG_YELLOW=$'\033[43m'
    COLOR_BG_BLUE=$'\033[44m'
    COLOR_BG_MAGENTA=$'\033[45m'
    COLOR_BG_CYAN=$'\033[46m'
    COLOR_BG_WHITE=$'\033[47m'
fi

# export COLOR_RESET
# export COLOR_BRIGHT
#
# export COLOR_BLACK
# export COLOR_RED
# export COLOR_GREEN
# export COLOR_YELLOW
# export COLOR_BLUE
# export COLOR_MAGENTA
# export COLOR_CYAN
# export COLOR_WHITE
#
# export COLOR_BRIGHT_BLACK
# export COLOR_BRIGHT_RED
# export COLOR_BRIGHT_GREEN
# export COLOR_BRIGHT_YELLOW
# export COLOR_BRIGHT_BLUE
# export COLOR_BRIGHT_MAGENTA
# export COLOR_BRIGHT_CYAN
# export COLOR_BRIGHT_WHITE
#
# export COLOR_BG_BLACK
# export COLOR_BG_RED
# export COLOR_BG_GREEN
# export COLOR_BG_YELLOW
# export COLOR_BG_BLUE
# export COLOR_BG_MAGENTA
# export COLOR_BG_CYAN
# export COLOR_BG_WHITE

# echo "${COLOR_RESET}${COLOR_BLACK}COLOR_BLACK"
# echo "${COLOR_RESET}${COLOR_RED}COLOR_RED"
# echo "${COLOR_RESET}${COLOR_GREEN}COLOR_GREEN"
# echo "${COLOR_RESET}${COLOR_YELLOW}COLOR_YELLOW"
# echo "${COLOR_RESET}${COLOR_BLUE}COLOR_BLUE"
# echo "${COLOR_RESET}${COLOR_MAGENTA}COLOR_MAGENTA"
# echo "${COLOR_RESET}${COLOR_CYAN}COLOR_CYAN"
# echo "${COLOR_RESET}${COLOR_WHITE}COLOR_WHITE"
# echo "${COLOR_RESET}${COLOR_BRIGHT_BLACK}COLOR_BRIGHT_BLACK"
# echo "${COLOR_RESET}${COLOR_BRIGHT_RED}COLOR_BRIGHT_RED"
# echo "${COLOR_RESET}${COLOR_BRIGHT_GREEN}COLOR_BRIGHT_GREEN"
# echo "${COLOR_RESET}${COLOR_BRIGHT_YELLOW}COLOR_BRIGHT_YELLOW"
# echo "${COLOR_RESET}${COLOR_BRIGHT_BLUE}COLOR_BRIGHT_BLUE"
# echo "${COLOR_RESET}${COLOR_BRIGHT_MAGENTA}COLOR_BRIGHT_MAGENTA"
# echo "${COLOR_RESET}${COLOR_BRIGHT_CYAN}COLOR_BRIGHT_CYAN"
# echo "${COLOR_RESET}${COLOR_BRIGHT_WHITE}COLOR_BRIGHT_WHITE"

function parse_git_dirty() {
    ! [[ $(git status 2> /dev/null | tail -n1) =~ (working (directory|tree) clean) ]] && echo "*"
}

function parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\[${COLOR_BRIGHT_CYAN}\]\u\[$COLOR_BRIGHT_MAGENTA\]@\h \[$COLOR_BRIGHT_YELLOW\]\w\[$COLOR_RESET\] \[$COLOR_BRIGHT_GREEN\]\$(parse_git_branch)\[$COLOR_RESET\]\n\$ "
export PS2="\[$COLOR_RESET\]→ "
