typeset -U PATH path
path=(~/.bin ~/go/bin ~/zig ~/.cabal/bin ~/.ghcup/bin ~/.cargo/bin "$path[@]")
export PATH

export TERM=xterm-256color
export EDITOR=vim

export COLORTERM=truecolor
export KEYTIMEOUT=1

