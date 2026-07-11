return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    -- Beautiful centered popup command line + search.
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },
    -- Route regular messages (incl. hardtime warnings) to the bottom-right
    -- "mini" view instead of the command-line row under the statusline.
    messages = {
      enabled = true,
      view = "mini", -- normal messages -> bottom-right corner
      view_error = "mini", -- errors -> bottom-right corner
      view_warn = "mini", -- warnings -> bottom-right corner
      view_history = "messages",
      view_search = "virtualtext",
    },
    -- snacks.notifier keeps handling vim.notify (also bottom-right).
    notify = { enabled = false },
    -- Send any leftover echo/notify routes to the mini view too.
    views = {
      mini = {
        position = { row = -2, col = "100%" },
        win_options = { winblend = 0 },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = { enabled = true },
      hover = { enabled = true },
    },
    presets = {
      command_palette = true, -- position cmdline + popupmenu together
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
