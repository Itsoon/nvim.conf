return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>z",
      function()
        Snacks.zen()
      end,
      desc = "Zen Mode",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
  },
  ---@type snacks.Config
  opts = {
    -- ── UI / eye-candy ────────────────────────────────────────────────
    indent = {
      enabled = true,
      animate = { enabled = true, duration = { step = 20, total = 300 } },
      scope = { enabled = true, hl = "SnacksIndentScope" },
    },
    scope = { enabled = true },
    words = { enabled = true }, -- highlight references under cursor
    dim = { enabled = true }, -- dim inactive code (used by zen)
    zen = { enabled = true }, -- distraction-free mode
    statuscolumn = { enabled = true },
    animate = { enabled = true },
    input = { enabled = true }, -- prettier vim.ui.input
    bigfile = { enabled = true }, -- disable heavy features on huge files (speed)
    quickfile = { enabled = true }, -- render files before plugins load (speed)

    picker = {
      finder = "explorer",
      sort = { fields = { "sort" } },
      supports_live = true,
      hidden = true,
      ignored = false,
      tree = true,
      watch = true,
      diagnostics = true,
      diagnostics_open = false,
      git_status = true,
      git_status_open = false,
      git_untracked = true,
      jump = { close = false },
      win = {
        list = {
          keys = {
            ["<a-c>"] = { "toggle_cwd", mode = { "n", "i" } },
            ["<BS>"] = "explorer_up",
            ["l"] = "confirm",
            ["h"] = "explorer_close",
            ["a"] = "explorer_add",
            ["d"] = "explorer_del",
            ["r"] = "explorer_rename",
            ["c"] = "explorer_copy",
            ["m"] = "explorer_move",
            ["o"] = "explorer_open",
            ["P"] = "toggle_preview",
            ["y"] = { "explorer_yank", mode = { "n", "x" } },
            ["p"] = "explorer_paste",
            ["u"] = "explorer_update",
            ["<c-c>"] = "tcd",
            ["<leader>/"] = "picker_grep",
            ["<c-t>"] = "terminal",
            ["."] = "explorer_focus",
            ["I"] = "toggle_ignored",
            ["H"] = "toggle_hidden",
            ["Z"] = "explorer_close_all",
            ["]g"] = "explorer_git_next",
            ["[g"] = "explorer_git_prev",
            ["]d"] = "explorer_diagnostic_next",
            ["[d"] = "explorer_diagnostic_prev",
            ["]w"] = "explorer_warn_next",
            ["[w"] = "explorer_warn_prev",
            ["]e"] = "explorer_error_next",
            ["[e"] = "explorer_error_prev",
          },
        },
      },
    },
  },
}
