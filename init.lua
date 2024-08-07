require("config.lazy")

vim.opt.clipboard:append("unnamedplus")

if vim.g.neovide then
	require("gruvbox").setup({
		terminal_colors = true,
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true,
		contrast = "", -- can be "hard", "soft" or empty string
		palette_overrides = {
			dark0 = "#300a24", -- default background color
			dark1 = "#3D1E33",
		},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	})

	vim.o.background = "dark" -- dark or light

	vim.cmd([[colorscheme gruvbox]])
else
	-- Default options:
	require("gruvbox").setup({
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = true,
	})
	vim.o.background = "dark" -- or "light" for light mode
	vim.cmd([[colorscheme gruvbox]])
end
