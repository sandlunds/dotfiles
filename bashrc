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

vide() {
    neovide --geometry=120x50 $1 >/dev/null 2>&1 & disown
}
