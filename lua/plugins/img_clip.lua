return {
  "HakonHarnes/img-clip.nvim",
  ft = { "markdown", "norg", "rmd", "org", "mdx" },
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  keys = {
    -- suggested keymap
    { "<leader>pv", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
