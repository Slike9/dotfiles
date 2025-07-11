return {
  -- Color schemes
  "altercation/vim-colors-solarized",

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        -- ensure_installed = { "ruby" },
        -- highlight = {
        --   enable = true,
        -- },
      }
    end,
  },

  -- 'vim-airline/vim-airline',
  -- 'vim-airline/vim-airline-themes',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
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
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{}
    end,
  },

  "nvim-lua/plenary.nvim",
  'jiangmiao/auto-pairs',
  'matze/vim-move',
  'tpope/vim-abolish',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-endwise',
  'tpope/vim-eunuch',
  'tpope/vim-unimpaired',
  'terryma/vim-multiple-cursors',
  'AndrewRadev/splitjoin.vim',
  {
    'jlanzarotta/bufexplorer',
    keys = {
      { "<Leader>be" },
    }
  },
  'scrooloose/nerdtree',
  'google/vim-searchindex',
  'easymotion/vim-easymotion',
  'ervandew/supertab',
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
    cmd = "AsyncRun",
    keys = {
      {
        "<LocalLeader>c",
        function()
          vim.cmd"AsyncRun bundle exec srb tc"
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
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {
      fzf_opts = {
        ["--layout"] = "default",
      },
    },
    cmd = "FzfLua",
    keys = {
      { "<C-p>", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
      { "<Leader>ff", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
      { "<Leader>fs", function() require("fzf-lua").lsp_live_workspace_symbols() end, mode = "n", desc = "FzfLua lsp_live_workspace_symbols" },
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
    },
  },
  'airblade/vim-gitgutter',

  -- Linter
  -- {
  --   'w0rp/ale',
  --   config = function()
  --     vim.g["airline#extensions#ale#enabled"] = 1
  --     vim.g.ale_lint_on_text_changed = 'never'
  --     vim.g.ale_set_loclist = 1
  --     vim.g.ale_open_list = 0
  --     vim.g.ale_virtualtext_cursor = 'disabled'
  --     vim.g.ale_ruby_rubocop_executable = 'bundle'
  --     -- vim.g.ale_set_quickfix = 1
  --     -- vim.g.ale_keep_list_window_open = 1
  --   end
  -- },

  -- Autocomplete
  {
    "SirVer/ultisnips",
    init = function()
      vim.g.UltiSnipsExpandOrJumpTrigger = "<Tab>"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "SirVer/ultisnips",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "honza/vim-snippets",
      "quangnguyen30192/cmp-nvim-tags",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-path",
      -- "rafamadriz/friendly-snippets",
    },
    opts = function()
      local cmp = require("cmp")
      local auto_select = true
      local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
      end
      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          autocomplete = false,
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "ultisnips" },
        }, {
          { name = "nvim_lsp" },
          { name = "buffer" },
          -- { name = "tags" }
        })
      }
    end,
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
  'thoughtbot/vim-rspec',
  'tpope/vim-bundler',
  'tpope/vim-rails',
  'tpope/vim-rake',
  'vim-ruby/vim-ruby',
  "SmiteshP/nvim-navic",

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- "SmiteshP/nvim-navic",
    },
    opts = {},
    config = function()
      require("mason").setup {}
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls" },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local navic = require("nvim-navic")
      require'lspconfig'.ruby_lsp.setup{
        capabilities = capabilities,
        init_options = {
          enabledFeatures = {
            semanticHighlighting = false,
          }
        },
        on_attach = function(client, bufnr)
          navic.attach(client, bufnr)
        end,
      }
      -- require'lspconfig'.rubocop.setup{
      --   capabilities = capabilities,
      -- }
      require'lspconfig'.sorbet.setup{
        capabilities = capabilities,
      }
      require'lspconfig'.lua_ls.setup{
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" } },
          },
        },
      }
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
      modes = {
        char = { enabled = false },
      },
    },
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      {
        "S",
        mode = { "n", "o" },
        function()
          vim.cmd"TSBufEnable highlight"
          require("flash").treesitter()
          vim.cmd"TSBufDisable highlight"
        end,
        desc = "Flash Treesitter"
      },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function()
          vim.cmd"TSBufEnable highlight"
          require("flash").treesitter_search()
          vim.cmd"TSBufDisable highlight"
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
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
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
      -- bigfile = { enabled = true },
      dashboard = { enabled = true },
      -- explorer = { enabled = true },
      -- indent = { enabled = true },
      -- input = { enabled = true },
      -- picker = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
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

  -- { "github/copilot.vim" },

  { dir="~/.my_vim" },

  -- Not frequently used
  { 'tpope/vim-dispatch', cmd = "Dispatch" },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            -- ["<esc>"] = require("telescope.actions").close,
            ["<C-u>"] = false,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    },
    cmd = "Telescope",
    keys = {
      -- { "<leader>fs", require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = "Telescope lsp_dynamic_workspace_symbols" },
    },
  },
  { 'majutsushi/tagbar', cmd = "Tagbar" },
};
