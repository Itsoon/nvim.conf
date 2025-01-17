require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
