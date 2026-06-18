# Neovim Config

Personal Neovim configuration built on [LazyVim](https://www.lazyvim.org/) with Gruvbox theme.

## Requirements

- Neovim >= 0.9
- Git
- A [Nerd Font](https://www.nerdfonts.com/)
- `node` + `yarn` — for markdown-preview
- Rust toolchain — for rustaceanvim
- `ruff` — for Python formatting
- `c_formatter_42` + `norminette` — for 42 school tools

## Install

```sh
git clone https://github.com/Itsoon/nvim.conf ~/.config/nvim
```

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lazyvim.json          # LazyVim extras
└── lua/
    ├── config/
    │   ├── autocmds.lua  # Auto-commands
    │   ├── keymaps.lua   # Custom keybindings
    │   ├── lazy.lua      # Plugin manager bootstrap
    │   └── options.lua   # Editor options
    └── plugins/          # Plugin specs
```

## Plugins

| Plugin | Purpose |
| --- | --- |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | File explorer, picker, utilities |
| [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) | Start screen |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Inline markdown rendering |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Browser markdown preview |
| [multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim) | Multi-cursor editing |
| [outline.nvim](https://github.com/hedyhli/outline.nvim) | Code symbol outline |
| [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | Rust LSP & tools |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) | Color code highlighting |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Git diff viewer |
| [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) | Vim habit training |
| [42header](https://github.com/42Paris/42header) | 42 school file header |
| [c_formatter_42.vim](https://github.com/Itsoon/c_formatter_42.vim) | 42 norminette formatter |

## Keymaps

> `<leader>` is `Space`

### Buffers

| Key | Action |
| --- | --- |
| `<S-h>` / `<S-l>` | Prev / Next buffer |
| `<S-Tab>` / `<Tab>` | Prev / Next buffer |
| `[b` / `]b` | Prev / Next buffer |
| `<leader>bb` / `` <leader>` `` | Switch to other buffer |
| `<leader>bd` / `<leader>x` / `<leader>c` | Delete buffer |
| `<leader>bo` | Delete other buffers |
| `<leader>bD` | Delete buffer and window |
| `<A-Left>` / `<A-Right>` | Move buffer left / right in tabline |

### Terminal

| Key | Action |
| --- | --- |
| `<leader>h` | Open horizontal terminal split (height 15) |
| `<leader>v` | Open vertical terminal split (width 40) |
| `<Esc>` / `<C-x>` *(terminal)* | Exit terminal mode |
| `<C-h/j/k/l>` *(terminal)* | Navigate to window |

### File Explorer (snacks)

| Key | Action |
| --- | --- |
| `l` | Open / confirm |
| `h` | Close directory |
| `a` | Add file or directory |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `m` | Move |
| `y` | Yank path |
| `p` | Paste |
| `H` | Toggle hidden files |
| `I` | Toggle ignored files |
| `P` | Toggle preview |
| `<BS>` | Go up one directory |
| `]g` / `[g` | Next / prev git change |
| `]d` / `[d` | Next / prev diagnostic |
| `]e` / `[e` | Next / prev error |
| `]w` / `[w` | Next / prev warning |

### Multi-cursor

| Key | Action |
| --- | --- |
| `<A-Up>` / `<A-Down>` | Add cursor above / below |
| `<leader><Up>` / `<leader><Down>` | Skip cursor above / below |
| `<leader>n` / `<leader>N` | Add cursor on next / prev match |
| `<leader>s` / `<leader>S` | Skip cursor on next / prev match |
| `<C-leftclick>` | Add / remove cursor with mouse |
| `<leader>m` | Add cursor at position |
| `<leader>M` | Enable cursors |
| `<C-q>` | Toggle cursor |
| `<left>` / `<right>` *(multi)* | Prev / next main cursor |
| `<Esc>` *(multi)* | Enable / clear cursors |

### Editing & UI

| Key | Action |
| --- | --- |
| `<leader>o` | Toggle code outline |
| `<leader>um` | Toggle markdown rendering |
| `<leader>uf` | Toggle format on save |
| `<leader>uw` | Toggle word wrap |
| `<leader>d` | Show diagnostics in floating window |
| `<leader>fc` | Format C file with c_formatter_42 |

### Navigation

| Key | Action |
| --- | --- |
| `<C-o>` / `<C-i>` | Jump back / forward in jump list |
| `<C-d>` / `<C-u>` | Scroll half screen down / up |
| `<C-f>` / `<C-b>` | Scroll full screen down / up |
| `<C-e>` / `<C-y>` | Scroll one line down / up |

### Insert Mode

| Key | Action |
| --- | --- |
| `<C-h>` | Delete previous character |
| `<C-w>` | Delete previous word |
| `<C-u>` | Delete to beginning of line |
| `a` / `A` | Insert after cursor / end of line |
| `i` / `I` | Insert before cursor / beginning of line |
| `o` / `O` | New line below / above |

### Text Editing

```
# Replace all occurrences in file
:%s/old/new/g

# Replace in visual selection
:s/old/new/g
```
