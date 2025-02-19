
# user
alias apt="sudo apt -y"
alias flatpak="sudo flatpak -y"
alias openconnect="sudo openconnect -b --user <username>"

[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && \
  source "$EAT_SHELL_INTEGRATION_DIR/bash"