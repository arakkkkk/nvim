# Neovim Config

Opinionated Neovim configuration powered by lazy.nvim. It provides sensible defaults, LSP + completion, formatting, a file explorer, fuzzy finding, and a set of handy keymaps.

See plugin list and per‑plugin configs in the repository:
- Plugins: `lua/core/plugins.lua`
- Keymaps: `lua/core/mappings.lua`
- Bootstrapping lazy.nvim: `lua/core/config.lua`

## Installation

### Linux
```sh
# Install Neovim from your distro or official releases
sudo apt install neovim   # example for Debian/Ubuntu

# Clone config
git clone https://github.com/arakkkkk/nvim ~/.config/nvim
```

### Windows
```powershell
# Install Neovim
winget install Neovim.Neovim

git clone https://github.com/arakkkkk/nvim "$env:LOCALAPPDATA\nvim"
```

### First Launch
1. Start Neovim: `nvim`
2. lazy.nvim is bootstrapped automatically by `lua/core/config.lua`.
3. Run `:Lazy sync` if you want to explicitly install/update plugins.

## Features

- LSP via `nvim-lspconfig` + `mason.nvim`/`mason-lspconfig.nvim`
- Completion via `nvim-cmp` (+ optional Copilot integration)
- Formatting via `conform.nvim`
- File explorer with `nvim-tree.lua`
- Telescope for fuzzy finding and search
- UI/UX improvements: bufferline, lualine, noice, etc.

## LSP / Completion

1. Open `:Mason` and install the language servers you need.
2. LSP is configured in `lua/configs/nvim-lspconfig.lua` and attached automatically.
3. Completion is configured in `lua/configs/nvim-cmp.lua`.

## Formatting

Formatting is handled by `conform.nvim`. See `lua/configs/conform.lua` for formatters per filetype and on‑save behavior.

## Keymaps (Quick Reference)

See full list in `lua/core/mappings.lua`. Common ones are below:

| Key                      | Action                          | Plugin/Feature        |
| ------------------------ | --------------------------------| --------------------- |
| <leader>ff               | Find files                      | telescope.nvim        |
| <leader>fg               | Live grep                       | telescope.nvim        |
| <leader>fo               | Recent files                    | telescope.nvim        |
| <leader>fd               | Diagnostics picker              | telescope.nvim        |
| <leader>e                | Reveal in file tree             | nvim-tree.lua         |
| <leader>t                | Toggle symbols outline          | aerial.nvim           |
| <leader>j                | Jump to word                    | hop.nvim              |
| <S-h> / <S-l>            | Prev/Next buffer                | bufferline.nvim       |
| <C-h/j/k/l>              | Move between splits             | smart-splits.nvim     |
| <S-Arrow Keys>           | Resize splits                   | smart-splits.nvim     |
| <C-\>                    | Toggle floating terminal        | toggleterm.nvim       |
| <leader>ls               | Lazy sync                       | lazy.nvim             |
| <leader>u                | Focus Undotree                  | undotree              |

LSP (via lspsaga):

| Key        | Action                         |
| ---------- | ------------------------------ |
| K          | Hover doc                      |
| <leader>gf | Finder (definitions + refs)    |
| <leader>gd | Peek definition                 |
| <leader>ga | Code action                    |
| <leader>ge | Show line diagnostics          |
| [e / ]e    | Prev / Next diagnostics        |

Terminal app shortcuts (toggleterm):

| Key (Normal) | Command               |
| ------------ | --------------------- |
| :lg          | lazygit               |
| :ld          | lazydocker            |
| :gh          | gh dash               |
| :ht          | htop                  |
| :py          | python REPL           |

Utilities:

- `yp` / `yP`: copy relative / absolute file path to clipboard
- `<C-v>` in Normal/Insert on Markdown: paste image from clipboard (clipboard-image.nvim)
- `<leader>q`: save all and quit
- `<leader>c`: delete current buffer

## Python

For Python plugins and providers:
```sh
pip install pynvim
```

## Notes

- Plugin specs live in `lua/core/plugins.lua`; per‑plugin settings are under `lua/configs/`.
- If something feels off, run `:Lazy sync` and check health with `:checkhealth`.
