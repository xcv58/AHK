; ------------------用中键激活并滚动鼠标下的窗口-------------------------------
#If WinActive("ahk_class ytWindow")
#WinActivateForce
;WheelDown::
;   WinGetActiveStats,Title,Width,Height,x,y
;   MouseGetPos,,,win ; Get the window below the mouse
;   WinActivate, ahk_id %win%
;   send {WheelDown}
;   WinActivate, %Title%
;return
;
;WheelUp::
;   WinGetActiveStats,Title,Width,Height,x,y
;   MouseGetPos,,,win ; Get the window below the mouse
;   WinActivate, ahk_id %win%
;   send {WheelUp}
;   WinActivate, %Title%
;return

WheelDown::
    MouseGetPos,,,winID
    ControlClick,,ahk_id %winID%,,WheelDown
return

WheelUp::
    MouseGetPos,,,winID
    ControlClick,,ahk_id %winID%,,WheelUp
return

;WheelUp::
;    MouseGetPos,,,winID,winCN,2
;Msgbox %winID%  %winCN%
;;    ControlClick,, {up},ahk_id %winID%
;     ControlClick,,ahk_id %winCN%,,WU
;return
#If
