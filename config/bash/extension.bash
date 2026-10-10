# Personal settings loaded by ~/.bashrc.
case $- in
  *i*) ;;
  *) return ;;
esac

if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi
dotfiles_brew_prefix=
if command -v brew >/dev/null; then
  dotfiles_brew_prefix=$(brew --prefix)
fi

if [[ -f "$HOME/.cargo/env" ]]; then
  # shellcheck disable=SC1091
  source "$HOME/.cargo/env"
fi

if [[ -d "${KREW_ROOT:-$HOME/.krew}/bin" ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

dotfiles_root=$HOME/.dotfiles
export PATH="$HOME/.local/bin:$dotfiles_root/bin:$PATH"
export EDITOR=nvim
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
debian_chroot=${debian_chroot:-}

if ! declare -F __git_ps1 >/dev/null; then
  if [[ -n "$dotfiles_brew_prefix" && -f "$dotfiles_brew_prefix/etc/bash_completion.d/git-prompt.sh" ]]; then
    # shellcheck disable=SC1091
    source "$dotfiles_brew_prefix/etc/bash_completion.d/git-prompt.sh"
  elif [[ -f /usr/lib/git-core/git-sh-prompt ]]; then
    source /usr/lib/git-core/git-sh-prompt
  else
    __git_ps1() { :; }
  fi
fi

if [[ -x /usr/bin/tput ]] && tput setaf 1 >/dev/null 2>&1; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h: \[\033[01;34m\]\W\[\e[01;36m\]$(__git_ps1 " (%s)") \[\e[00;32m\][\t] \[\e[00m\]\n \[\e[01m\]\$\[\e[00m\] '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 "[%s]")\$ '
fi
case "$TERM" in
  xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;;
esac

if command -v mise >/dev/null; then
  eval "$(mise activate bash)"
fi

# shellcheck source=config/bash/bash_aliases.symlink
source "$dotfiles_root/config/bash/bash_aliases.symlink"

# shellcheck source=config/workato/workato.bash
source "$dotfiles_root/config/workato/workato.bash"

if [[ -f "$dotfiles_root/local/local.bash" ]]; then
  # shellcheck disable=SC1091
  source "$dotfiles_root/local/local.bash"
fi

if command -v direnv >/dev/null; then
  eval "$(direnv hook bash)"
fi

# shellcheck source=config/bash/completion.bash
source "$dotfiles_root/config/bash/completion.bash"

if command -v fzf >/dev/null; then
  # shellcheck source=config/fzf/completion.bash
  source "$dotfiles_root/config/fzf/completion.bash"
fi
