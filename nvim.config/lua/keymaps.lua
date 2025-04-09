vim.keymap.set("n", "<Leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set({ "", "i" }, "<C-s>", "<ESC>:write<CR>", { desc = "Save file" })

-- LSP
vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
vim.keymap.set("n", "<Leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "gK", vim.lsp.buf.hover, { desc = "Hover" })

-- Git
vim.keymap.set("n", "<leader>ghp", ":!gh pr view -w<CR><CR>", { desc = "Github PR" })
