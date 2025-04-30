require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<A-j>", "<cmd>MoveLine(1)<cr>", opts)
map("n", "<A-k>", "<cmd>MoveLine(-1)<cr>", opts)
map("n", "<A-h>", "<cmd>MoveHChar(-1)<cr>", opts)
map("n", "<A-l>", "<cmd>MoveHChar(1)<cr>", opts)
map("n", "<leader>wf", "<cmd>MoveWord(1)<cr>", opts)
map("n", "<leader>wb", "<cmd>MoveWord(-1)<cr>", opts)

-- Visual-mode commands
map("v", "<A-j>", "<cmd>MoveBlock(1)<cr>", opts)
map("v", "<A-k>", "<cmd>MoveBlock(-1)<cr>", opts)
map("v", "<A-h>", "<cmd>MoveHBlock(-1)<cr>", opts)
map("v", "<A-l>", "<cmd>MoveHBlock(1)<cr>", opts)

-- Indentation commands in visual mode
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

map("n", ";", ":", { desc = "CMD enter command mode" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- moving in windows
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- movebuffers
map("n", "<A-Left>", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move Buffer Prev" })
map("n", "<A-Right>", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move Buffer Next" })
map("n", "<leader>ub", function()
  require("base46").toggle_transparency()
  vim.cmd "TransparentToggle"
end, { desc = "Toggle Background" })

-- resizebuffers
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "resize buffer" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "resize buffer" })
map("n", "<C-Right>", "<cmd>vertical resize -2<cr>", { desc = "resize buffer" })
map("n", "<C-Left>", "<cmd>vertical resize +2<cr>", { desc = "resize buffer" })

-- toggle format on save

vim.keymap.set("n", "<leader>uf", function()
  _G.enable_format_on_save = not _G.enable_format_on_save
  if _G.enable_format_on_save then
    vim.notify("Format on save: ENABLED", vim.log.levels.INFO)
  else
    vim.notify("Format on save: DISABLED", vim.log.levels.WARN)
  end
end, { desc = "Toggle format on save" })
