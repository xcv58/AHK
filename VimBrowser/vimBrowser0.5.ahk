;----------------VIM式快捷键------------------
!j::send {down}
!k::send {up}
!h::send {left}
!l::send {right}


;-----------------在浏览器里的快捷键-------------------
#If WinActive("ahk_class Chrome_WidgetWin_0") or WinActive("ahk_class IEFrame") or WinActive("ahk_class MozillaWindowClass")
F4::send ^w
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
!j::send j
!k::send k
!l::send l
!h::send h
!d::send !d

^z::
  if modal = normal
    send ^T
  else if modal = insert
    send ^z
return

determineInput(input)
{
   SetStoreCapslockMode Off
   GetKeyState, CapsLockState, CapsLock, T
   global modal
   if modal = 
     normalInitiate()
   if input = F1
   {
     send ^t
     insertInitiate()
   }
   else if input = F2
   {
     send ^+{Tab}
     normalInitiate()
   }
   else if input = F3
   {
     send ^{Tab}
     normalInitiate()
   }
   else if input = F6
   {
     send ^T
     normalInitiate()
   }
   else if modal = normal
   {
     if input = j
       send {down}
     else if input = k 
       send {up}
     else if input = h
       send {left}
     else if input = l 
       send {right}
     else if input = g
     {
       if CapsLockState=D
       {
         send {END}
       }
       else
         gModInitiate()
     }
     else if input = +G
     {
         send {END}
     }
     else if input = i
       insertInitiate()
     else if input = esc
       send {esc}
     else send {%input%}
   }
   else if modal = gMod
   {
     if input = g
     {
       send {home}
     }
     else if input = l
     {
       send s
       send S
       send l
     }
     else if input = j
     {
       send j
     }
     else if input = k
     {
       send k
     }
     else 
     {
       send g
       send {%input%}
     }
     normalInitiate()
   }
   else if modal = insert
   {
     if input = esc
       normalInitiate()
     else
       send {%input%}
   }
}


normalInitiate(time = 99)
{
   global modal
   if modal != normal
   {
     modal = normal
;     notify("Normal")
     clsNotify(%time%)
   }
}
insertInitiate()
{
   global modal
   if modal != insert
   {
     modal = insert
     notify("Insert")
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

;;; GUI
notify(text, time = 512)
{
   ; Progress, y980 b2 fs10 zh0 WS800, %text%, , , Verdana
   Progress,x0 y0 b fs64 zh0 W1280 CWffffff CTFF0000,%text%,,modalState, Comic Sans MS
   WinSet,ExStyle,^0x00000020,modalState
   WinSet, TransColor,FFFFFF, modalState
   return
}
clsNotify(time = 512)
{
   Sleep, %time%
   Progress, Off
   return
}

#If

