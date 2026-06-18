return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
  ft = { "markdown", "norg", "rmd", "org", "mdx", "markdown.mdx" },
  opts = {
    completions = { blink = { enabled = true } },
    heading = {
      enabled = true,
      sign = false,
      position = "inline",
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      signs = { "󰫎 " },
      width = "block",
      left_margin = 0,
      left_pad = 1,
      right_pad = 2,
      min_width = 40,
      border = false,
      border_virtual = false,
      border_prefix = false,
      above = "▄",
      below = "▀",
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },
    code = {
      enabled = true,
      sign = false,
      style = "full",
      position = "left",
      language_pad = 2,
      language_name = true,
      disable_background = false,
      width = "block",
      left_margin = 0,
      left_pad = 2,
      right_pad = 2,
      min_width = 45,
      border = "thin",
      above = "▄",
      below = "▀",
      highlight = "RenderMarkdownCode",
      highlight_inline = "RenderMarkdownCodeInline",
      highlight_language = nil,
    },
    checkbox = {
      checked = { scope_highlight = "@markup.strikethrough" },
    },
    pipe_table = { preset = "round" },
  },
  config = function(_, opts)
    -- heading highlights
    local hl = vim.api.nvim_set_hl
    hl(0, "RenderMarkdownH1Bg", { bg = "#8F74EC", fg = "#000000", bold = true })
    hl(0, "RenderMarkdownH2Bg", { bg = "#748CED", fg = "#000000", bold = true })
    hl(0, "RenderMarkdownH3Bg", { bg = "#FB4934", fg = "#000000", bold = true })
    hl(0, "RenderMarkdownH4Bg", { bg = "#FA7D34", fg = "#000000", bold = true })
    hl(0, "RenderMarkdownH5Bg", { bg = "#D79921", fg = "#000000", bold = true })
    hl(0, "RenderMarkdownH6Bg", { bg = "#98971A", fg = "#000000", bold = true })
    hl(0, "RenderMarkdownH1", { fg = "#8F74EC", bold = true })
    hl(0, "RenderMarkdownH2", { fg = "#748CED", bold = true })
    hl(0, "RenderMarkdownH3", { fg = "#FB4934", bold = true })
    hl(0, "RenderMarkdownH4", { fg = "#FA7D34", bold = true })
    hl(0, "RenderMarkdownH5", { fg = "#D79921", bold = true })
    hl(0, "RenderMarkdownH6", { fg = "#98971A", bold = true })
    hl(0, "RenderMarkdownCode", { bg = "#181818" })

    require("render-markdown").setup(opts)

    local render_markdown_state = require("render-markdown.state")
    vim.api.nvim_create_user_command("ToggleRenderMarkdown", function()
      render_markdown_state.enabled = not render_markdown_state.enabled
      if render_markdown_state.enabled then
        require("render-markdown").enable()
      else
        require("render-markdown").disable()
      end
    end, {})

    vim.keymap.set("n", "<leader>um", "<cmd>ToggleRenderMarkdown<cr>", { silent = true, desc = "Toggle Render Markdown" })
  end,
}
