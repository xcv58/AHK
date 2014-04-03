;间隔一定的时间点击鼠标左键
;开始时要求输入间隔时间，以秒为单位
;按Ctrl+F12开启，ESC退出
~^F12::
   InputBox, delayTime, 您想每隔多少秒点击一次？默认是5秒。, , , 300,100
   if ErrorLevel
   {
     msgbox 设置失败，请重新启动！
     ExitAPP
     return
   }
   else if delayTime = 
   {
      delayTime = 5
   }
   LOOP
   {
      if GetKeyState("Esc", "P")
        break
      send {click}
      Tooltip, 每隔%delayTime%会点击一次鼠标。`n按住ESC键（键盘左上角）直到提示文字消失即可退出。
      sleep %delayTime%000
   }
   ExitAPP
return
