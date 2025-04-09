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
          lualine_c = { 'diff', 'diagnostics', 'filename' },
          lualine_x = { "lsp_status", 'encoding', 'fileformat', 'filetype' },
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
    keys = {
      { "<C-p>", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
      { "<Leader>ff", function() require("fzf-lua").files() end, mode = "n", desc = "Find files" },
      { "<Leader>fc", function() require("fzf-lua").files{ cwd = vim.fn.stdpath("config") } end, mode = "n", desc = "Find config files" },
      { "<C-b>", function() require("fzf-lua").buffers() end, mode = "n", desc = "Find buffers" },
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

  -- Snippets
  'SirVer/ultisnips',
  'honza/vim-snippets',

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

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {},
    config = function()
      require("mason").setup {}
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls" },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require'lspconfig'.ruby_lsp.setup{
        capabilities = capabilities,
        init_options = {
          enabledFeatures = {
            semanticHighlighting = false,
          }
        }
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

  { dir="~/.my_vim" },

  -- Not frequently used
  { 'tpope/vim-dispatch', cmd = "Dispatch" },
  { "nvim-telescope/telescope.nvim", cmd = "Telescope" },
  { "Chiel92/vim-autoformat", cmd = "Autoformat" },
  { 'majutsushi/tagbar', cmd = "Tagbar" },
};
