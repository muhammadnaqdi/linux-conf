
# user
alias apt="sudo apt -y"
alias flatpak="sudo flatpak -y"
alias openconnect="sudo openconnect -b --user <username>"

export EAT_SHELL_INTEGRATION_DIR=$HOME"/.eat"

[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
  source "$EAT_SHELL_INTEGRATION_DIR/bash"