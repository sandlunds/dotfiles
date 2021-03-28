HISTFILESIZE=400000000
HISTSIZE=10000
PROMPT_COMMAND="history -a"
shopt -s histappend

alias vim=nvim
export EDITOR=nvim

REPO_DIR=$HOME/bitbucket
gg() {
    local dir="`fd --hidden --glob --type d .git $REPO_DIR -x echo {//} | fzf`"
    if [ ! -z "$dir" ]
    then
        cd $dir
    fi
}

gd() {
    local dir="`fd --type d $1 | fzf`"
    if [ ! -z "$dir" ]
    then
        cd $dir
    fi
}

gf() {
    local file="`fd --type f $1 | fzf`"
    if [ ! -z "$file" ]
    then
        vim $file
    fi
}

# xdotool is used to "prime" the prompt so you can edit the command before executing it...
hh() {
    history | fzf -e +s --tac | sed -re 's/^\s*[0-9]+\s*//' | tr -d '\n' | (xdotool type --file - &)
}

vide() {
    neovide --geometry=120x50 $1 >/dev/null 2>&1 & disown
}
