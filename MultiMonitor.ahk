WinMoveBigMonitor(window, x = 0, y = 0)
{
   bigMonitor := getBigMonitor()
   WinGetPos, ,,Width,Height,%window%
   SysGet, Mon, Monitor, %bigMonitor%
   ;MsgBox, Left: %MonLeft% -- Top: %MonTop% -- Right: %MonRight% -- Bottom %MonBottom%.
   if abs(x) < 1
   {
      if x < 0
        x := MonRight - Width + (MonRight-MonLeft)*x
      else
        x := MonLeft + (MonRight-MonLeft)*x
   }
   else
   {
      if x < 0
        x := MonRight - Width + x
      else
        x := MonLeft + x
   }
   if abs(y) < 1
   {
      if y < 0
        y := MonBottom - Height + (MonBottom - MonTop)*y
      else
        y := MonTop + (MonBottom - MonTop)*y
   }
   else
   {
      if y < 0
        y := MonButton + y
      else
        y := MonTop + y
   }
   WinMove, %window%,,x,y
return
}

getBigMonitorWidth()
{
   bigMonitor := getBigMonitor()
   SysGet, Mon, Monitor, %bigMonitor%
   width := MonRight - MonLeft
   return width
}

getBigMonitor()
{
  Width := 0
  SysGet, MonitorCount, MonitorCount
Loop, %MonitorCount%
{
    SysGet, MonitorName, MonitorName, %A_Index%
    SysGet, Monitor, Monitor, %A_Index%
    SysGet, MonitorWorkArea, MonitorWorkArea, %A_Index%
    Width%A_Index% := MonitorRight - MonitorLeft
    ;MsgBox, Monitor:`t#%A_Index%`nName:`t%MonitorName%`nLeft:`t%MonitorLeft% (%MonitorWorkAreaLeft% work)`nTop:`t%MonitorTop% (%MonitorWorkAreaTop% work)`nRight:`t%MonitorRight% (%MonitorWorkAreaRight% work)`nBottom:`t%MonitorBottom% 
}
result = 0
Loop, %MonitorCount%
{
   if % Width%A_Index% > Width
   {
     Width := Width%A_Index%
     result := A_Index
   }
}
  return result
}

