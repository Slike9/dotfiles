# dotfiles

Personal Bash, Git, Neovim, tmux and Ruby settings for Debian/Ubuntu.

## Setup

```sh
git clone https://github.com/Slike9/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/setup
```

Setup installs system dependencies with apt, installs mise if needed, creates
explicitly listed links, and installs tools from the global mise config.
It requires sudo access for apt when run as a regular user. Open a new Bash
session after setup.

Correct links are kept, including relative links. Existing files, directories
and conflicting links are skipped and listed at the end; nothing is overwritten.
If `~/.config/mise/config.toml` already exists, move it to a backup before setup
to enable the versioned config. Tool installation is skipped until that link
is in place.

## Layout

Versioned configs and shell extensions live in `config/`, grouped by tool.
Setup is in `scripts/`; executable helpers are in `bin/`.

## Packages

`config/mise/config.toml` is linked to `~/.config/mise/config.toml`. It contains CLI tools,
Ruby, Node, Go, tinygo, golangci-lint and global mise settings. Most tools use
`latest`; Ruby and Node keep explicit versions. Run `mise upgrade` to update tools.

Git, curl, CA certificates, Universal Ctags, xsel and Bash completion are installed
through apt. The system dependency list is explicit in `scripts/setup`.

## Bash

Your existing `~/.bashrc` is preserved. Setup appends a guarded `source` for
`config/bash/extension.bash` once. If `.bashrc` is missing, setup exits with an error
before installing packages or creating links.
An existing `.bashrc` symlink is skipped; convert it to a regular file before setup.

The extension configures the prompt, PATH, aliases and mise, and explicitly loads
the Bash helpers and fzf integration. It does not search for files to source.
The `bin/` directory is added to PATH.

If Linuxbrew is installed at `/home/linuxbrew/.linuxbrew`, its shell environment
is loaded before mise activation so mise tools take priority.

Keep machine-specific settings in `local/local.bash`. This optional file is
loaded after mise activation and before fzf integration. The `local/` directory
is ignored by Git. Do not activate mise again there.

To add another config link or shell extension, edit the explicit calls in
`scripts/setup` or `config/bash/extension.bash`.
