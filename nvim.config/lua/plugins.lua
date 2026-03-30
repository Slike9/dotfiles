return {
  -- Color schemes
  "altercation/vim-colors-solarized",
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          -- terminal_colors = false,
          dim_inactive = true,
        },
        groups = {
          github_light = {
            Comment = { fg = "#8b949e" },
            ["@comment"] = { fg = "#8b949e" },
          },
        },
      })
      vim.cmd('colorscheme github_light')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua",
        "ruby",
        "vim",
        "vimdoc",
      },
      -- highlight = { enable = true, },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config =  {
      sections = {
        lualine_b = { 'branch' },
        lualine_c = {
          'diff', 'diagnostics', 'filename',
          -- { "navic", color_correction = nil, navic_opts = nil },
        },
        lualine_x = { "lsp_status", 'encoding', 'fileformat', { 'filetype', icon_only = true } },
        lualine_z = { 'location', { "vim.fn.line('$')", icon = "" } },
      },
      winbar = {
        lualine_c = {
          { "navic", color_correction = nil, navic_opts = nil },
        }
      }
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = {},
  },

  "nvim-lua/plenary.nvim",

  -- 'jiangmiao/auto-pairs',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
    config = function()
      require('nvim-autopairs').setup({})

      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      npairs.add_rules({
        Rule(' ', ' '):with_pair(
          function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return pair == '()' or pair == '{}' or pair == '[]'
          end
        ),
        Rule("|", "|", "ruby"):with_move()
      })
    end,
  },

  'tpope/vim-abolish',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-eunuch',
  'tpope/vim-unimpaired',

  { "RRethy/nvim-treesitter-endwise", lazy = false },

  'mg979/vim-visual-multi',

  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_ruby_curly_braces = 0
      vim.g.splitjoin_ruby_hanging_args = 0
      vim.g.splitjoin_ruby_options_as_arguments = 1
    end,
  },
  {
    'scrooloose/nerdtree',
    keys = {
      { '<F2>', '<cmd>NERDTreeToggle<CR>', { silent = true } },
      { '<M-F1>', '<cmd>NERDTreeFind<CR>', { silent = true } },
      { '<leader>tf', '<cmd>NERDTreeFind<CR>', { silent = true } },
    }
  },
  'tpope/vim-projectionist',
  "wsdjeg/vim-fetch", -- Open a file in a given line.

  {
    'benmills/vimux',
    config = function()
      vim.g.VimuxRunnerType = 'pane'
    end,
    keys = {
      { "<Leader>rp", "<cmd>VimuxPromptCommand<CR>", desc = "Prompt for a command to run", mode = "n" },
      { "<Leader>rl", "<cmd>VimuxRunLastCommand<CR>", desc = "Run last command executed by VimuxRunCommand", mode = "n" },
      { "<Leader>ri", "<cmd>VimuxInspectRunner<CR>", desc = "Inspect runner pane", mode = "n" },
      { "<Leader>rq", "<cmd>VimuxCloseRunner<CR>", desc = "Close vim tmux runner opened by VimuxRunCommand", mode = "n" },
      { "<Leader>rx", "<cmd>VimuxInterruptRunner<CR>", desc = "Interrupt any command running in the runner pane", mode = "n" },
      { "<Leader>rz", "<cmd>call VimuxZoomRunner()<CR>", desc = "Zoom the runner pane (use <bind-key> z to restore runner pane)", mode = "n" },
    }
  },

  {
    'skywind3000/asyncrun.vim',
    cmd = { "AsyncRun", "AsyncStop" },
    keys = {
      {
        "<LocalLeader>c",
        function()
          vim.cmd"AsyncRun bundle exec srb tc --no-error-sections 2>&1 | grep -E '^[^[:space:]]'"
          vim.cmd"copen"
          vim.cmd"wincmd p"
        end,
        mode = "n"
      }
    }
  },

  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      fzf_opts = {
        ["--layout"] = "default",
      },
    },
    cmd = "FzfLua",
    keys = {
      { "<C-p>", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
      { "<Leader>ff", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
      { "<Leader>fs", function() require("fzf-lua").lsp_document_symbols() end, mode = "n", desc = "FzfLua lsp_document_symbols" },
      { "<Leader>fc", function() require("fzf-lua").files{ cwd = vim.fn.stdpath("config") } end, mode = "n", desc = "Find config files" },
      { "<C-b>", function() require("fzf-lua").buffers{winopts = {preview = {hidden = true}}} end, mode = "n", desc = "Find buffers" },
      { "<Leader>fb", function() require("fzf-lua").buffers() end, mode = "n", desc = "Find buffers" },
      { "<Leader>.", function() require("fzf-lua").tags() end, mode = "n", desc = "Find tags" },
      { "<Leader>ft", function() require("fzf-lua").tags() end, mode = "n", desc = "Find tags" },
      { "<Leader>gs", function() require("fzf-lua").git_status() end, mode = "n", desc = "Git status" },
    },
  },

  {
    'echasnovski/mini.misc',
    version = '*',
    keys = {
      { "<leader>Z", function() require("mini.misc").zoom() end, desc = "Toggle Zoom" },
    }
  },

  -- Git
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    cmd = { "Git", "G" },
    keys = {
      { "<leader>go", ":GBrowse<cr>", desc = "Git browse", mode = { "n", "v" } },
      { "<leader>gb", ":Git blame<CR>", desc = "Git blame"},
      -- { "<leader>gd", ":Gdiff<CR>", desc = "Gdiff"},
      { "<leader>gl", ":Glog<CR>", desc = "Glog"},
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit"},
      { "<leader>gp", ":Git push<CR>", desc = "Git push"},
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    config = {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = 'Next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = 'Prev hunk' })

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage/unstage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = "Stage/unstage hunk" })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'Reset hunk' })

        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "Stage/unstage buffer" })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, { desc = "gitsigns.blame_line" })

        map('n', '<leader>hd', gitsigns.diffthis, { desc = "gitsigns.diffthis" })

        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end, { desc = 'gitsigns.diffthis("~")' })

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'gitsigns.setqflist("all")' })
        map('n', '<leader>hq', gitsigns.setqflist, { desc = 'gitsigns.setqflist' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'gitsigns.toggle_current_line_blame' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'gitsigns.toggle_word_diff' })

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk)
      end,
    },
  },

  -- Linter
  -- {
  --   'mfussenegger/nvim-lint',
  --   event = { "BufWritePost", "BufReadPost" },
  --   config = function()
  --     require('lint').linters_by_ft = { ruby = {'rubocop'} }
  --     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --       callback = function() require("lint").try_lint() end,
  --     })
  --   end,
  -- },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")

      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = false,
      })

      require("luasnip.loaders.from_vscode").lazy_load()

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.keycode("<Tab>"), "n", true)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          vim.api.nvim_feedkeys(vim.keycode("<S-Tab>"), "n", true)
        end
      end, { silent = true })
    end
  },

  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'default',

        ['<C-k>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-j>'] = { 'select_next', 'fallback_to_mappings' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        menu = {
          -- Don't automatically show the completion menu
          auto_show = false,
        },
        documentation = { auto_show = false },
        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },

      snippets = { preset = 'luasnip' },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- signature = {
      --   enabled = true,
      --   -- window = { show_documentation = false }, -- только сигнатура без документации
      -- },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" }
  },

  -- Ruby
  {
    "janko-m/vim-test",
    dependencies = { "benmills/vimux" },
    config = function()
      vim.g["test#strategy"] = 'vimux'
    end,
    keys = {
      { "<LocalLeader>tn", "<cmd>TestNearest<CR>", mode = "n" },
      { "<LocalLeader>tf", "<cmd>TestFile<CR>", mode = "n" },
      { "<LocalLeader>ta", "<cmd>TestSuite<CR>", mode = "n" },
      { "<LocalLeader>tl", "<cmd>TestLast<CR>", mode = "n" },
      { "<LocalLeader>tv", "<cmd>TestVisit<CR>", mode = "n" },
    }
  },
  -- 'thoughtbot/vim-rspec',
  'tpope/vim-bundler',
  'tpope/vim-rails',
  'tpope/vim-rake',
  'vim-ruby/vim-ruby',
  "SmiteshP/nvim-navic",

  { "mason-org/mason.nvim", opts = {} },

  -- LSP
  {
    "mason-org/mason-lspconfig.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = { "lua_ls", "copilot" },
      automatic_enable = true,
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "SmiteshP/nvim-navic",
    },
    opts = {
      servers = {
        ruby_lsp = {
          init_options = {
            enabledFeatures = {
              formatter = "auto",
              -- semanticHighlighting = false,
              -- signatureHelp = true,
            },
          },
        },
        -- rubocop = {},
        sorbet = {
          on_attach = false,
        },
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              diagnostics = { globals = { "vim" } },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local function on_attach(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end
      for server, config in pairs(opts.servers) do
        config.capabilities = capabilities
        if config.on_attach == false then
          config.on_attach = nil
        else
          config.on_attach = on_attach
        end
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      search = {
        -- search/jump in all windows
        multi_window = false,
      },
      jump = {
        -- automatically jump when there is only one match
        autojump = true,
      },
      label = {
        reuse = "all",
      },
      modes = {
        char = {
          enabled = true,
          -- hide after jump when not using jump labels
          autohide = false,
          -- show jump labels
          jump_labels = true,
          -- set to `false` to use the current line only
          multi_line = false,
          jump = {
            -- when using jump labels, set to 'true' to automatically jump
            -- or execute a motion when there is only one match
            autojump = true,
          },
        },
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)

      local function set_flash_highlights()
        local hl = vim.api.nvim_set_hl

        -- Яркие метки без фона, как у EasyMotion
        hl(0, "FlashLabel", {
          fg = "#d73a49",
          bg = "NONE",
          bold = true,
        })

        -- Текущая цель чуть заметнее
        hl(0, "FlashCurrent", {
          fg = "#d73a49",
          bg = "NONE",
          bold = true,
          underline = true,
        })
      end

      set_flash_highlights()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_flash_highlights,
      })
    end,
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      {
        "<leader>j", mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0, forward = true, wrap = false },
            label = { after = { 0, 0 } },
            pattern = "\\(^\\s*\\)\\@<=\\(\\S\\|$\\)" -- the first non-space character of a line
          })
        end,
        desc = "Jump to a line forward",
      },
      {
        "<leader>k", mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = { mode = "search", max_length = 0, forward = false, wrap = false },
            label = { after = { 0, 0 } },
            pattern = "\\(^\\s*\\)\\@<=\\(\\S\\|$\\)" -- the first non-space character of a line
          })
        end,
        desc = "Jump to a line backward",
      },
      {
        "S",
        mode = { "n", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter"
      },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "Avante", "codecompanion" },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ruby = { "rubocop" },
      },
      format_on_save = function(bufnr)
        -- Enable autoformat on certain filetypes
        local filetypes = { "go" }
        if not vim.tbl_contains(filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in a certain path
        -- local bufname = vim.api.nvim_buf_get_name(bufnr)
        -- if bufname:match("/node_modules/") then
        --   return
        -- end
        -- ...additional logic...
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    },
    keys = {
      {
        "<Leader>=",
        mode = "",
        function()
          require("conform").format{ async = true, lsp_fallback = true }
        end,
        desc = "Format"
      }
    }
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      -- explorer = { enabled = true },
      -- indent = { enabled = true },
      input = { enabled = true },
      -- picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      scratch = { enabled = true },
    },
    keys = {
      { "<LocalLeader>s",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<LocalLeader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    },
  },

  { dir="~/.my_vim" },

  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
  },

  {
    'sindrets/diffview.nvim',
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "BufReadPre",
  },

  { 'echasnovski/mini.ai', version = '*', opts = {} },

  { 'numToStr/Comment.nvim', opts = {}, event = "BufReadPre" },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = { panel = { enabled = false }, },
  },
};
