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
        lualine_c = {
          { "filename", path = 1, symbols = { modified = "  ", readonly = " ", unnamed = "" } },
        },
        lualine_x = {
          -- active LSP servers for the current buffer
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then
                return ""
              end
              local names = {}
              for _, c in ipairs(clients) do
                names[#names + 1] = c.name
              end
              return " " .. table.concat(names, ", ")
            end,
            color = { fg = "#83a598" },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", icon = "" },
        },
      },
    })
  end,
}
