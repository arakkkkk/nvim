# neovim config by arakkk
## Instration
```sh
https://github.com/arakkkkk/nvim
sudo apt install nvim
```
https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

## Plugins

### LSP
- nvim-lspconfig
- mason
- mason-lspconfig
- conform.nvim
- nvim-lint.nvim

## Usage
### Keymap
See all keymaps in [here](lua/core/mappings.lua).

|  key                    | action                      | plugin            |
| ----------------------- | --------------------------- | ----------------- |
| <leader>ff              | Find file(file name)        | telescope.nvim    |
| <leader>fg              | Search file                 | telescope.nvim    |
| <leader>fo              | File history                | telescope.nvim    |
| <leader>e               | File tree                   | nvim-tree.lua     |
| <leader>t               | Code outline                | aerial.nvim       |
| K                       | Code information            | lspsaga.nvim      |
| gd                      | Jump definition             | lspsaga.nvim      |
| ga                      | Code action                 | lspsaga.nvim      |
| [e / ]e                 | Next / Previous diagnostics | lspsaga/nvim      |
| <leader>j               | Jump cursole                | hop.nvim          |
| <C-h>/<C-j>/<C-k>/<C-l> | Move cursole                | smart-splits.nvim |
| <S-h>/<S-l>             | Shift buffer                | bufferline.nvim   |
| <C-\>                   | Floating term               | toggleterm.nvim   |
|                         |                             |                   |
|                         |                             |                   |
| ss                      |                             |                   |
| siw                     |                             |                   |

## Others
### How to add LSP
1. Select and install LSP with Mason by `:Mason`
### check lsp status
`:NullLsInfo`
`:LspInfo`

### commands

### Registers
- "
- *
  - clipboard
- +
  - clipboard
- r
  - command to quick run
- c
  - command to run with !
  
