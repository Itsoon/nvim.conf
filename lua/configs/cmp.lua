local cmp = require "cmp"

-- Deux modes de mapping
local mappings_tab = {
  ["<Tab>"] = cmp.mapping.select_next_item(),
  ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  ["<CR>"] = cmp.mapping.confirm { select = true },
}

local mappings_arrow = {
  ["<Down>"] = cmp.mapping.select_next_item(),
  ["<Up>"] = cmp.mapping.select_prev_item(),
  ["<Tab>"] = function(fallback)
    fallback()
  end,
  ["<S-Tab>"] = function(fallback)
    fallback()
  end,
  ["<CR>"] = cmp.mapping.confirm { select = true },
}

local use_tab = true -- par défaut, navigation avec Tab

-- Fonction toggle
function ToggleCmpNavigation()
  use_tab = not use_tab
  local new_mapping = use_tab and mappings_tab or mappings_arrow
  cmp.setup { mapping = new_mapping }
  print("Completion navigation: " .. (use_tab and "Tab" or "Arrow keys"))
end

-- Setup initial avec Tab
cmp.setup { mapping = mappings_tab }

-- Mappe une touche pour toggle (ex: <leader>tn)
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua ToggleCmpNavigation()<CR>", { noremap = true, silent = true })
