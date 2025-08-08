return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  options = { theme = "ayu_dark" },
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status")
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "gruvbox_dark",
        component_separators = { left = "", right = "" },
        section_separators = { left = "|", right = "|" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = false,
        always_show_tabline = false,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 8, -- ~60fps
          events = {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged",
          },
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = true,
            icon = { "", align = "left" },
          },
        },
        lualine_b = {
          {
            "branch",
            icons_enabled = true,
            icon = { "", align = "left" },
            separator = nil,
            cond = nil,
            draw_empty = false,
            padding = 1,
          },
          "diff",
          "diagnostics",
        },
        lualine_c = {
          "filename",
        },
        lualine_x = {
          -- {
          --   lazy_status.updates,
          --   cond = lazy_status.has_updates,
          --   color = { fg = "#F67C1C" },
          -- },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "location",
          -- function()
          --   return "" .. os.date("%R")
          -- end,
        },
      },
    })
  end,
}
