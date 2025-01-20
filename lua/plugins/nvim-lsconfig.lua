return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "williamboman/mason.nvim",
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Add support for completion if `cmp_nvim_lsp` is installed
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if has_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    -- Setup diagnostics
    vim.diagnostic.config {
      underline = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      severity_sort = true,
      signs = true,
    }

    -- -- Inlay hints for Neovim 0.10+
    -- if vim.fn.has "nvim-0.10" == 1 then
    --   vim.lsp.handlers["textDocument/inlayHint"] = function(_, result, ctx, _)
    --     if result then
    --       vim.lsp.inlay_hint(ctx.bufnr, true)
    --     end
    --   end
    -- end

    -- LSP server configurations
    local servers = {
      servers = {
        marksman = {},
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            hint = { enable = true },
          },
        },
      },
    }

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server)
        lspconfig[server].setup {
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            -- Keymaps for LSP functionality
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
          end,
          settings = servers[server],
        }
      end,
    }
  end,
}
