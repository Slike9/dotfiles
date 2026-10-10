if [[ -n "${dotfiles_brew_prefix:-}" && -f "$dotfiles_brew_prefix/etc/profile.d/bash_completion.sh" ]]; then
  # shellcheck disable=SC1091
  source "$dotfiles_brew_prefix/etc/profile.d/bash_completion.sh"
elif [[ -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

if command -v mise >/dev/null; then
  # shellcheck disable=SC1090
  source <(mise completion bash)
fi

if command -v kubectl >/dev/null; then
  # shellcheck disable=SC1090
  source <(kubectl completion bash)
  complete -o default -F __start_kubectl k
fi

if command -v docker >/dev/null; then
  # shellcheck disable=SC1090
  source <(docker completion bash)
  complete -o default -F __start_docker d
fi

if [[ -n "${dotfiles_brew_prefix:-}" && -f "$dotfiles_brew_prefix/etc/bash_completion.d/git-completion.bash" ]]; then
  # shellcheck disable=SC1091
  source "$dotfiles_brew_prefix/etc/bash_completion.d/git-completion.bash"
elif [[ -f /usr/share/bash-completion/completions/git ]]; then
  source /usr/share/bash-completion/completions/git
fi
if declare -F __git_complete >/dev/null; then
  __git_complete g _git_main
fi
