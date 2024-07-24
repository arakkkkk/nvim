#Requires AutoHotkey v2
set_ignore_applications() {
  GroupAdd "IgnoreApplications", "ahk_class CASCADIA_HOSTING_WINDOW_CLASS" ; Windows Terminal
  GroupAdd "IgnoreApplications", "ahk_exe Code.exe" ; Visual Studio Code
  GroupAdd "IgnoreApplications", "ahk_exe RLogin.exe" ; RLogin
  GroupAdd "IgnoreApplications", "ahk_exe WindowsTerminal.exe" ; Terminal
}

main() {
  ListLines 0

  SetControlDelay 0
  SetKeyDelay -1
  SetWinDelay 0
  SendMode "Input"

  set_ignore_applications()
}

main()
#UseHook

;; Set suspend toggle key "<ctrl>F1"
#SuspendExempt
^F1::Suspend
#SuspendExempt False

#HotIf not WinActive("ahk_group IgnoreApplications")

;
; <ctrl>b
; move cursor backward
;
^b:: Send "{Left}"

;
; <shift><ctrl>b
; move cursor backward selecting chars
;
+^b:: Send "+{Left}"

; <shift+ctrl+f>
; Moves cursor one character to the right while selecting text
;+^f::Send "+{Right}"

; <ctrl+p>
; Moves cursor one line up
^p::Send "{Up}"

; <shift+ctrl+p>
; Moves cursor one line up while selecting text
+^p::Send "+{Up}"

; <ctrl+n>
; Moves cursor one line down
^n::Send "{Down}"

; <shift+ctrl+n>
; Moves cursor one line down while selecting text
+^n::Send "+{Down}"

; <ctrl+d>
; Deletes the character to the right of the cursor
^d::Send "{Del}"

; <ctrl+h>
; Deletes the character to the left of the cursor (Backspace)
^h::Send "{BS}"

; <ctrl+a>
; Moves cursor to the beginning of the current line
^a::Send "{Home}"

; <shift+ctrl+a>
; Moves cursor to the beginning of the current line while selecting text
+^a::Send "+{Home}"

; <ctrl+e>
; Moves cursor to the end of the current line
^e::Send "{End}"

; <shift+ctrl+e>
; Moves cursor to the end of the current line while selecting text
+^e::Send "+{End}"

; <shift+alt+f>
; Moves cursor one word forward while selecting text
; +!f::Send "+^{Right}"

; <ctrl+k>
; Deletes characters from the cursor to the end of the line
^k::
{
    Send "{ShiftDown}{End}{ShiftUp}"
    Sleep 50
    Send "{Del}"
    Return
}

; <ctrl+u>
; Deletes characters from the cursor to the beginning of the line
^u::
{
    Send "{ShiftDown}{Home}{ShiftUp}"
    Sleep 50
    Send "{Del}"
    Return
}

; <ctrl+m>
; Inserts a new line (Enter)
^m::Send "{Enter}"

; <ctrl+\>
; Selects all text
^\::Send "^a"

; <alt+f>
; Opens the find dialog
; !f::Send "^f"

; <alt+c>
; Copies the selected text
; !c::Send "^c"

; <alt+x>
; Cuts the selected text
; !x::Send "^x"

; <alt+v>
; Pastes text from the clipboard
; !v::Send "^v"

; <alt+s>
; Saves the current document or file
; !s::Send "^s"

; <alt+n>
; Opens a new window
; !n::Send "^n"

; <alt+t>
; Opens a new tab
; !t::Send "^t"

; <alt+w>
; Closes the current tab
; !w::Send "^w"

; <alt+r>
; Reloads the current page or document
; !r::Send "^r"

; <alt+l>
; Focuses on the URL bar in a browser
; !l::Send "^l"

