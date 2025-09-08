# Repository Guidelines

## Project Structure & Module Organization
- エントリ: `init.lua`
- 基本設定: `lua/core/`（例: `options.lua`, `mappings.lua`, `plugins.lua`, `treesitter.lua`）
- プラグイン設定: `lua/configs/`（例: `telescope.lua`, `gitsigns.lua`）
- キーマップ: `lua/keymap/`（文脈別に分割）
- 自作モジュール: `lua/mymods/`
- テーマ: `lua/theme/`
- スニペット: `snippets/`、テンプレート: `template/<filetype>/`
- ロックファイル: `lazy-lock.json`

## Build, Test, and Development Commands
- 依存同期: `:Lazy sync`（未使用/削除: `:Lazy clean`）
- 健診: `:checkhealth`
- ヘッドレス同期: `nvim -u init.lua --headless "+Lazy! sync" +qa`
- フォーマット: `stylua lua/`
- 動作確認: `nvim`（最小構成比較: `nvim --clean`）

## Coding Style & Naming Conventions
- Lua は Stylua 準拠（tabs/幅4、ダブルクォート、常に呼出括弧）。設定は `stylua.toml` を参照。
- ファイル名は小文字。必要に応じて `-` または `_` を使用（例: `nvim-tree.lua`, `core/utils.lua`）。
- 1 PR の目的は限定し、無関係な一括整形やリネームを避ける。

## Testing Guidelines
- 自動テストは未導入。複雑な `mymods` は最小再現で検証。
- 例: `nvim --headless -c "lua require('mymods').init()" +qa`
- 任意で Busted を使う場合は `spec/*_spec.lua` を推奨し、再現手順を PR に記載。

## Commit & Pull Request Guidelines
- 現状の履歴は短い見出しが多い（例: "update"）。推奨: 命令形 + 簡潔説明 + 任意スコープ（例: `feat(configs): add telescope opts`）。
- PR には目的、影響範囲、手動確認手順、UI 変更時のスクリーンショット/録画、関連 Issue を含める。
- プラグインを追加/更新した場合は `lazy-lock.json` の差分も含める。

## Agent-Specific Notes
- 変更は最小限・関連ファイルのみ。設定は `lua/core/plugins.lua` と `lua/configs/*` に分離。
- フォーマッタは `stylua`。無関係ファイルを触らず、最後に `stylua lua/` を実行。
- `.luarc.jsonc` の `pathStrict` は維持し、型警告の抑制を安易に追加しない。

