vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local base_opts = { buffer = ev.buf }
    local function opts(custom_opts)
      return vim.tbl_deep_extend("force", base_opts, custom_opts)
    end

    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts({ desc = "Code Action" }))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts({ desc = "Go to definition" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts({ desc = "References", nowait = true }))
    vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.rename, opts({ desc = "Rename" }))
    vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end, opts({ desc = "Rename File" }))
    -- vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts({ desc = "Signature Help" }))
    vim.keymap.set('n', 'gK', vim.lsp.buf.hover, opts({ desc = "Hover" }))
    -- vim.keymap.set('n', "]]", function() Snacks.words.jump(vim.v.count1) end, opts({ desc = "Next Reference" }))
    -- vim.keymap.set('n', "[[", function() Snacks.words.jump(-vim.v.count1) end, opts({ desc = "Prev Reference" }))
    vim.keymap.set('n', "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, opts({ desc = "Next Reference" }))
    vim.keymap.set('n', "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, opts({ desc = "Prev Reference" }))
  end,
})

-- Git
vim.keymap.set("n", "<leader>ghp", ":!gh pr view -w<CR><CR>", { desc = "Github PR" })

--------------------------------------------------
-- The following keymaps are borrowed from LazyVim

local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- location list
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })

-- floating terminal
map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })

-- lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua", -- Specify the file type here
  callback = function()
    vim.keymap.set({"n", "x"}, "<localleader>r", function() Snacks.debug.run() end, { desc = "Run Lua", buffer = true })
  end,
})
