exit_handler() {
  for i in $FAILED_COMMANDS
    do
        hist d $i
    done
  FAILED_COMMANDS=()
}

save-failed-command() {
	local last_exit_code=$?

	if [ "$last_exit_code" -ne "0" ] && [ "$last_exit_code" -ne "130" ]; then
    # FAILED_COMMANDS="$1\n$FAILED_COMMANDS"
    # FAILED_COMMANDS+="$(history | tail -1l | xargs | cut -d " " -f2-)"
    FAILED_COMMANDS+="$(history | tail -1l | sed 's/^[ \t]*//' | awk -F '  ' '{$1=$2=""; print $0}' | sed 's/^[ \t]*//;s/[ \t]*$//')"
    # FAILED_COMMANDS+="$(history | tail -1l | sed 's/^[ \t]*//' | awk -F '  ' '{$1=$2=""; print $0}' | xargs)"
	fi
}

FAILED_COMMANDS=()
# autoload -Uz add-zsh-hook
precmd_functions+=(save-failed-command)
zshexit_functions+=(exit_handler)
# add-zsh-hook precmd save-failed-command
# add-zsh-hook zshexit exit_handler
