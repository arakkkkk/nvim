# emacs
Set-PSReadLineKeyHandler -Key "Ctrl+w" -Function BackwardKillWord
Set-PSReadLineKeyHandler -Key "Ctrl+u" -Function BackwardDeleteLine
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function ForwardDeleteLine
Set-PSReadLineKeyHandler -Key "Ctrl+a" -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key "Ctrl+e" -Function EndOfLine
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardChar
Set-PSReadLineKeyHandler -Key "Ctrl+b" -Function BackwardChar
Set-PSReadLineKeyHandler -Key "Alt+f" -Function NextWord
Set-PSReadLineKeyHandler -Key "Alt+b" -Function BackwardWord
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function PreviousHistory
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function NextHistory
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Key "Ctrl+t" -ScriptBlock {
  wt -w 0 nt
}

# bell
Set-PSReadlineOption -BellStyle None

sal open start-process
sal lg lazygit
function gs { git status }
function gd { git diff }

# fzf
Set-PSReadLineKeyHandler -Key "Ctrl+g" -ScriptBlock {
  $selected = ghq list | fzf
  if ($selected) {
    echo ( Join-Path $(ghq root) $selected)
    Set-Location ( Join-Path $(ghq root) $selected)
  }
}
Set-PSReadLineKeyHandler -Key Ctrl+r -ScriptBlock {
  $selected = (Get-Content $(Get-PSReadLineOption).HistorySavePath) | fzf
  if ($selected) {
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($selected)
  }
}


