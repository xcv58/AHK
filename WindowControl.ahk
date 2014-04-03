;----------------窗口控制-------------------
^!T::WinSet,AlwaysOnTop,Toggle,A
^!C::
    WinGet, transValue, Transparent, A
    if (transValue = "") {
    	WinSet,Transparent,230,A
    } 
    ;WinSet,AlwaysOnTop,Toggle,A 
    WinSet,ExStyle,^0x00000020,A
Return

F12::Click


;!Tab::Send !{Esc}
;#Esc::
;{
;   FormatTime,CurrentDate,,yyyy-MM-dd
;   FormatTime,CurrentDay,,WDay
;   FormatTime,CurrentTime,,HH:mm   ;当前时间格式
;   If CurrentDay = 1
;     CurrentDay = 星期天
;   If CurrentDay = 2
;     CurrentDay = 星期一
;   If CurrentDay = 3
;     CurrentDay = 星期二
;   If CurrentDay = 4
;     CurrentDay = 星期三
;   If CurrentDay = 5
;     CurrentDay = 星期四
;   If CurrentDay = 6
;     CurrentDay = 星期五
;   If CurrentDay = 7
;     CurrentDay = 星期六
;   SetTimer, RemoveToolTip, 5000
;   ToolTip %CurrentDate%`n%CurrentDay%`n%CurrentTime%
;Loop
;{
;    Sleep, 10
;    GetKeyState, state, LWin, P
;    if state = U
;    {
;      ToolTip
;      break
;    }
;}
;return
;RemoveToolTip:
;  SetTimer,RemoveToolTip, Off
;  ToolTip
;return
;}


;---------------更换输入法快捷键-----------------
^#!l::
{
Run control intl.cpl
WinWait, ahk_class #32770
Send ^{Tab}
Send ^{Tab}
Send !c
WinWait, 文本服务和输入语言
Send ^{Tab}
Send ^{Tab}
Send {Tab}
Send {Down}
Send {Down}
Send !c
WinWait, 更改按键顺序
Send !e{Tab}{Down}{Tab}{Down}{Enter}
WinWait, 区域和语言
Send {Enter}
return
}



;---------------持续点击鼠标---------------
^#!c::
   InputBox, interval, Set Interval! , , , 200,100
   if ErrorLevel
   {
     msgbox Bye!
     return
   }
   Loop
   {
     click
     if GetKeyState("Esc", "P")
      break
     Sleep, %interval%000
   } 
return

;---------------调整窗口大小---------------
^!R::
{
   WinGet, Maxed, MinMax, A
   If Maxed = 1
     WinRestore, A
   Winmove,A,,,,A_ScreenWidth*0.618, A_ScreenHeight*0.618
return
}
#NumPad5::CenterWindow()
#NumPad8::ChangeWindowSize(0,+1)
#NumPad2::ChangeWindowSize(0,-1)
#NumPad6::ChangeWindowSize(+1,0)
#NumPad4::ChangeWindowSize(-1,0)
#NumPad9::ChangeWindowSize(+1,+1)
#NumPad1::ChangeWindowSize(-1,-1)
#NumPad7::MaxOrRestoreWindow()
;#NumPad4::
;#NumPad6::


CenterWindow()
{
    WinGetPos,,, Width, Height, A
    WinMove, A,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
    return
}
ChangeWindowSize(w = 1024, h = 800)
{
    WinGet, Maxed, MinMax, A
    If Maxed = 1
      WinRestore, A
    stepLength = 8
    w *= stepLength
    h *= stepLength
    WinGetPos,PositionX,PositionY, Width, Height, A
    WinMove, A,,PositionX-w,PositionY-h,Width+w+w,Height+h+h
return
}
MaxOrRestoreWindow()
{
    WinGet, Maxed, MinMax, A
    If Maxed = 1
      WinRestore, A
    else
      WinMaximize, A
return
}



;~LButton & RButton::Send #``
;~MButton & RButton::AltTab
;~LButton & RButton::AltTab
;~LButton & WheelDown::Send #``
;RButton & WheelDown::AltTab
;RButton & WheelUp::ShiftAltTab


^#!t::
if taskbarToggle := !taskbarToggle
{
   gosub, hideTaskbar
   #Persistent
   SetTimer, deleteTaskbar, 2560
}
else
{
   SetTimer, deleteTaskbar, off
   gosub, showTaskbar
}
return

deleteTaskbar:
   ;IfWinExist,ahk_class Shell_TrayWnd 
   gosub, hideTaskbar
return

^#b::showHideTray(1,taskbarToggle)
;#b::showHideTray(,taskbarToggle)
showHideTray(persistent = 0,taskbarToggle = 0)
{
  global trayToggle
  if trayToggle := !trayToggle
  {
     if taskbarToggle = 1
     {
       SetTimer, deleteTaskbar, off
     }
     else
     {
       ControlClick, Button1, ahk_class Shell_TrayWnd
     }
     WinShow ahk_class NotifyIconOverflowWindow
     WinGetPos, ,,notifyWidth,notifyHeight,ahk_class NotifyIconOverflowWindow
     WinSet, Transparent, 240, ahk_class NotifyIconOverflowWindow
     ;WinMove, ahk_class NotifyIconOverflowWindow, ,A_ScreenWidth - notifyWidth - 48, 48
     ;WinMove, ahk_class NotifyIconOverflowWindow,,,,256,172
     WinMoveBigMonitor("ahk_class NotifyIconOverflowWindow", 0.2, 0.15)
     if persistent != 1
       SetTimer, hideTray, 5120
  }
  else
  {
     SetTimer, hideTray, off
     ;ControlClick, Button1, ahk_class Shell_TrayWnd
     gosub, hideTray
     trayToggle := !trayToggle
  }
  return
}


hideTray:
   SetTimer, hideTray, off
   WinHide ahk_class NotifyIconOverflowWindow
   if taskbarToggle = 1
   {
     SetTimer, deleteTaskbar, 2560
     gosub, hideTaskbar
   }
   trayToggle := !trayToggle
return

showTaskbar:
   WinShow ahk_class Button
   WinShow ahk_class Shell_TrayWnd
return

hideTaskbar:
   WinHide ahk_class Button
   WinHide ahk_class Shell_TrayWnd
return

^!z::
    WinMinimizeAll
    SendMessage,0x112,0xF170,2,,Program Manager ;关闭显示器。0x112:WM_SYSCOMMAND，0xF170:SC_MONITORPOWER。2：关闭，-1：开启显示器
    Run nircmd.exe mutesysvolume 1 ;静音
return

^#!s::
{
   Sleep 5000
   SendMessage,0x112,0xF170,2,,Program Manager ;关闭显示器。0x112:WM_SYSCOMMAND，0xF170:SC_MONITORPOWER。2：关闭，-1：开启显示器
   return
}


;----------------隐藏标题栏---------------
#F11::
{
WinSet, Style, ^0xC00000, A
If WinActive("ahk_class AcrobatSDIWindow")
{
WinRestore, A
Send ^{h}
Send {F9}
Send #{Up}
}
return
}
#F12::WinSet, Style, ^0x40000, A

NoTitleBar()
{
WinSet, Style, ^0xC00000, A
return
}

;----------------窗口透明----------------
^!=::
    trans += 5
    Gosub, SetTrans
return

^!-::
    If trans = 
      trans = 255
    trans -= 5
    Gosub, SetTrans
return
    
^!0::
    WinGet, transValue, Transparent, A
    if (transValue = "") {
        trans = 160
        Gosub, SetTrans
    } else {
        WinSet, Transparent, OFF, A
    }
return
    
SetTrans:
    if (trans = "") {
        ; Default transparent value
        trans := 160
    }
    if (trans <= 0) {
        trans = 0
    }
    if (trans >= 255) {
        trans := 255
        WinSet, Transparent, OFF, A
    } else {
        WinSet, Transparent, %trans%, A
    }
return
