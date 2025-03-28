# neovim config
## Instration
### Linux
```sh
git clone https://github.com/arakkkkk/nvim ~/.config/nvim
sudo apt install nvim
```

https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package
                                                                                                                                                               
    1   cyan = "#56b6c2",                                                                                                                                                                                                                                     
   48   cyan_1 = "#c5f6fa",                                                                                                                                                                                                                                   
    1   cyan_2 = "#99e9f2",                                                                                                                                                                                                                                   
    2   cyan_3 = "#66d9e8",                                                                                                                                                                                                                                   
    3   purple = "#c678dd",                                                                                                                                                                                                                                   
    4   purple_1 = "#a9a1e1",                                                                                                                                                                                                                                 
    5                                                                                                                 
### Windows
```sh
git clone https://github.com/arakkkkk/nvim AppData/Local/nvim
winget install Neovim.Neovim
```

## Plugins
See all plugins in [here](lua/core/plugins.lua).

### LSP completion
1. Install LS with `:Mason`.
2. Set up automatically.
- nvim-lspconfig
- nvim-cmp
### Formatter
1. Install Formatter with `:Mason`.
2. Set up formatter with conform.nvim.
- `nvim/lua/configs/conform.lua`
### Linter
1. Install Formatter with `:Mason`.
2. Set up formatter with nvim-lint.nvim.
- `nvim/lua/configs/lint.lua`

## Usage
### Keymap
See all keymaps in [here](lua/core/mappings.lua).

| key                     | action                      | plugin            |
| ----------------------- | --------------------------- | ----------------- |
| <leader>ff              | Find file(file name)        | telescope.nvim    |
| <leader>fg              | Search file                 | telescope.nvim    |
| <leader>fo              | File history                | telescope.nvim    |
| <leader>e               | File tree                   | nvim-tree.lua     |
| <leader>t               | Code outline                | aerial.nvim       |
| K                       | Code information            | lspsaga.nvim      |
| gd                      | Jump definition             | lspsaga.nvim      |
| ga                      | Code action                 | lspsaga.nvim      |
| [e / ]e                 | Next / Previous diagnostics | lspsaga.nvim      |
| <leader>j               | Jump cursole                | hop.nvim          |
| <C-h>/<C-j>/<C-k>/<C-l> | Move cursole                | smart-splits.nvim |
| <S-h>/<S-l>             | Shift buffer                | bufferline.nvim   |
| <C-\>                   | Floating term               | toggleterm.nvim   |
| ss                      |                             |                   |
| siw                     |                             |                   |

## Others
### How to add LSP
1. Select and install LSP with Mason by `:Mason`
### check lsp status
`:LspInfo`

### For python development
```
pip install pynvim
```

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
