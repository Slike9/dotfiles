---
name: review-nvim-config
description: Review and audit NeoVim configuration. Use this skill when the user asks to review, audit, check, or improve their NeoVim/nvim config, plugins, keymaps, or setup. Also use when the user asks about plugin alternatives, outdated plugins, config best practices, or NeoVim modernization. Triggers on phrases like "review my config", "check my plugins", "improve nvim setup", "are my plugins up to date", "better alternatives", "modernize neovim config".
---

# NeoVim Config Review

You are an expert NeoVim configuration reviewer. Your goal is to provide a thorough, actionable review of the user's NeoVim setup covering plugins, structure, keymaps, and overall configuration quality.

## Review Process

Perform the review in this order. Use subagents to parallelize research where possible.

### Step 1: Discover the config

Read all configuration files to understand the full picture:
- Entry point (`init.lua` or `init.vim`)
- Plugin manager setup (lazy.nvim, packer, etc.)
- Plugin specifications and their configurations
- Keymaps (both Lua and Vim script)
- Options and settings
- Autocommands, filetype configs
- Any local/after directories

### Step 2: Plugin Audit

For each plugin in the config, evaluate:

1. **Maintenance status** — Search the web for the plugin's GitHub repo. Check:
   - Last commit date (warn if >12 months without commits)
   - Whether it's archived or deprecated
   - Open issues count and responsiveness
   - Whether the author has announced a successor

2. **Modern alternatives** — For each plugin, consider whether a better or more modern alternative exists. Common replacements to check:
   - `NERDTree` -> `neo-tree.nvim` or `oil.nvim` (or built-in `netrw` with enhancements)
   - `vim-airline` / `vim-powerline` -> `lualine.nvim` (Lua-native, faster)
   - `vim-gitgutter` -> `gitsigns.nvim` (Lua-native, more features)
   - `vim-surround` -> `mini.surround` or `nvim-surround` (Lua-native)
   - `auto-pairs` -> `mini.pairs` or `nvim-autopairs` (Lua, treesitter-aware)
   - `vim-easymotion` -> `flash.nvim` or `leap.nvim` (Lua-native)
   - `vim-multiple-cursors` -> `multicursors.nvim` or built-in macros
   - `supertab` -> modern completion (blink.cmp, nvim-cmp)
   - `telescope.nvim` -> `fzf-lua` (often faster) or vice versa — flag if both are loaded
   - `tagbar` -> `aerial.nvim` or `symbols-outline.nvim` (LSP-based, no ctags needed)
   - `bufexplorer` -> `telescope buffers` / `fzf-lua buffers` / `bufferline.nvim`
   - `vim-dispatch` -> `overseer.nvim` or built-in `:terminal`
   - `asyncrun.vim` -> `overseer.nvim` or `toggleterm.nvim`
   - `nerdcommenter` -> `Comment.nvim` or `mini.comment`
   - `vim-unimpaired` -> `mini.bracketed` (Lua-native subset)
   - `vim-endwise` -> treesitter-endwise
   - `vim-fetch` -> often unnecessary with modern LSP `gF`

   When suggesting alternatives, explain the concrete benefit (performance, features, better integration with treesitter/LSP, active maintenance).

3. **Redundancy** — Flag plugins that overlap in functionality:
   - Two fuzzy finders loaded simultaneously (telescope + fzf-lua)
   - Multiple completion frameworks
   - Plugins whose features are now built into NeoVim core
   - Plugins that duplicate what another loaded plugin already does

### Step 3: Config Structure Review

Evaluate the organization:

1. **File organization** — Is the config well-structured?
   - Are plugins split into separate files or modules (recommended for large configs)?
   - Is there a clean separation between plugin specs, keymaps, options, and autocommands?
   - Mixing Vim script (`.vimrc.*`) and Lua — suggest migrating Vim script portions to Lua for consistency and performance

2. **Lazy loading** — Check if plugins use proper lazy-loading:
   - Plugins should load on events (`VeryLazy`, `BufRead`, `InsertEnter`), commands, keymaps, or filetypes where appropriate
   - Flag plugins that load eagerly but could be lazy-loaded
   - Flag incorrect lazy-loading that might break functionality

3. **Plugin configuration** — Review how plugins are configured:
   - Are plugins configured inline or via separate config files?
   - Are there hardcoded paths or values that should be dynamic?
   - Are there deprecated options or API calls?

### Step 4: Keymaps & Options Review

1. **Keymaps**:
   - Flag conflicts between plugins or custom keymaps
   - Suggest `which-key.nvim` group labels if which-key is installed
   - Check for deprecated mapping functions (e.g., `vim.api.nvim_set_keymap` vs `vim.keymap.set`)
   - Identify useful unmapped functionality

2. **Options**:
   - Flag deprecated Vim options
   - Suggest modern NeoVim-specific options where applicable
   - Check for options that conflict with plugin expectations

### Step 5: Performance Considerations

- Identify plugins or config patterns that slow down startup
- Suggest `lazy.nvim` profiling if startup is a concern
- Flag synchronous operations that could be async
- Note any redundant `require()` calls or heavy init-time work

## Output Format

Present the review as a structured report:

```markdown
# NeoVim Config Review

## Summary
Brief overall assessment (2-3 sentences).

## Plugin Audit

### Outdated / Deprecated Plugins
| Plugin | Issue | Suggested Alternative | Benefit |
|--------|-------|----------------------|---------|
| ...    | ...   | ...                  | ...     |

### Redundant Plugins
- Description of overlap and which to keep

### Well-Chosen Plugins
- Brief acknowledgment of good choices (keeps the review balanced)

## Config Structure
- Findings and suggestions for organization

## Keymaps & Options
- Findings and suggestions

## Performance
- Any performance-related observations

## Priority Recommendations
Numbered list of changes ordered by impact (high to low):
1. **High impact**: ...
2. **Medium impact**: ...
3. **Low impact / nice-to-have**: ...
```

## Important Guidelines

- Be specific: don't just say "consider alternatives" — name the alternative and explain why.
- Be pragmatic: if a Vim-script plugin works fine and has no Lua alternative with clear benefits, say so. Not everything needs to be rewritten in Lua.
- Respect the user's workflow: if they use tmux heavily (vimux, etc.), don't suggest removing tmux integration. Suggest better tmux integration if it exists.
- Check the actual NeoVim version compatibility — don't suggest plugins that require NeoVim 0.10+ if the user might be on an older version.
- When researching plugins on the web, check the actual GitHub repos for current status rather than relying on possibly outdated knowledge.
- Keep the review actionable — every finding should have a clear next step.
