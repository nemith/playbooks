# Color diff if you got it
if [ -x "$(whiff colordiff)" ]; then
	alias diff='colordiff'
fi

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# enable color
alias ip='ip -c'  
alias ls='ls --color -F'

