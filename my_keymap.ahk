#InstallKeybdHook
#UseHook
#Include IME.ahk

GroupAdd,game,ahk_exe VALORANT-Win64-Shipping.exe
GroupAdd,game,ahk_exe GeForceNOW.exe
GroupAdd,vim_like,ahk_exe mintty.exe
GroupAdd,idea_vim,ahk_exe idea64.exe
GroupAdd,idea_vim,ahk_exe studio64.exe
GroupAdd,vim_like,ahk_group idea_vim
GroupAdd,game_and_vim_like,ahk_group game
GroupAdd,game_and_vim_like,ahk_group vim_like
;LogFile = %A_ScriptDir%\log.txt
;FileDelete, %LogFile%
return


#IfWinNotActive,ahk_group game
*vk1C::
SetKeyDelay -1
Send {Blind}{RCtrl DownR}
vk1C_time := A_TickCount
;FileAppend, down %vk1C_time% %A_TickCount%`n, %LogFile%
vk1C_key := ""
Input,vk1C_key,B I0 L1 M V,{Left}{Right}{Up}{Down}{Home}{End}{Backspace}
if (ErrorLevel != 0)
  vk1C_key := "end"
return

*vk1C up::
SetKeyDelay -1
Input
Send {Blind}{RCtrl up}
;FileAppend, up %vk1C_time% %A_TickCount%`n, %LogFile%
if (vk1C_key == "" && A_TickCount - vk1C_time < 150)
  Send,{vk1C}
vk1C_key := ""
return

*vk1D::
SetKeyDelay -1
Send {Blind}{RCtrl DownR}
vk1D_time := A_TickCount
vk1D_key := ""
Input,vk1D_key,B I0 L1 M V,{Left}{Right}{Up}{Down}{Home}{End}{Backspace}
if (ErrorLevel != 0)
  vk1D_key := "end"
return

*vk1D up::
SetKeyDelay -1
Input
Send {Blind}{RCtrl up}
if (vk1D_key = "" && A_TickCount - vk1D_time < 150)
  Send,{vk1D}
vk1D_key := ""
return
#IfWinNotActive

#IfWinNotActive,ahk_group game_and_vim_like
>^b::
if IME_GetConverting() == 0 {
  Send,{Left}
} else {
  Send,^b
}
return

>^f::
if IME_GetConverting() == 0 {
  Send,{Right}
} else {
  Send,^f
}
return

>^p::
if IME_GetConverting() == 0 {
  Send,{Up}
} else {
  Send,^p
}
return

>^n::
if IME_GetConverting() == 0 {
  Send,{Down}
} else {
  Send,^n
}
return

>^a::
if IME_GetConverting() == 0 {
  Send,{Home}
} else {
  Send,^a
}
return

>^e::
if IME_GetConverting() == 0 {
  Send,{End}
} else {
  Send,^e
}
return

>^h::
if IME_GetConverting() == 0 {
  Send,{Backspace}
} else {
  Send,^h
}
return

>^d::
if IME_GetConverting() == 0 {
  Send,{Delete}
} else {
  Send,^d
}
return

>^u::
if IME_GetConverting() == 0 {
  Send,{Backspace}+{Home}{Backspace}
} else {
  Send,^u
}
return

>^k::
if IME_GetConverting() == 0 {
  Send,+{End}{Backspace}
} else {
  Send,^k
}
return

>^w::
if IME_GetConverting() == 0 {
  Send,+^{Left}{Backspace}
} else {
  Send,^w
}
return

>^j::
if IME_GetConverting() == 0 {
  Send,{Enter}
} else {
  Send,^j
}
return

;LCtrl & F1::return
;LCtrl::Send,{Esc}
;vkF0::Send,{Esc}

^escape::
Send,{Esc}
return

*LCtrl::
SetKeyDelay -1
Send {Blind}{LCtrl DownR}
LCtrl_time := A_TickCount
LCtrl_key := ""
Input,LCtrl_key,B I0 L1 M V,{Left}{Right}{Up}{Down}{Home}{End}{Backspace}
if (ErrorLevel != 0)
  LCtrl_key := "end"
return

*LCtrl up::
SetKeyDelay -1
Input
Send {Blind}{LCtrl up}
if (LCtrl_key = "" && A_TickCount - LCtrl_time < 150)
  Send,{Esc}
LCtrl_key := ""
return
#IfWinNotActive


#IfWinActive,ahk_group vim_like
LCtrl & F1::return
LCtrl::Send,{Esc}{vk1D}
vkF0::Send,{Esc}{vk1D}
#IfWinActive


#IfWinActive,ahk_group idea_vim
>^p::
if IME_GetConverting() == 0 {
  Send,{Up}
} else {
  Send,^p
}
return

>^n::
if IME_GetConverting() == 0 {
  Send,{Down}
} else {
  Send,^n
}
return

>^j::
if IME_GetConverting() == 0 {
  Send,{Enter}
} else {
  Send,^j
}
return
#IfWinActive


#IfWinActive,ahk_group game
*vk1C::Send,{RAlt Down}
*vk1C Up::Send,{RAlt  Up}
*vk1D::Send,{RAlt Down}
*vk1D Up::Send,{RAlt  Up}
#IfWinActive
