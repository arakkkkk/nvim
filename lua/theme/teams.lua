#Requires AutoHotkey v2
;;;;;;;;;;;;;;;;;;;;;
;; for teams
;;;;;;;;;;;;;;;;;;;;;
#HotIf WinActive("ahk_exe ms-teams.exe")
; <enter>
; Break line
enter::Send "+{Enter}"

; <ctrl-enter>
; Send
^enter::Send "{Enter}"

;;;;;;;;;;;;;;;;;;;;;
;; Messenger
;;;;;;;;;;;;;;;;;;;;;
GroupAdd "MessengerApplications", "ahk_exe slack.exe"
GroupAdd "MessengerApplications", "ahk_exe ms-teams.exe"
#HotIf WinActive("ahk_group MessengerApplications")
; <ctrl-w>
; Delete word
^w::Send "^{Delete}"

; <ctrl-f>
; Moves cursor right
; ^f::Send "{Right}"


