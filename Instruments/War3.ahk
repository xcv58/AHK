#IfWinActive, ahk_class Warcraft III
^k::
{
   ;global modalWar3
   if toggleWar3 := !toggleWar3
   {
      modalWar3 = changed
   }
   else
   {
      modalWar3 = normal
   }
return
}
!q::
{
   if toggleWar3 = 1
   {
     send {Numpad7}
   }
   else
     send {alt down}{q}{alt up}
return
}
!a::
{
   if toggleWar3 = 1
     send {Numpad4}
   else
     send {alt down}{a}{alt up}
return
}
!z::
{
   if toggleWar3 = 1
     send {Numpad1}
   else
     send {alt down}{z}{alt up}
return
}
!w::
{
   if toggleWar3 = 1
     send {Numpad8}
   else
     send {alt down}{w}{alt up}
return
}
!s::
{
   if toggleWar3 = 1
     send {Numpad5}
   else
     send {alt down}{s}{alt up}
return
}
!x::
{
   if toggleWar3 = 1
     send {Numpad2}
   else
     send {alt down}{x}{alt up}
return
}
#IF
