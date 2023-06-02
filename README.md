# neovim config by arakkk
## Instration
```sh
https://github.com/arakkkkk/nvim
apt install nvim
```
or

https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package

## Plugins

### LSP
- mason
  - LSP installer
- null-ls
  - Set up formatter and linter
- nvim-lspconfig
  - Activate installed LSP installed by mason

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


