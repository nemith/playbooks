alias vps="mosh coachz.brbe.net -- tmux attach -d"

# Color diff if you got it
if [ -x "$(whiff colordiff)" ]; then
	alias diff='colordiff'
fi

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'