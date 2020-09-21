# PATH munging tools
append_path() { NEW=${1/%\//}; [[ -d $NEW ]] || return; remove_path $NEW; export PATH="$PATH:$NEW"; }
prepend_path() { NEW=${1/%\//}; [[ -d $NEW ]] || return; remove_path $NEW; export PATH="$NEW:$PATH"; }
remove_path() {
    # New format not supported by some old versions of awk
    # PATH=`echo -n "$PATH" | awk -v RS=: -v ORS=: '$0 != "'$1'"'`
    PATH=`echo -n "$PATH" | awk  'BEGIN { RS=":"; ORS=":" } $0 != "'$1'" '`
    export PATH=${PATH/%:/}
}

# Colors
function color()   { echo -ne "\[\033[38;5;$1m\]"; }
function bold()    { echo -ne "\[\033[1m\]"; }
function nocolor() { echo -ne "\[\033[0m\]"; }

# whiff is like which but returns the first match
whiff() {
  while (($#)); do
    result=$(which $1 2>/dev/null)
    if [ $? -eq 0 ]; then
      echo $result
    fi
    shift
  done
}