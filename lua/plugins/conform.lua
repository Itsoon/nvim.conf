return {
  "conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    opts.formatters_by_ft.python = {
      "ruff_fix",
      "ruff_format",
    }

    if LazyVim.has_extra("formatting.prettier") then
      opts.formatters_by_ft.svelte = { "prettier" }
    end
  end,
}
