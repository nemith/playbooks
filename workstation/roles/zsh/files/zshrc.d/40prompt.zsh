function powerline_precmd() {
    PLGO="$(which powerline-go)"
    PS1="$($PLGO -error $? -shell zsh)"
}

function pmton() {
  [[ ${precmd_functions[(ie)powerline_precmd]} -le ${#precmd_functions} ]] && return 
  precmd_functions+=(powerline_precmd)
}

function pmtoff() {
  precmd_functions=("${(@)precmd_functions:#powerline_precmd}")
  PS1="%# "
}

if [ "$TERM" != "linux" ]; then
    pmton
fi