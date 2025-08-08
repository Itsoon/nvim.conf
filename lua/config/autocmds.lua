-- disable diagnostic for md and mdx
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
