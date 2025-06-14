#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dir='dir --color=auto'
# PS1='[\u@\h \W]\$ ' --overwritten for git branch

# custom
alias fzfp='fzf --preview="bat --color=always --style=numbers {}" \
            --bind ctrl-l:preview-page-down,ctrl-h:preview-page-up'
alias fzfn='fzfp | xargs nvim'

function mkcdir {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

function mp3extract {
    ffmpeg -i "$1" -vn -ar 44100 -ac 2 -b:a 192k "${2:-output.mp3}"
}

# xargs -a test -I {} firefox -new-tab {}
function url {
     cat url | xargs firefox -new-tab
}

function api {
    curl "$1" | jq | bat -l json
}
# startup greeting (find better solution)
declare -a cowsays_creatures=("cower" "stegosaurus" "dragon" "alpaca" "daemon"
                                "default" "fox" "ghostbusters" "kitty" "llama"
                                "moose" "surgery" "sus" "turkey" "turtle" "tux"
                                "armadillo" "kitten" "bishop" "owl"
                                "robot" "toaster" "armadillo" "knight"
                                "sudowoodo" "R2-D2" "clippy" "queen" "cat"
                                "ghost" "happy-whale" "seahorse-big" "whale"
                                "pod" "mule" "tortoise" "fat-cow" "fox" "wizard"
                                "cube" "pawn" "king" "tux-big" "octopus"
                                "jellyfish" "fox-winking" "nyan" "atat"
                                "llama2" "dolphin" "chessmen" "bill-the-cat"
                                "lobster" "giving-bunny" "rook"
                                "robotfindskitten" "cake-with-candles" "banana"
                                "elephant2" "smiling-octopus")
RANDOM=$$$(date +%s)
function forsay {
    fortune -s -n 200 | cowsay -f ${cowsays_creatures[ $RANDOM % ${#cowsays_creatures[@]} ]}
}
forsay
function cowtune {
    forsay
}

# git
# search repos and cd into it

cdgitrepo() {
  local repo
  repo=$(find "$HOME/dev" -maxdepth 5 -type d -name ".git" | xargs -I{} dirname {} | sort -u | fzf --preview 'tree -C --gitignore {} | head -50')
  if [ -n "$repo" ]; then
    cd "$repo"
  fi
}

# git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# \e[91m\$(parse_git_branch)\[\e[00m\]\$
# PS1="[\u@\h \W]\e[91m\$(parse_git_branch)\[\e[00m\]\$ "
red=$(tput setaf 1)
reset=$(tput sgr0)
branch="\[$red\]\$(parse_git_branch)\[$reset\]"
PS1="\n[\u@\h \W]$branch\$ "

eval "$(tmuxifier init -)"


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# set editor
export EDITOR=nvim

export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH=$HOME/.dotnet/tools:$PATH

source /home/koopa/.config/broot/launcher/bash/br

. "$HOME/.local/bin/env"
