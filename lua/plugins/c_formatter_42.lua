return {
  "Itsoon/c_formatter_42.vim",
  config = function()
    require("c_formatter_42").setup {
      auto_format = true,
      toggle_key = "<leader>uf",
    }
  end,
}
