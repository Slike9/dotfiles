vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set({ "", "i" }, "<C-s>", "<ESC>:write<CR>", { desc = "Save file" })

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
