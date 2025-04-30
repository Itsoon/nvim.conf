require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
vim.opt.relativenumber = true

_G.enable_format_on_save = true

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.c",
  callback = function()
    if _G.enable_format_on_save then
      vim.lsp.buf.format { async = false }
    end
  end,
})
