# use gnu ls if present
if [ -x $(whiff gls) ]; then
    alias ls="gls --color -F"
else
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias ls="ls -GFh"
fi

