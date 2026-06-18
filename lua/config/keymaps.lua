local map = vim.keymap.set

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>x", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>c", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- move buffers
map("n", "<A-Left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Prev" })
map("n", "<A-Right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Next" })

-- terminal
map("n", "<leader>h", function()
  vim.cmd("split")
  vim.cmd("resize 15")
  vim.cmd("terminal")
end, { desc = "Open terminal horizontal split (height 15)" })

map("n", "<leader>v", function()
  vim.cmd("vsplit")
  vim.cmd("vertical resize 40")
  vim.cmd("terminal")
end, { desc = "Open terminal vertical split (width 40)" })

local function set_terminal_keymaps()
  local opts = { noremap = true, silent = true, buffer = 0 }
  map("t", "<Esc>", [[<C-\><C-n>]], opts)
  map("t", "<C-x>", [[<C-\><C-n>]], opts)
  map("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
  map("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
  map("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
  map("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = set_terminal_keymaps,
})

-- 42 school
map("n", "<leader>fc", "<cmd>FormatC42<cr>", { noremap = true, silent = true, desc = "Format with c_formatter_42" })

-- diagnostics
map("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, { focus = false, wrap = true, max_width = 80 })
end, { desc = "Show diagnostics in floating window" })
