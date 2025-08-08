return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        inverse = true,
        contrast = "", -- "hard", "soft", or ""
        dim_inactive = false,
        transparent_mode = true,

        overrides = {
          CursorLine = { bg = "#3C3836" },
          CursorLineNr = { fg = "#0090FF", bg = "#3C3836", bold = true },
        },
      })

      vim.cmd("colorscheme gruvbox")
    end,
  },
}
