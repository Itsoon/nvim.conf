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
          -- Clean floats/borders that play nicely with transparent_mode
          NormalFloat = { bg = "none" },
          FloatBorder = { fg = "#928374", bg = "none" },
          FloatTitle = { fg = "#fabd2f", bg = "none", bold = true },
          -- Subtle winbar / separators
          WinSeparator = { fg = "#504945", bg = "none" },
          -- Pmenu (completion) polish
          Pmenu = { bg = "#282828" },
          PmenuSel = { fg = "#282828", bg = "#fabd2f", bold = true },
          -- Telescope/snacks picker borders match the theme
          TelescopeBorder = { fg = "#928374", bg = "none" },
        },
      })

      vim.cmd("colorscheme gruvbox")
    end,
  },
}
