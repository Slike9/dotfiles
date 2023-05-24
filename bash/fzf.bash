source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/bash-completion/completions/fzf

if command -v fdfind >/dev/null; then
  export FZF_DEFAULT_COMMAND='fdfind --type f'
fi

# From https://stackoverflow.com/questions/36513310/how-to-get-a-gits-branch-with-fuzzy-finder.

__my_is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

__my_fzf_git_status_files() {
  __my_is_in_git_repo &&
    git -c color.status=always status --short |
    fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

__my_fzf_git_branches() {
  __my_is_in_git_repo &&
    git branch -vv --color=always --sort=committerdate | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

__my_fzf_git_tags() {
  __my_is_in_git_repo &&
    git tag --sort -version:refname |
    fzf --height 40% --multi
}

__my_fzf_git_hashes() {
  __my_is_in_git_repo &&
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
    fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

__my_fzf_git_remotes() {
  __my_is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf --height 40% --tac | awk '{print $1}'
}

bind '"\er": redraw-current-line'
# shellcheck disable=SC2016
bind '"\C-g\C-m": "$(__my_fzf_git_status_files)\e\C-e\er"'
# shellcheck disable=SC2016
bind '"\C-g\C-b": "$(__my_fzf_git_branches)\e\C-e\er"'
# shellcheck disable=SC2016
bind '"\C-g\C-t": "$(__my_fzf_git_branches)\e\C-e\er"'
# shellcheck disable=SC2016
bind '"\C-g\C-h": "$(__my_fzf_git_hashes)\e\C-e\er"'
# shellcheck disable=SC2016
bind '"\C-g\C-r": "$(__my_fzf_git_remotes)\e\C-e\er"'
