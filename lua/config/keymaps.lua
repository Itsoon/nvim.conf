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
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>x", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>c", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- movebuffers
map("n", "<A-Left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Prev" })
map("n", "<A-Right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Next" })

-- terminal

vim.keymap.set("n", "<leader>h", function()
  vim.cmd("split")
  vim.cmd("resize 15")
  vim.cmd("terminal")
end, { desc = "Open terminal horizontal split (height 15)" })

vim.keymap.set("n", "<leader>v", function()
  vim.cmd("vsplit")
  vim.cmd("vertical resize 40")
  vim.cmd("terminal")
end, { desc = "Open terminal vertical split (width 40)" })

local function set_terminal_keymaps()
  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-x>", [[<C-\><C-n>]], opts)

  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = set_terminal_keymaps,
})

vim.keymap.set("n", "<leader>fc", ":FormatC42<CR>", { noremap = true, silent = true })
