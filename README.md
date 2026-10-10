# dotfiles

Personal Bash, Git, Neovim, tmux and Ruby settings for Debian/Ubuntu.

## Setup

```sh
git clone https://github.com/Slike9/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./scripts/setup
```

Setup installs mise if needed, creates explicitly listed links, and uses mise
to install system dependencies through apt and tools from the global config.
It requires mise with `bootstrap packages` support and sudo access for apt when
run as a regular user. Update older mise installations before running setup.
If mise is not installed, curl and CA certificates must already be available
to download it. Open a new Bash session after setup.

To apply only config links and the Bash extension, without installing mise,
system packages or tools:

```sh
./scripts/setup --configs-only
```

This mode requires neither apt nor mise. It still requires an existing `.bashrc`
and follows the same rules for conflicting paths.

Correct links are kept, including relative links. Existing files, directories
and conflicting links are skipped and listed at the end; nothing is overwritten.
If `~/.config/mise/config.toml` already exists, move it to a backup before setup
to enable the versioned config. System package and tool installation is skipped
until that link is in place.

## Layout

Versioned configs and shell extensions live in `config/`, grouped by tool.
Setup is in `scripts/`; executable helpers are in `bin/`.

## Packages

`config/mise/config.toml` is linked to `~/.config/mise/config.toml`. It contains CLI tools,
Ruby, Node, Go, tinygo, golangci-lint, direnv, kubectl and global mise settings. Most tools use
`latest`; Ruby and Node keep explicit versions. Run `mise upgrade` to update tools.

Git, curl, CA certificates, Universal Ctags, xsel and Bash completion are declared
in `[bootstrap.packages]` in the same config. Setup runs
`mise bootstrap packages apply --manager apt --yes` before `mise install`.
The bootstrap step installs missing system packages; `mise install` installs
the versioned tools. To preview system package changes, run:

```sh
mise -C "$HOME" bootstrap packages apply --manager apt --dry-run
```

## Bash

Your existing `~/.bashrc` is preserved. Setup appends a guarded `source` for
`config/bash/extension.bash` once. If `.bashrc` is missing, setup exits with an error
before installing packages or creating links.
An existing `.bashrc` symlink is skipped; convert it to a regular file before setup.

The extension configures the prompt, PATH, aliases and mise, and explicitly loads
the Bash helpers and fzf integration. It does not search for files to source.
The `bin/` directory is added to PATH. Bash completion is enabled for mise,
Git and kubectl (including the `k` alias) when the corresponding tools are available.

direnv and kubectl are installed through mise. The direnv hook remains enabled
for projects that use `.envrc`; mise manages tool versions and can manage project
environment variables through `mise.toml`. Keep each variable in one place to
avoid competing definitions. No `mise direnv` integration is configured.

If Linuxbrew is installed at `/home/linuxbrew/.linuxbrew`, its shell environment
is loaded before mise activation so mise tools take priority.

Keep machine-specific settings in `local/local.bash`. This optional file is
loaded after mise activation and before fzf integration. The `local/` directory
is ignored by Git. Do not activate mise again there.

To add another config link or shell extension, edit the explicit calls in
`scripts/setup` or `config/bash/extension.bash`.
