function powerline_precmd() {
    PLGO="$(which powerline-go)"
    PS1="$($PLGO -error $? -shell zsh)"
}

function pmton() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

function pmtoff() {
  precmd_functions=("${(@)precmd_functions:#powerline_precmd}")
  PS1="%# "
}

if [ "$TERM" != "linux" ]; then
    pmton
fi