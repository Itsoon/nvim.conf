return {
  "Itsoon/c_formatter_42.vim",
  ft = { "c", "cpp", "objc", "objcpp", "h" },
  config = function()
    require("c_formatter_42").setup({
      auto_format = true,
      toggle_key = "<leader>uf",
    })

    -- Format on save
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = { "*.c", "*.cpp", "*.h", "*.m", "*.mm" },
    --   callback = function()
    --     vim.cmd("FormatC42")
    --   end,
    -- })
  end,
}
