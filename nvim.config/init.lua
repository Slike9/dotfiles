vim.cmd.source(vim.fn.stdpath("config") .. "/.vimrc.before")

require("config.lazy")

vim.cmd.source(vim.fn.stdpath("config") .. "/.vimrc.after")
