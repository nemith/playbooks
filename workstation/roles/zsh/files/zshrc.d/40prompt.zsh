[[ $TERM_PROGRAM == "Apple_Terminal" || $TERM == "linux" ]] && return


if [ -x $(whiff oh-my-posh) ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/omp/config.toml)"
  return
fi

if [ -x $(whiff powerline-go) ]; then
  function powerline_precmd() {
      PLGO="$(which powerline-go)"
      PS1="$($PLGO -error $? -shell zsh)"
  }

  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
  return
fi

echo "please install oh-my-posh or powerline-go"