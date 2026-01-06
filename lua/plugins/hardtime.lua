return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    max_count = 5,
    disabled_keys = {
      ["<Up>"] = false,
      ["<Down>"] = false,
      ["<Left>"] = false,
      ["<Right>"] = false,
      -- ["<Space>"] = { "n", "x" }, -- Disable <Space> key in normal and visual mode
    },
    disable_mouse = false,
  },
}
