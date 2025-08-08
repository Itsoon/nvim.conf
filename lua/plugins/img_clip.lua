return {
  "HakonHarnes/img-clip.nvim",
  ft = { "markdown", "norg", "rmd", "org", "mdx" },
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>pv", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
