;----------------TEMPORARY------------------
;#If WinActive("21days.txt (D:\Dropbox\Dropbox\TOEFL) - GVIM")
#If WinActive("21days.txt")
`::
  Run foobar2000.exe /playpause
  send ^s
return
#j::
  send z
  send f
  send j
  send j
  send ^s
return
#k::
  send zcj
return
#If

;----------------灵格斯------------------
#If WinActive("Lingoes 灵格斯")
!Enter::
   Send ^v
   Send {Enter}
   setDefaultPos()
return


Right::nextDict()
Left::previousDict()
Enter::
  Send {Enter}
  setDefaultPos()
return
nextDict()
{
  global xPos,yPos,step
  if(xPos = "")
    setDefaultPos()
  yPos += step
  doClick()
;106
;25
}
previousDict()
{
  global xPos,yPos,step
  if(xPos = "")
    setDefaultPos()
  yPos -= step
  doClick()
}
doClick()
{
  global xPos,yPos,step
  MouseGetPos, initialXPos, initialYPos 
  ;MouseClick, left, %xPos%, %yPos%
  MouseMove, %xPos%, %yPos%, 0
  Click
  ;MouseClick, left, %xPos%, %yPos%
  ;Click %xPos%, %yPos%
  MouseMove, %initialXPos%, %initialYPos%, 0
}
setDefaultPos()
{
  global xPos,yPos,step
  xPos := 64
  yPos := 106
  step := 25
}
#If


;----------------Aboboo------------------
#If WinActive("ahk_class TfMain")
F1::
  WinGetPos, , , , Height, A
  xPos:=360
  yPos:=Height-70
  MouseClick, left, %xPos%, %yPos%
return
#If

;;----------------Audacity全局播放快捷键------------------
;#`::
;;0xF0F0F0
;;488, 64
;;MouseGetPos, MouseX, MouseY
;;PixelGetColor, color, %MouseX%, %MouseY%
;;MsgBox The color at the current cursor position is %color%.
;  ControlClick, wxWindowClassNR4, ahk_class wxWindowClassNR
;return
;#Tab::
;  ControlClick, wxWindowClassNR5, ahk_class wxWindowClassNR
;return


;----------------VIM式快捷键------------------
!j::send {down}
!k::send {up}
!h::send {left}
!l::send {right}
;~#r::
;{
;   WinWait,运行
;   zhIME()
;   return
;}




;----------------自动修改Privoxy配置文件-------------------
^#!p::
   proxyFilePath = D:\Dropbox\Software\privoxy\config.txt
   Send ^c
   targetUrl := Clipboard
   StringReplace, targetUrl, targetUrl, %A_SPACE%, , All
   StringReplace, targetUrl, targetUrl, ., , All
   ;msgbox %targetWord%
   FileAppend,   %A_SPACE%       forward  .%targetUrl%.  127.0.0.1:8000`n, %proxyFilePath%
return




;----------------系统管理-------------------
;锁定并关闭显示器
;#l::
;   Run rundll32.exe user32.dll,LockWorkStation
;   Pause()
;   sleep 3000
;   SendMessage,0x112,0xF170,2,,Program Manager ;关闭显示器。0x112:WM_SYSCOMMAND，0xF170:SC_MONITORPOWER。2：关闭，-1：开启显示器
;return

;tskill指定进程
#K::
   InputBox, ProcessName, Tskill! , , , 200,100
;   Msgbox %ProcessName%
   if ErrorLevel
   {
   }
   else if ProcessName = 
   {
   ;   msgbox sb
   }
   else
   {
      Run tskill %ProcessName%*
   }
   ProcessName = 
return


;延时启动
^#!R::
   InputBox, delayTime, Set Delay! , , , 200,100
   if ErrorLevel
   {
     msgbox Bye!
     return
   }
   else if delayTime = 
   {
      delayTime = 5
   }
      InputBox, command, The Command!, , , 200, 100
      Sleep %delayTime%000
      Run %command%
return 


;----------------声音控制-------------------
^!S::Run nircmd.exe changesysvolume -4000   ;减小声音
^!W::Run nircmd.exe changesysvolume 4000    ;增大声音
^!D::Run nircmd.exe mutesysvolume 2  ;静音
^!A::
   Run nircmd.exe changesysvolume -65535
   Run nircmd.exe mutesysvolume 1
return

;^!W::Send {Volume_Up}
;^!S::Send {Volume_Down} 
;^!D::Send {Volume_Mute}
;^!A::Send {Volume_Down 50}

;^!W::volumeSet(+1)
;^!S::volumeSet(-1)
;^!D::volumeSet(0)
;^!A::volumeSet(-50)

volumeSet(volumeControl)
{
  global volume
  if volume =
  {
    volume = 0
    Run nircmd.exe changesysvolume -65535
    Sleep 500
    Send {Volume_Down}
    ToolTip, Initialization!
    sleep 500
  }
  if volumeControl = 0
  {
    global muteToggle
    if muteToggle := !muteToggle
    {
      if volume > 0
      {
        Send {Volume_Down}
        Send {Volume_Up}
      }
      else
      {
        Send {Volume_Up}
        Send {Volume_Down}
      }
      Send {Volume_Mute}
      ToolTip,Mute
    }
    else
    {
      Send {Volume_Mute}
      ToolTip,%volume%`%
    }
  }
  else 
  {
    if volumeControl = +1
    {
      if volume < 100
      {
        if volume = 0
        {
          volume += 20
          Send {Volume_Up 10}
        }
        else
        {
          Send {Volume_Up}
          volume += 2
        }
      }
    }
    else if volumeControl = -1
    {
      if volume > 0
      {
        if volume = 100
          {
            Send {Volume_Down 10}
            volume -= 20
          }
          else
          {
            Send {Volume_Down}
            volume -= 2
          }
      }
    }
    else if volumeControl = -50
    {
       Run nircmd.exe changesysvolume -65535
       Run nircmd.exe mutesysvolume 1
       volume := 0
;      Loop % volume/2
;      {
;        Send {Volume_Down}
;        volume -= 2
;        ToolTip %volume%`%
;      }
    }
    ToolTip %volume%`%
  }
SetTimer, RemoveVolumeDisplay, 100
return
RemoveVolumeDisplay:
   GetKeyState, state, Control, P
   if state = U
   {
     ToolTip
     SetTimer, RemoveVolumeDisplay, off
   }
   return
}



;^!A::
;{
;Progress, off
;SoundGet,master_volume,MASTER 
;;SoundGet,master_volume, CD
;;SoundGet,master_volume, WAVE
;msgbox % master_volume
;   ;Progress,x0 y0 b fs94 zh0 W1280 CWffffff CTFF0000,%master_volume%,,modalState, Comic Sans MS
;   WinSet,ExStyle,^0x00000020,modalState
;   WinSet, TransColor,FFFFFF, modalState
;return
;}

;-----------------黑板---------------
^#!ESC::
{
   BlockBoard = 挡板
   if WinExist(BlockBoard)
   {
      Progress, OFF
   }
   TransparencyForBlockBoard := 200
   Progress,x128 y640 m1 FS64 zh0 W640 H23 CW000000 CTFF0000, ,,%BlockBoard%, Comic Sans MS Bold
   WinSet, Style, ^0xC00000, %BlockBoard%
   WinSet, Style, ^0x40000, %BlockBoard%
   CursorTransparentWinTitle(BlockBoard, TransparencyForBlockBoard)
   return
}
#IF WinExist(BlockBoard)
F1::
{
        WinSet, Transparent, %TransparencyForBlockBoard%, %BlockBoard%
	Loop
	{
	    if not GetKeyState("F1", "P")
	        break
	}
        WinSet, Transparent, OFF, %BlockBoard%
	return
}
#IF

;当光标置于指定Title的窗口上时，将该窗口的透明度设置为Transparency；
;当光标挪开时关闭透明效果
;用函数Loop的效果并不好，必须要满足一下几个条件：
;1.非阻塞式，待续
;2.可以存储多个窗口和透明度，查找数据结构
;3.可以删除特定的配置，同上
;4.必须还得是Loop
CursorTransparentWinTitle(Title,Transparency)
{
   Loop
   {
      CoordMode, Mouse  ; Switch to screen/absolute coordinates.
      MouseGetPos, , , Under_MouseWin
      WinGetTitle, UnderCursorWinTitle, ahk_id %Under_MouseWin%
      ;Tooltip %UnderCursorWinTitle% %Title% %Transparency%
      if UnderCursorWinTitle=%Title%
      {
        WinSet, Transparent, %Transparency%, ahk_id %Under_MouseWin%
        ;!!用%Title%不起作用。
      }
      else
      {
        WinSet, Transparent, OFF, %Title%
      }
      CoordMode, Mouse  ; Switch to screen/absolute coordinates.
   }
   return
}
;-----------------显示时间---------------
#Esc::
{
   SetTimer, noticeDateTime, 1
   SetTimer, closeNotice, 10
return
}
^#Esc::
{
   SetTimer, noticeDateTime, 1
return
}
closeNotice:
   GetKeyState, state, LWin, P
   if state = U
   {
     SetTimer, noticeDateTime, off
     SetTimer, closeNotice, off
     Progress, Off
     ;ToolTip
   }
   else
   {
     ;SetTimer, closeNotice, 10
   }
return

noticeDateTime:
{
   ;SetTimer, noticeDateTime, off
   SetTimer, noticeDateTime, 6000
   FormatTime,CurrentDate,,yyyy-MM-dd
   FormatTime,CurrentDay,,WDay
   FormatTime,CurrentTime,,HH:mm   ;当前时间格式
   If CurrentDay = 1
     CurrentDay = Sunday
   If CurrentDay = 2
     CurrentDay = Monday - 1
   If CurrentDay = 3
     CurrentDay = Tuesday - 2
   If CurrentDay = 4
     CurrentDay = Wednesday - 3
   If CurrentDay = 5
     CurrentDay = Thursday - 4
   If CurrentDay = 6
     CurrentDay = Friday - 5
   If CurrentDay = 7
     CurrentDay = Saturday - 6
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
   text = %CurrentDate%`n%CurrentDay%`n%CurrentTime%
   if stopTime !=
   {
     if stopTime != 0
       text = %text%`n`nStopWatch: %stopTime%
   }
   ; Progress, y980 b2 fs10 zh0 WS800, %text%, , , Verdana
   ;Progress,x0 y0 b fs32 zh0 W200 CWffffff CTFF0000,%text%,,noticeDateTime, Comic Sans MS
   ;MouseGetPos, MouseX, MouseY,,, ahk_id %EWD_MouseWin%
   bigMonitor := getBigMonitor()
   SysGet, Mon, Monitor, %bigMonitor%
   ScreenWidth := MonRight - MonLeft
   ScreenHeight := MonBottom - MonTop
;   ProgressWidth = 600
;   x := MonLeft + (ScreenWidth - ProgressWidth)/2
;   y := MonTop + 64
;   Progress,x%x% y%y% b FS64 zh0 W%ProgressWidth% CW000000 CTFF0000,%text%,,noticeDateTime, Comic Sans MS Bold
   ProgressWidth = 888
   x := MonLeft
   y := MonTop
   Progress,x%x% y%y% b FS64 zh0 W%ScreenWidth% H%ScreenHeight% CW000000 CTFF0000,%text%,,noticeDateTime, Comic Sans MS Bold
   ;WinMaximize,noticeDateTime
   ;WinSet,ExStyle,^0x00000020,noticeDateTime
   ;WinSet, TransColor,FE0000, noticeDateTime
   ;ToolTip, %text%
   ;WinMoveBigMonitor("noticeDateTime",0,0)
;   WinSet, Transparent,128, noticeDateTime
   return
}


;-----------------倒计时---------------
^#W::
{
   stopText = `n`n时间到！
   StopWatchSound = C:\Windows\Media\town.mid
   SoundPlay, ""
   InputBox, stopTime, Set SetWatch! , , , 200,100
   if ErrorLevel
   {
     msgbox Bye!
     return
   }
   else if stopTime = 
   {
      stopTime = 60
   }
   Loop %stopTime%
   {
     Sleep 1000
     stopTime--
   }
;   Sleep %stopTime%000
   bigMonitor := getBigMonitor()
   SysGet, Mon, Monitor, %bigMonitor%
   ScreenWidth := MonRight - MonLeft
   ScreenHeight := MonBottom - MonTop
   x := MonLeft
   y := MonTop
   Progress,x%x% y%y% b FS64 zh0 W%ScreenWidth% H%ScreenHeight% CW000000 CTFF0000,%stopText%,,noticeDateTime, Comic Sans MS Bold
   SoundPlay, %StopWatchSound% 
return
}


;----------------快速输入-------------------
;----------------日期时间-------------------
;:*:sj::
;FormatTime,CurrentTime,,HH:mm
;SendInput %CurrentTime%
;return
;:*:rq::
;FormatTime,CurrentDate,,yyyy-MM-dd 
;SendInput %CurrentDate%
;return
;----------------帐号-------------------
;:*:xcv::xcv{NumPad5}{NumPad8}
;:*:g@::chenyihonglove@gmail.com
;:*:yx::chenyihonglove@gmail.com
;----------------网址-------------------
;----------------短语-------------------
;:*:gr::Google Reader

#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t   ;;自定义控制结束符号
