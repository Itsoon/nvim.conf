return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
  },
  opts = {
    options = {
      -- stylua: ignore
      -- mode = "tabs",
      separator_style = { "", "" },
      indicator = { icon = "|", style = "icon" },
      close_command = function(n)
        LazyVim.ui.bufremove(n)
      end,
      -- stylua: ignore
      diagnostics = "coc",
      always_show_bufferline = true,
      -- diagnostics = "nvim_lsp",
      -- diagnostics_indicator = function(_, _, diag)
      --   local icons = require("lazyvim.config").icons.diagnostics
      --   local ret = (diag.error and icons.Error .. diag.error .. " " or "")
      --     .. (diag.warning and icons.Warn .. diag.warning or "")
      --   return vim.trim(ret)
      -- end,
      offsets = {
        {
          filetype = "NvimTree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
