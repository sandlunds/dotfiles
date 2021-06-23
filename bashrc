# Large history, append after each command
HISTFILESIZE=400000000
HISTSIZE=10000
PROMPT_COMMAND="history -a"
shopt -s histappend

alias vim=nvim
export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

REPO_DIR=$HOME
gg() {
    local dir="`fd --hidden --glob .git $REPO_DIR -x echo {//} | fzf`"
    if [ ! -z "$dir" ]
    then
        cd "$dir"
    fi
}

gd() {
    local git_root=`git rev-parse --show-toplevel`
    local dir="`fd --base-directory \"$git_root\" --type d $1 | fzf`"
    if [ ! -z "$dir" ]
    then
        cd "$git_root/$dir"
    fi
}

gf() {
    local git_root=`git rev-parse --show-toplevel`
    local file="`fd --base-directory \"$git_root\" --type f $1 | fzf`"
    if [ ! -z "$file" ]
    then
        vim "$git_root/$file"
    fi
}

gu() {
    local git_root=`git rev-parse --show-toplevel`
    cd "$git_root"
}

# xdotool is used to "prime" the prompt so you can edit the command before executing it...
hh() {
    history | fzf -e +s --tac | sed -re 's/^\s*[0-9]+\s*//' | tr -d '\n' | (xdotool type --file - &)
}

vide() {
    neovide --geometry=120x50 $1 >/dev/null 2>&1 & disown
}

eval "$(starship init bash)"

export PATH=~/bin:~/neovim/bin:${PATH}:~/idea/idea-IU-203.7717.56/bin
export XMODIFIERS=@im=fcitx
