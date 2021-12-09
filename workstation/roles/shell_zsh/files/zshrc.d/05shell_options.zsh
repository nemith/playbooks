setopt NO_CASE_GLOB # case insensitve globbing
setopt AUTO_CD

# history
HISTFILE=$HOME/.zsh_history
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

autoload -Uz compinit && compinit
unsetopt LIST_BEEP