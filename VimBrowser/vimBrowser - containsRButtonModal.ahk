;twitter里的快捷键
;f,r,t,m,n,Enter,?,j,k,Space,/,.,gh,gr,gp,gf,gm,gu
;Google Reader
;j,k,Space,+Space,n,p,+x,+o
;s,l,t,e,+s,+d,v,c,+c,m,+a,+t
;r,f,u,1,2,/,a,=,-
;gh,ga,gs,g+s,gt,g+t,gd,gf,g+f,gc,ge,gp

;剩余按键
;b,c,x,y,z
#Include %A_ScriptDir%
;-----------------在浏览器里的快捷键-------------------
#If WinActive("ahk_class Chrome_WidgetWin_0") or WinActive("ahk_class IEFrame") or WinActive("ahk_class MozillaWindowClass") or WinActive("ahk_class AcrobatSDIWindow")
; or WinActive("ahk_class OpusApp")
F4::SendInput ^w
;^b::
;   origin := Clipboard
;   Clipboard = chrome-extension://eemcgdkfndhakfknompkggombfjjjeno/main.html
;   SendInput ^t
;   SendInput ^v
;   sleep 500
;   SendInput `n
;   sleep 1000
;   Clipboard := origin
;return
;--------vim模式待续------------
j::determineInput("j")
k::determineInput("k")
h::determineInput("h")
l::determineInput("l")
i::determineInput("i")
esc::determineInput("esc")
a::determineInput("a")
b::determineInput("b")
c::determineInput("c")
d::determineInput("d")
e::determineInput("e")
f::determineInput("f")
g::determineInput("g")
m::determineInput("m")
n::determineInput("n")
o::determineInput("o")
p::determineInput("p")
q::determineInput("q")
r::determineInput("r")
s::determineInput("s")
t::determineInput("t")
u::determineInput("u")
v::determineInput("v")
w::determineInput("w")
x::determineInput("x")
y::determineInput("y")
z::determineInput("z")
F1::determineInput("F1")
F2::determineInput("F2")
F3::determineInput("F3")
F6::determineInput("F6")
+g::determineInput("+g")
!j::determineInput("!j")
!k::determineInput("!k")
!l::determineInput("!l")
!h::determineInput("!h")
1::determineInput("1")
2::determineInput("2")
3::determineInput("3")
4::determineInput("4")
5::determineInput("5")
6::determineInput("6")
7::determineInput("7")
8::determineInput("8")
9::determineInput("9")
0::determineInput("0")
-::determineInput("-")
=::determineInput("=")
Enter::determineInput("Enter")
^RButton::
!RButton::
+RButton::
#RButton::
determineInput("RButton")
AppsKey::determineInput("RButton")
;LButton::determineInput("LButton")
;!d::SendInput !d
determineInput(input)
;{
;   SetStoreCapslockMode Off
;   GetKeyState, CapsLockState, CapsLock, T
;   if CapsLockState = D
;   {
;     msgbox %input%
;   }
;   else
;   {
;     msgbox %input%
;   }
;   
;}
;;
;;
;;
;doInput(input)
{
   SetStoreCapslockMode Off
   GetKeyState, CapsLockState, CapsLock, T
   global modal
   if modal = 
     normalInitiate()
   if input = F1
   {
     SendInput ^t
     insertInitiate()
   }
   else if input = F2
   {
     SendInput ^+{Tab}
     normalInitiate()
   }
   else if input = F3
   {
     SendInput ^{Tab}
     normalInitiate()
   }
   else if input = F6
   {
     SendInput ^T
     normalInitiate()
   }
   else if modal = normal
   {
     if input = j
       SendInput {down}
     else if input = k 
       SendInput {up}
     else if input = h
       SendInput {left}
     else if input = l 
       SendInput {right}
     else if input = q
       SendInput ^{w}
     else if input = a 
       SendInput ^+{Tab}
     else if input = w
       SendInput {PgUp}
     else if input = s
       SendInput {PgDn}
     else if input = d
       SendInput ^{Tab}
     else if input = r
       SendInput {F5}
;     else if input = f
;       SendInput ^{f}
     else if input = t
       SendInput ^t
     else if input = u
       SendInput ^T
;     else if input = o
;       SendInput {Enter}
;     else if input = n
;       SendInput !{Right}
;     else if input = p
;       SendInput !{Left}
     else if input = z
        zoomModInitiate()
     else if input = 1
       SendInput ^{1}
     else if input = 2
       SendInput ^{2}
     else if input = 3
       SendInput ^{3}
     else if input = 4
       SendInput ^{4}
     else if input = 5
       SendInput ^{5}
     else if input = 6
       SendInput ^{6}
     else if input = 7
       SendInput ^{7}
     else if input = 8
       SendInput ^{8}
     else if input = 9
       SendInput ^{9}
     else if input = 0
       SendInput ^{0}
;     else if input = -
;       SendInput ^{-}
;     else if input = =
;       SendInput ^{=}
     else if input = g
     {
       if CapsLockState=D
       {
         SendInput {END}
       }
       else
         gModInitiate()
       return
     }
     else if input = RButton
     {
       Send {%input%}
       RButtonInitiate()
     }
     else if input = +G
     {
       if CapsLockState=D
       {
         gModInitiate()
       }
       else
         SendInput {END}
     }
     else if input = !j
     {
         SendInput {j}
     }
     else if input = !k
     {
         SendInput {k}
     }
     else if input = !h
     {
         SendInput {h}
     }
     else if input = !l
     {
         SendInput {l}
     }
     else if input = i
       insertInitiate()
     else if input = e
       enInsertInitiate()
     else if input = esc
       SendInput {esc}
     else SendInput {%input%}
   }
   else if modal = gMod
   {
     if input = g
     {
       SendInput {home}
     }
     else if input = l
     {
       SendInput s
       SendInput S
       SendInput l
     }
     else if input = j
     {
       SendInput j
     }
     else if input = k
     {
       SendInput k
     }
     else if input = w
     {
       wwwModInitiate()
       return
     }
     else
     {
       SendInput g
       SendInput {%input%}
     }
     normalInitiate()
   }
   else if modal = insert
   {
     if input = esc
       normalInitiate()
     else if input = +g
       SendInput {G}
     else if input = !j
       SendInput {down}
     else if input = !k
       SendInput {up}
     else if input = !h
       SendInput {left}
     else if input = !l
       SendInput {right}
     else
       SendInput {%input%}
   }
   else if modal = enInsert
   {
     if input = esc
       normalInitiate()
     else if input = +g
       SendInput {G}
     else
       SendInput {%input%}
   }
   else if modal = wwwMod
   {
     if input = esc
       normalInitiate()
     else if input = Enter
     {
       SendInput {Enter}
       normalInitiate()
     }
     else
       SendInput {%input%}
   }
   else if modal = zoomMod
   {
     if input = o
       SendInput ^{=}
     else if input = i
       SendInput ^{-}
     else if input = z
     {
       SendInput ^{0}
       normalInitiate()
     }
     else
       normalInitiate()
   }       
   else if modal = RButtonMod
   {
      if input = esc
      {
        ;SendInput {esc}
        normalInitiate()
      }
      else if input = RButton
      {
        SendEvent {%input%}
        return
      }
      else
      {
    ;    msgbox %input%
        Send {%input%}
      }
      normalInitiate()
   }
   return
}


normalInitiate(time = 300)
{
   global modal
   if modal != normal
   {
     modal = normal
     enIME()
     RestoreCursors()
     notify("Normal")
     clsNotify(time)
   }
}
insertInitiate()
{
   global modal
   if modal != insert
   {
     modal = insert
     zhIME()
     SetSystemCursorBlack()
     notify("Insert")
   }
}
enInsertInitiate()
{
   global modal
   if modal != enInsert
   {
     modal = enInsert
     notify("enInsert")
   }
}
wwwModInitiate()
{
   global modal
   if modal != wwwMod
   {
     modal = wwwMod
     notify("wwwMod")
     SendInput ^{t}
   }
}
gModInitiate()
{
   global modal
   if modal != gMod
   {
     modal = gMod
     notify("gMod")
   }
}
zoomModInitiate()
{
   global modal
   if modal != zoomMod
   {
     modal = zoomMod
     notify("zoomMod")
   }
}
RButtonInitiate()
{
   global modal
   if modal != RButtonMod
   {
      modal = RButtonMod
      notify("RButtonMod")
   }
}

;;; GUI
;notify(text, time = 512)
;{
;   ; Progress, y980 b2 fs10 zh0 WS800, %text%, , , Verdana
;   ;Progress,x0 y0 b fs32 zh0 W200 CWffffff CTFF0000,%text%,,modalState, Comic Sans MS
;   Progress,x0 y0 b fs64 zh0 W1280 CWffffff CTFF0000,%text%,,modalState, Comic Sans MS
;   WinSet,ExStyle,^0x00000020,modalState
;   WinSet, TransColor,FFFFFF, modalState
;;   WinSet, Transparent,128, modalState
;   return
;}
;clsNotify(time = 512)
;{
;   Sleep, %time%
;   Progress, Off
;   return
;}
notify(text, time = 30)
{
   SetTimer, RemoveToolTip, %time%000
   ;bigMonitorWidth := getBigMonitorWidth()
   WinGetPos,,, Width, Height, A
   ToolTip, %text%, Width*0.38, 18
;A_ScreenHeight*0.38
return
}
clsNotify(time = 512)
{
   SetTimer, RemoveToolTip, %time%
return
}
;RemoveToolTip:
;  SetTimer,RemoveToolTip, Off
;  ToolTip
;return

;---------------------vim模式----------------------
^z::
  if modal = normal
    SendInput ^T
  else if modal = insert
    SendInput ^z
return
#If
