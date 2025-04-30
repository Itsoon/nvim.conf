return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require "null-ls"
    local sources = {
      null_ls.builtins.formatting.fish_indent,
      null_ls.builtins.diagnostics.fish,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.shfmt,
    }

    null_ls.setup {
      sources = sources,
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
            vim.lsp.buf.format {
              bufnr = bufnr,
              filter = function(client)
                return client.name ~= "clangd"
              end,
            }
          end, { desc = "Format the current buffer with null-ls" })
        end
      end,
    }
  end,
}
