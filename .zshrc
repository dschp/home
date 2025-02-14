[ -f $HOME/.aliasrc ] && source $HOME/.aliasrc
[ -f $HOME/.aliasrc.local ] && source $HOME/.aliasrc.local

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' gain-privileges 1

WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
stty -ixon

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_expire_dups_first
HISTFILE=$HOME/.zhistory
SAVEHIST=5000
HISTSIZE=5000

bindkey -e

bindkey '^P'   history-beginning-search-backward
bindkey '^N'   history-beginning-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^R'   history-incremental-search-backward
bindkey '^S'   history-incremental-search-forward

zmodload -i zsh/complist
bindkey -M menuselect "^H" backward-char
bindkey -M menuselect "^I" complete-word
bindkey -M menuselect "^J" down-history
bindkey -M menuselect "^K" up-history
bindkey -M menuselect "^L" forward-char

PROMPT='%F{green}>%f '
RPROMPT=''

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
