require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<A-j>", ":MoveLine(1)<CR>", opts)
map("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
map("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
map("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
map("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
map("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
map("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
map("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
map("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
map("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)

map("n", ";", ":", { desc = "CMD enter command mode" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- resize
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
end, { desc = "Toggle Background" })
