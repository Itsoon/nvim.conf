return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "gruvbox_dark",
        component_separators = { left = "", right = "" },
        section_separators = { left = "|", right = "|" },
        always_divide_middle = false,
        always_show_tabline = false,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          { "mode", icons_enabled = true, icon = { "", align = "left" } },
        },
        lualine_b = {
          { "branch", icons_enabled = true, icon = { "", align = "left" } },
          "diff",
          "diagnostics",
        },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
