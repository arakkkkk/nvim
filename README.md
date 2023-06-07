# neovim config by arakkk
## Instration
```sh
https://github.com/arakkkkk/nvim
sudo apt install nvim
```
https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

## Plugins

### LSP
- mason
  - LSP manual installer
- mason-lspconfig
  - LSP auto installer(ensure_installed)
- null-ls
  - Set up formatter and linter
- nvim-lspconfig
  - Configuration for lsp functions

## option
### How to add LSP
1. Select and install LSP with Mason by `:Mason`
2. Add `lua/configs/null-ls` If you use as a formatter or/and linter.
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


