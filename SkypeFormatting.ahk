; Skype Formatting Mapper
; Author : Robert J Gonzales
; Date   : September 12, 2016

; Future ideas:
;  - Check to see if text selected, rather than cheat using cut/paste
;  - Allow monospace to work to wrap selection, or else wrap whole chatbox


; Window starts with <title>
SetTitleMatchMode, 1

; Ctrl-B for Bold
^b::
    Gosub, CheckInSkypeChatBox
    ClipSaved := ClipboardAll
    Clipboard := 
    Send, {CTRLDOWN}x{CTRLUP}
    Send, *{CTRLDOWN}v{CTRLUP}*{Left}
    Clipboard := ClipSaved
    ClipSaved = 
Return

; Ctrl-I for Italics
^i::
    Gosub, CheckInSkypeChatBox
    ClipSaved := ClipboardAll
    Clipboard := 
    Send, {CTRLDOWN}x{CTRLUP}
    Send, _{CTRLDOWN}v{CTRLUP}_{Left}
    Clipboard := ClipSaved
    ClipSaved = 
Return

; Ctrl-Enter for code/monospace
^Enter::
    Gosub, CheckInSkypeChatBox
    Send, {CTRLDOWN}{Home}{CTRLUP}
    SendRaw, {code}
    Send, {CTRLDOWN}{End}{CTRLUP}
    SendRaw, {code}
    Send, {Enter}
Return

CheckInSkypeChatBox:
    IfWinNotActive, Skype
        return
    ControlGetFocus, name, Skype
    IfNotInString, name, TChatRichEdit
        return
    return