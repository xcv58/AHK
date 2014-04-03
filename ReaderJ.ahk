#!j::    ;向下滚动,长按Esc结束
LOOP
{
   if GetKeyState("Esc", "P")
    break
   send {down}
   sleep 350
}
return

^#!j::    ;Google Reader下一条,长按Esc结束
LOOP
{
   if GetKeyState("Esc", "P")
    break
   send {j}
   sleep 50
}
return

