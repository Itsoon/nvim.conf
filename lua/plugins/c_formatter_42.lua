return {
  "Itsoon/c_formatter_42.vim",
  ft = { "c", "cpp", "objc", "objcpp", "h" },
  config = function()
    require("c_formatter_42").setup {
      auto_format = true,
      toggle_key = "<leader>uf",
    }
  end,
}
