# use vscode if it exists 
[[ -x "$(whiff code)" ]] && EDITOR="code"

if [[ -x "$(whiff nvim)" ]]; then
  EDITOR="${EDITOR:-nvim}"
  alias vi='nvim'
  alias vim='nvim'
else
  EDITOR="${EDITOR:-vim}"
  alias vi='vim'
fi

export EDITOR