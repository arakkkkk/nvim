local lsp = {
  DiagnosticError = { fg = C.red_1 },
  DiagnosticHint = { fg = C.yellow_1 },
  DiagnosticInfo = { fg = C.white_2 },
  DiagnosticWarn = { fg = C.orange_1 },
  DiagnosticInformation = { fg = C.yellow, bold = true },
  DiagnosticTruncateLine = { fg = C.white_1, bold = true },
  DiagnosticUnderlineError = { sp = C.red_2, undercurl = true },
  DiagnosticUnderlineHint = { sp = C.red_2, undercurl = true },
  DiagnosticUnderlineInfo = { sp = C.red_2, undercurl = true },
  DiagnosticUnderlineWarn = { sp = C.red_2, undercurl = true },
  LspDiagnosticsFloatingError = { fg = C.red_1 },
  LspDiagnosticsFloatingHint = { fg = C.yellow_1 },
  LspDiagnosticsFloatingInfor = { fg = C.white_2 },
  LspDiagnosticsFloatingWarn = { fg = C.orange_1 },
  LspFloatWinBorder = { fg = C.white_1 },
  LspFloatWinNormal = { fg = C.fg, bg = C.black_1 },
  LspReferenceRead = { fg = C.none, bg = C.grey_5 },
  LspReferenceText = { fg = C.none, bg = C.grey_5 },
  LspReferenceWrite = { fg = C.none, bg = C.grey_5 },
  ProviderTruncateLine = { fg = C.white_1 },
}

return lsp

