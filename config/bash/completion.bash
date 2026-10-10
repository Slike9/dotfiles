if command -v kubectl >/dev/null; then
  # shellcheck disable=SC1090
  source <(kubectl completion bash)
  complete -o default -F __start_kubectl k
fi

if [[ -f /usr/share/bash-completion/completions/git ]]; then
  source /usr/share/bash-completion/completions/git
fi
if declare -F __git_complete >/dev/null; then
  __git_complete g _git_main
fi
