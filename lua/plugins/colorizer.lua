return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_commands = true,
      lazy_load = false,
      user_default_options = {
        names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
        names_opts = { -- options for mutating/filtering names.
          lowercase = false, -- name:lower(), highlight `blue` and `red`
          camelcase = false, -- name, highlight `Blue` and `Red`
          uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
          strip_digits = true, -- ignore names with digits,
          -- highlight `blue` and `red`, but not `blue3` and `red4`
        },
      },
    })
  end,
}
