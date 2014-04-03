; PerfectWorks 修改自 AHK帮助文档中的Easy Window Dragging (requires XP/2k/NT)
; 加入了ALT+左键双击的功能
;----------------------------------------------------------------------------
; 仿KDE下窗口控制的AHK脚本
; ALT+右键最小化窗口
; ALT+左键拖拽窗口
; ALT+中键关闭窗口
; ALT+左键双击切换最大化和普通状态


;ifexist trayicon.ico
;Menu, TRAY, Icon, trayicon.ico
;Menu, Tray, NoStandard
;Menu, Tray, Add, &Power by Appinn - 小众软件出品, Appinn
;Menu, Tray, Add, 退出(&X), Exit
;return
;
;Exit:
;Exitapp
;return
;
;Appinn:
;run http://www.appinn.com/
;return

^!MButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinClose,ahk_id %EWD_MouseWin%
return

;^!LButton::
;CoordMode, Mouse  ; Switch to screen/absolute coordinates.
;MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
;Send {Down}
;return

#RButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinMinimize,ahk_id %EWD_MouseWin%
return

#LButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGet,winstat,MinMax,ahk_id %EWD_MouseWin%
;if(winstat <> 1)
{
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
;        if(winstat =1)
;        {
;          WinRestore, ahk_id %EWD_MouseWin%
;        }
	SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
}
Keywait, LButton, , t0.2 ; 双击判断，等待第二次按键
if errorlevel <> 1 ; 
{
	Keywait, LButton, d, t0.1 ; 判断第二次按键是否是鼠标左键
	if errorlevel = 0
	{
		if(winstat = 1) ; 切换窗口状态
			WinRestore,ahk_id %EWD_MouseWin%
		else
			WinMaximize,ahk_id %EWD_MouseWin%
	}
}

return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
	SetTimer, EWD_WatchMouse, off
	return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
	SetTimer, EWD_WatchMouse, off
	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGet,winstat,MinMax,ahk_id %EWD_MouseWin%
   if((EWD_MouseX - EWD_MouseStartX)*(EWD_MouseY - EWD_MouseStartY) != 0)
   {
        if(winstat = 1)
        {
          WinRestore, ahk_id %EWD_MouseWin%
        }
   }
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
if EWD_MouseY = 0
{
   ;WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
   SetTimer, EWD_WatchMouse, off
   WinMaximize,ahk_id %EWD_MouseWin% 
   return
}
;if EWD_MouseX > 1270
;{
;   SetTimer, EWD_WatchMouse, off
;   WinMove,ahk_id %EWD_MouseWin%,,640,0,640,1024
;   return
;}
;else if EWD_MouseX < 32
;{
;   if EWD_MouseX > 0
;   {
;     SetTimer, EWD_WatchMouse, off
;     WinMove,ahk_id %EWD_MouseWin%,,0,0,640,1024
;     return
;   }
;   else if EWD_MouseX > -32
;   {
;      SetTimer, EWD_WatchMouse, off
;      WinMove,ahk_id %EWD_MouseWin%,,-720,0,720,900
;      return
;   }
;}
;if EWD_MouseX < -1420
;{
;   WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
;   SetTimer, EWD_WatchMouse, off
;   WinMove,ahk_id %EWD_MouseWin%,,-1440,0,720,900
;   return
;}
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
   ;Progress,x0 y0 b fs64 zh0 W1280 CWffffff CTFF0000,%EWD_MouseX% %EWD_MouseY%,,modalState, Comic Sans MS
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return