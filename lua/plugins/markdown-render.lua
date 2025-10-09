vim.cmd([[
  highlight RenderMarkdownH1Bg guibg=#8F74EC guifg=#000000 gui=bold
  highlight RenderMarkdownH2Bg guibg=#748CED guifg=#000000 gui=bold
  highlight RenderMarkdownH3Bg guibg=#FB4934 guifg=#000000 gui=bold
  highlight RenderMarkdownH4Bg guibg=#FA7D34 guifg=#000000 gui=bold
  highlight RenderMarkdownH5Bg guibg=#D79921 guifg=#000000 gui=bold
  highlight RenderMarkdownH6Bg guibg=#98971A guifg=#000000 gui=bold

  highlight RenderMarkdownH1 guifg=#8F74EC gui=bold cterm=bold
  highlight RenderMarkdownH2 guifg=#748CED gui=bold cterm=bold
  highlight RenderMarkdownH3 guifg=#FB4934 gui=bold cterm=bold
  highlight RenderMarkdownH4 guifg=#FA7D34 gui=bold cterm=bold
  highlight RenderMarkdownH5 guifg=#D79921 gui=bold cterm=bold
  highlight RenderMarkdownH6 guifg=#98971A gui=bold cterm=bold

  highlight RenderMarkdownCode guibg=#181818
]])

return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
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
  ft = { "markdown", "norg", "rmd", "org", "mdx", "markdown.mdx" },
  config = function(_, opts)
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

    -- Map a key to the command
    vim.keymap.set("n", "<leader>um", "<cmd>ToggleRenderMarkdown<cr>", { silent = true })
  end,
}
