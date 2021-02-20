if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"

  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi