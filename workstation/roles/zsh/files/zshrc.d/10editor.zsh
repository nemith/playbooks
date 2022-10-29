if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  export EDITOR="code -w"
  alias vi="code -w"
  return
fi

# use vscode if it exists 
if [[ -x "$(whiff nvim)" ]]; then
  EDITOR="${EDITOR:-nvim}"
  alias vi='nvim'
  alias vim='nvim'
else
  EDITOR="${EDITOR:-vim}"
  alias vi='vim'
fi

export EDITOR