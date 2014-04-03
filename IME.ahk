^#!e::enIME()
^#!z::zhIME()

;^!i::zhIME()
;^!o::enIME()

enIME()
{
   ;SendInput ^{!}
   SendInput ^{@}
   ;SendInput ^{space}
   ;SwitchIME("00000409")
   return
}

zhIME()
{
;   SwitchIME("E0210804")
   SendInput ^{!}
   ;SendInput ^{space}
   return
}
;0x8040804
SwitchIME(dwLayout)
{
   ; DllCall("SendMessage", UInt, ahk_class Notepad, UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1))
    DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1))
}


;----------------------------不给力啊,老师!---------------------------
;Gui, Add, GroupBox, x6 y4 w230 h10 , 已安装的输入法(双击切换)
;Gui, Add, ListView, r20 x6 y24 w230 h120 vListIME gSetIME ,序号|键盘布局|名称
;Gui, Add, Button, x6 y144 w80 h30 gPreIME, 上一输入法
;Gui, Add, Button, x156 y144 w80 h30 gNextIME, 下一输入法
;Gui, Add, Button, x86 y144 w70 h30 gStateIME, 当前状态
;; Generated using SmartGUI Creator 4.0
;Gui, Show, x397 y213 h190 w247,输入法切换
;Gosub,ReadIME
;Return
;GuiClose:
;ExitApp
;ReadIME:
;LV_ModifyCol(3,300)
;Loop,HKEY_USERS,.DEFAULT\Keyboard Layout\Preload, 1, 1
;{
;    RegRead,Layout
;    RegRead,IMEName,HKEY_LOCAL_MACHINE,SYSTEM\CurrentControlSet\Control\Keyboard Layouts\%Layout%,Layout Text
;    RegRead,Layout
;     ListContent=%A_LoopRegName%丨%IMEName%丨 %Layout%
;    LV_Insert(1,"Vis",A_LoopRegName,Layout,IMEName)
;}
;Return
;StateIME:
;Result:=DllCall("GetKeyboardLayout","int",0,UInt)
;SetFormat, integer, hex
;Result += 0
;SetFormat, integer, D
;MsgBox 当前键盘布局为 %Result%
;return
;
;SetIME:
;If (A_GuiEvent<>"DoubleClick")
;{
;    Return
;}
;Gui,Submit,Nohide
;LV_GetText(Layout,A_EventInfo,2)
;;~ MsgBox %Layout%
;
;SwitchIME(Layout)
;Return
;
;SwitchIME(dwLayout)
;{
;    DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str, dwLayout, UInt, 1))
;}
;
;NextIME:
;DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("ActivateKeyboardLayout", UInt, 1, UInt, 256))
;;-- 对当前窗口激活下一输入法
;Return
;PreIME:
;DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("ActivateKeyboardLayout", UInt, 0, UInt, 256))
;;-- 对当前窗口激活上一输入法
;Return


;;-------------------------------------不给力啊老师-----------------------
;#Persistent
;Gui +LastFound
;hWnd := WinExist()
;DllCall( "RegisterShellHookWindow", UInt,hWnd )
;MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
;OnMessage( MsgNum, "ShellMessage")
;Return
;ShellMessage( wParam,lParam ) {
;  If ( wParam = 1 ) 
;  {
;    WinGetclass, WinClass, ahk_id %lParam%
;    If Winclass in Maxthon2_Frame,Notepad,OpusApp,XLMAIN        ;需要开启中文输入的窗口类名
;    { 
;      winget,WinID,id,ahk_class %WinClass%
;      SetLayout("e0210804",WinID)         ;E0200804是QQ拼音代码，系统内安装的输入法代码可以在注册表HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts查到
;    }
;}
;}
;SetLayout(Layout,WinID){
;DllCall("SendMessage", "UInt", WinID, "UInt", "80", "UInt", "1", "UInt", (DllCall("LoadKeyboardLayout", "Str", Layout, "UInt", "257")))
;}
