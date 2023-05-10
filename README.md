# neovim config by arakkk
## Plugins

### LSP
- mason
  - LSP installer
- mason-lspconfig
  - Set up LSP innstaller
- null-ls
  - Set up formatter and linter
- nvim-lspconfig
  - Activate installed LSP installed by mason

## option
### How to add LSP
1. Select and install LSP with Mason by `:Mason`
2. Add `lua/configs/mason-lspconfig`
3. Add `lua/configs/null-ls` If you use as a formatter or/and linter.
### check lsp status
`:NullLsInfo`
`:LspInfo`

### commands
`:s/^/|/g`
`:s/$/|/g`
`:s/,/|/g`

### Register
- "
- *
  - clipboard
- +
  - clipboard
- r
  - command to quick run
- c
  - command to run with !


