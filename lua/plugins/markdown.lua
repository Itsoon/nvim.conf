return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      -- Créer une commande pour activer/désactiver le rendu Markdown
      local render_markdown_state = require "render-markdown.state"
      vim.api.nvim_create_user_command("ToggleRenderMarkdown", function()
        render_markdown_state.enabled = not render_markdown_state.enabled
        if render_markdown_state.enabled then
          require("render-markdown").enable()
        else
          require("render-markdown").disable()
        end
      end, {})

      -- Associer un raccourci clavier à la commande
      vim.keymap.set("n", "<leader>um", "<cmd>ToggleRenderMarkdown<cr>", { silent = true })
    end,
  },
}
