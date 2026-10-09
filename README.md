# django.vim

A deep forest green color scheme for Vim and Neovim based on the Windows Terminal **Django** palette.

## Palette

- **Background:** `#0b2f20` (Classic Django deep forest green)
- **Selection / Active:** `#245032` (Forest green)
- **Foreground:** `#f8f8f8` (Off-white)
- **Cursor / Accents:** `#336442` (Muted forest cursor)
- **Green (Strings / Adds):** `#9df39f` / `#73da70`
- **Yellow (Keywords / Statements):** `#ffe862` / `#ffff94`
- **Orange / Red (PreProc / Accents):** `#fd6209` / `#ff943b`
- **Cyan (Special / Delimiters):** `#cfffd1`
- **Comments:** `#568264` (Forest sage)

| Element | Hex | Role |
| :--- | :--- | :--- |
| **Background** | `#0b2f20` | Windows Terminal Django background |
| **Foreground** | `#f8f8f8` | Windows Terminal Django foreground |
| **Selection / Active** | `#245032` | Selection background |
| **Cursor** | `#336442` | Cursor color |
| **Strings** | `#9df39f` | Cyan / mint green |
| **Keywords / Statements** | `#ffe862` | Yellow |
| **Functions / Methods** | `#ffff94` | Bright yellow / gold |
| **Types / Classes** | `#73da70` | Bright green |
| **Numbers / Constants** | `#41a83e` | Green |
| **PreProc / Decorators** | `#fd6209` | Red |
| **Special / Identifiers** | `#ff943b` | Bright red / warm orange |
| **Comments** | `#568264` | Bright blue / forest sage |

## Features

- **Truecolor & 256-color**: Full GUI (`guifg`/`guibg`) and mathematical xterm-256 (`ctermfg`/`ctermbg`) fallback.
- **Built-in Terminal Colors**: Configured `g:terminal_ansi_colors` (Vim) and `g:terminal_color_*` (Neovim).
- **Python & Django**: Tailored highlights for Python decorators, builtins, exceptions, and Django template tags/filters.
- **Neovim Tree-sitter & LSP**: Complete Tree-sitter highlighting and LSP diagnostic highlights (`DiagnosticError`, `DiagnosticWarn`, etc.).
- **Statusline / Airline**: Built-in [vim-airline](https://github.com/vim-airline/vim-airline) theme matching normal, insert, visual, replace, command, and inactive modes.
- **Plugin Support**: vim-airline, GitGutter, Gitsigns, NERDTree, nvim-tree, Telescope.

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

### Airline Theme

When using [vim-airline](https://github.com/vim-airline/vim-airline), the `django` airline theme will be automatically loaded alongside `colorscheme django`. You can also set it explicitly:

```vim
let g:airline_theme = 'django'
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
