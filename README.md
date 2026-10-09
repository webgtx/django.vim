# django.vim

A classic dark forest green color scheme for Vim and Neovim, inspired by Django's visual identity and the iconic TextMate theme.

## Palette

| Element | Hex | Preview / Role |
| :--- | :--- | :--- |
| **Background** | `#0b2f20` | Classic Django deep dark green |
| **Foreground** | `#f8f8f8` | Off-white |
| **Selection / Active** | `#245032` | Forest green |
| **Cursor / Accent** | `#7cf0ad` | Bright mint |
| **Strings** | `#87bb9e` | Sage / mint green |
| **Keywords / Statements** | `#ffe862` | Warm bright yellow |
| **Functions / Methods** | `#fec758` | Warm amber gold |
| **Types / Classes** | `#96dd3b` | Vibrant lime green |
| **Numbers / Floats** | `#eb939a` | Soft rose |
| **Constants** | `#497958` | Muted moss green |
| **PreProc / Decorators** | `#aa5507` | Rust orange |
| **Special / Variables** | `#fb9a4b` | Warm orange |
| **Comments** | `#4e7d68` | Readable spruce / forest sage |

## Features

- **Truecolor & 256-color**: Full GUI (`guifg`/`guibg`) and mathematical xterm-256 (`ctermfg`/`ctermbg`) fallback.
- **Built-in Terminal Colors**: Configured `g:terminal_ansi_colors` (Vim) and `g:terminal_color_*` (Neovim).
- **Python & Django**: Tailored highlights for Python decorators, builtins, exceptions, and Django template tags/filters.
- **Neovim Tree-sitter & LSP**: Complete Tree-sitter highlighting and LSP diagnostic highlights (`DiagnosticError`, `DiagnosticWarn`, etc.).
- **Plugin Support**: GitGutter, Gitsigns, NERDTree, nvim-tree, Telescope.

## Installation

### Native Vim 8 / 9 Packages
```bash
git clone https://github.com/azolotarov/django.vim.git ~/.vim/pack/plugins/start/django.vim
```

### vim-plug
```vim
Plug 'azolotarov/django.vim'
```

### lazy.nvim (Neovim)
```lua
{
  "azolotarov/django.vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme django]])
  end,
}
```

### packer.nvim (Neovim)
```lua
use 'azolotarov/django.vim'
```

## Usage

In your `.vimrc`:
```vim
if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme django
```

In your `init.lua`:
```lua
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme django")
```

## Configuration

Customize before loading the colorscheme:

```vim
" Enable or disable italic comments (default: 1)
let g:django_italic_comments = 1

" Enable or disable bold keywords (default: 1)
let g:django_bold_keywords = 1

" Enable or disable bold function names (default: 0)
let g:django_bold_functions = 0

" Enable transparent background (default: 0)
let g:django_transparent_background = 0
```

## License

MIT License. See [LICENSE](LICENSE) for details.
