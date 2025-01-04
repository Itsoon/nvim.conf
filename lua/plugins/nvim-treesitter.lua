return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "markdown", "c", "lua", "vim", "vimdoc", "javascript", "html", "rust", "python" },
      highlight = { enable = true },
      sync_install = false,
      indent = { enable = true },
    }
  end,
}
