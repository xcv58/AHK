^!j::MoveCursor(0,1)
^!h::MoveCursor(-1,0)
^!l::MoveCursor(1,0)
^!k::MoveCursor(0,-1)
^!NumPad2::MoveCursor(0,1)
^!NumPad4::MoveCursor(-1,0)
^!NumPad6::MoveCursor(1,0)
^!NumPad8::MoveCursor(0,-1)
^!NumPad7::MoveCursor(-1,-1)
^!NumPad9::MoveCursor(1,-1)
^!NumPad1::MoveCursor(-1,1)
^!NumPad3::MoveCursor(1,1)
^!NumPad5::Click
^!u::MouseClick, Left
^!i::MouseClick, Left
^!o::MouseClick, Right
^!p::SetMouseStep(2)
^!n::SetMouseStep(-2)

;按下鼠标左键
^!,::
SendEvent {Click , , down}
;SetTimer, RemoveToolTip, off
;SetTimer, RemoveToolTipByCtrl, off
;ToolTip, ClickDown!
return
;松开鼠标左键
^!.::
SendEvent {click , , up}
;SetTimer, RemoveToolTip, 100
return

SetMouseStep(d = 0)
{
   global step
   if step = 
     step := 32
   if d = 1
   {
     if step > 255
     return
     step += 16
   }
   if d = -1
   {
     if step < 17
     return
     step -= 16
   }
   if d = 2
   {
     if step > 200
     return
     step *= 2
   }
   if d = -2
   {
     if step < 2
     return
     step /= 2
   }
   if d = 0
   {
     step := 32
     return
   }
   ToolTip, step = %step%
   SetTimer, RemoveToolTip, 1000
   SetTimer, RemoveToolTipByCtrl, 100
   SetTimer, setDefaultStep, 100
   return
   
setDefaultStep:
   GetKeyState, state, Control, P
   if state = U
   {
     SetTimer, setDefaultStep, off
     step := 32
   }
return

RemoveToolTipByCtrl:
   GetKeyState, state, Control, P
   if state = U
   {
     SetTimer, RemoveToolTipByCtrl, off
     ToolTip
   }
return
}

MoveCursor(x = 0,y = 0)
{
  global step
  if step = 
    step := 32
  global lastMove
  currentMove := x*10 + y
  if(step >= 9)
  {
    if(lastMove = currentMove)
    {
       SetMouseStep(1)
    }
    else
    {
       SetMouseStep(-2)
    }
  }
  lastMove := currentMove
  x := x*step
  y := y*step
  {
    CoordMode, Mouse, Screen
    MouseGetPos, xpos,ypos
    x += xpos
    y += ypos
    DllCall("SetCursorPos", int, x, int, y)
    ToolTip, %x% %y% `nstep = %step%
    SetTimer, RemoveToolTip, 1000
    SetTimer, RemoveToolTipByCtrl, 100
    ;MouseMove, %x%, %y%,,R
    ;ToolTip, %xpos%  %ypos%
  }
  return
}

SetMoveStatus:
  SetTimer, SetMoveStatus, off
    lastMove = 
return


RemoveToolTip:
  SetTimer,RemoveToolTip, Off
  ToolTip
return
