export CLICOLOR=1

_dir_chomp () {
    local p=${1/#$HOME/\~} b s
    s=${#p}
    while [[ $p != "${p//\/}" ]]&&(($s>$2))
    do
        p=${p#/}
        [[ $p =~ \.?. ]]
        b=$b/${BASH_REMATCH[0]}
        p=${p#*/}
        ((s=${#b}+${#p}))
    done
    echo ${b/\/~/\~}${b+/}$p | sed "s|^/~|~|"
}

export PS1='\[\033[01;32m\]$(
  _dir_chomp "$(pwd)" 20
)\[\033[01;34m\] \$\[\033[00m\] '

alias ll='ls -l'
alias la='ls -la'

alias edit='emacsclient -n '
