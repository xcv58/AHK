;----------------快速启动-------------------
#^!U::
{
   IfWinExist, ahk_class Chrome_WidgetWin_0
   {
     WinClose
     WinWaitClose, ahk_class Chrome_WidgetWin_0
   }
   IfWinExist, ahk_class Chrome_WidgetWin_1
   {
     WinClose
     WinWaitClose, ahk_class Chrome_WidgetWin_1
   }
   Sleep 3000
   RunWait UCD.bat 2
   Run C
   return
}
#V::Run Gvim    ;开启Gvim
#+C::Run C
;#C::Run C
#O::
{
  21daysFilePath = D:\Dropbox\Dropbox\TOEFL\21days.txt
  IfWinExist, 21days.txt
  {
    IfWinActive, 21days.txt
    {
      WinMinimize, 21days.txt
    }
    else
      WinActivate, 21days.txt
  }
  else
  {
    Run gvim %21daysFilePath%
    WinWait, 21days.txt
    WinActivate, 21days.txt
  }
#if
#if
  return
}
#I::Run 小组讨论
;#U::Run D:\Downloads\TEMP
#Y::Run foobar2000
;#G::
;{
;  FormatTime,CurrentDate,,yyyy.MM.dd
;  FormatTime,CurrentDate1,,yyyy-MM-dd
;  FormatTime,CurrentTime,,HH:mm
;  filePath = D:\Dropbox\Dropbox\log\%CurrentDate%.txt
;  IfWinExist, %CurrentDate%.txt
;    WinActivate, %CurrentDate%.txt
;  else
;  {
;    FileGetSize, fileSize,%filePath%
;    if fileSize =
;    {
;      FileAppend, %CurrentTime%  %CurrentDate1% `n%CurrentTime%  `n%CurrentTime%-, %filePath%
;    }
;;;    Run gvim %filePath%
;    Run notepad %filePath%
;  }
;#if
;  WinWait, %CurrentDate%.txt 
;  WinActivate, %CurrentDate%.txt
;;;  SendInput {G}
;Send {Down 20}
;  if fileSize =
;Send {Up}
;;;    Send {k}
;;;  SendInput {A}
;Send {End}
;  zhIME()
;  return
;}
;#G::
;{
;  FormatTime,CurrentDate,,yyyy.MM.dd
;  FormatTime,CurrentDate1,,yyyy-MM-dd
;  FormatTime,CurrentTime,,HH:mm
;  filePath = D:\Dropbox\Dropbox\log\%CurrentDate%.txt
;  IfWinExist, %CurrentDate%.txt
;    WinActivate, %CurrentDate%.txt
;  else
;  {
;    FileGetSize, fileSize,%filePath%
;    if fileSize =
;    {
;      FileAppend, %CurrentTime%  %CurrentDate1% `n%CurrentTime%  `n%CurrentTime%-, %filePath%
;    }
;    Run gvim %filePath%
;  }
;#if
;  WinWait, %CurrentDate%.txt 
;  WinActivate, %CurrentDate%.txt
;  SendInput {G}
;  if fileSize =
;    Send {k}
;  SendInput {A}
;Send {End}
;  zhIME()
;  return
;}

;#T::
;{
;  FormatTime,CurrentDate,,yyyy.MM.dd
;  FormatTime,CurrentDate1,,yyyy-MM-dd
;  FormatTime,CurrentTime,,HH:mm
;  filePath = D:\Dropbox\Dropbox\Words\%CurrentDate%.txt
;  IfWinExist, %CurrentDate%.txt
;    WinActivate, %CurrentDate%.txt
;  else
;  {
;    FileGetSize, fileSize,%filePath%
;    if fileSize =
;    {
;      ;FileAppend, %CurrentTime%  %CurrentDate1% `n%CurrentTime%  `n%CurrentTime%-, %filePath%
;    }
;    Run gvim %filePath%
;    SendInput {G}
;    SendInput {A}
;  }
;  WinWait, %CurrentDate%.txt (D: 
;  WinActivate, %CurrentDate%.txt (D:
;;  SendInput {G}
;;  if fileSize =
;;    Send {k}
;;  zhIME()
;  return
;}
;#T::
;{
;  IfWinExist, t.txt
;    WinActivate, t.txt
;  else
;  {
;    Run gvim "D:/t.txt"
;    WinWait, t.txt
;    WinActivate, t.txt
;  }
;  return
;}
;#X::
;{
;  IfWinActive, ahk_class ATL:00000001401608B0
;  {
;    ;WinSet, AlwaysOnTop, Off, ahk_class ATL:00000001401608B0
;    WinMinimize, ahk_class ATL:00000001401608B0
;  }
;  else IfWinActive, ahk_class ATL:0048FF08
;  {
;    ;WinSet, AlwaysOnTop, Off, ahk_class ATL:0048FF08
;    WinMinimize, ahk_class ATL:0048FF08
;  }
;  else IfWinExist, ahk_class ATL:00000001401608B0
;  {
;    WinActivate, ahk_class ATL:00000001401608B0
;    ;WinSet, AlwaysOnTop, On, ahk_class ATL:00000001401608B0
;  }
;  else IfWinExist, ahk_class ATL:0048FF08
;  {
;    WinActivate, ahk_class ATL:0048FF08
;    ;WinSet, AlwaysOnTop, On, ahk_class ATL:0048FF08
;  }
;  else
;  {
;    Run Qdir
;    WinActivate, ahk_class ATL:00000001401608B0
;    ;WinSet, AlwaysOnTop, On, ahk_class ATL:00000001401608B0
;    WinActivate, ahk_class ATL:0048FF08
;    ;WinSet, AlwaysOnTop, On, ahk_class ATL:0048FF08
;    ;Send #{F11}
;  }
;  return
;}

;{
;  IfWinActive, ahk_class TTOTAL_CMD
;    WinMinimize, ahk_class TTOTAL_CMD
;  else IfWinExist, ahk_class TTOTAL_CMD
;  {
;    WinActivate, ahk_class TTOTAL_CMD
;  }
;  else
;  {
;    Run TC
;    WinWait, ahk_class TTOTAL_CMD
;    WinActivate, ahk_class TTOTAL_CMD
;    Send #{F11}
;  }
;  return
;}
!F5::PlayOrPause()
PlayOrPause()
{
  SetTitleMatchMode, 2
  DetectHiddenWindows, on
  IfWinExist, Windows Media Player
  {
     PostMessage, 0x111, 84344, 0, , Windows Media Player ;Play/Pause
     return
  }
  IfWinExist, ahk_class MediaPlayerClassicW
  {
     ControlClick, x10 y10, ahk_class MediaPlayerClassicW
     return
  }
  IfWinExist, foobar2000 
  ;IfWinExist, ahk_class {97E27FAA-C0B3-4b8e-A693-ED7881E99FC1}
     ;Run "D:\Program Files\Foobar2000\foobar2000.exe" /playpause
     Run foobar2000.exe /playpause
return
}
Pause()
{
  SetTitleMatchMode, 2
  DetectHiddenWindows, on
  IfWinExist, Windows Media Player
     PostMessage, 0x111, 84345, 0, , Windows Media Player ;Play/Pause
  IfWinExist, foobar2000 
     Run "D:\Program Files\Foobar2000\foobar2000.exe" /stop
;  IfWinExist, ahk_class MediaPlayerClassicW
;  {
;     ControlClick, x10 y10, ahk_class MediaPlayerClassicW
;  }
return
}
#S::
Run cmd
Sleep 100
WinWait,ahk_class ConsoleWindowClass
WinActivate,ahk_class ConsoleWindowClass
NoTitleBar()
WinSet, Transparent, 188, A
;Run nircmd.exe win trans class "ConsoleWindowClass" 200
Return


#+r::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "https://www.google.com/reader/"
#+t::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "twitter.com"
#+y::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "www.youtube.com"
#+g::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "www.google.com"
#+x::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "www.xdowns.com"
#+m::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "mail.google.com"
#+s::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "stockapp.finance.qq.com/pstock"
#+f::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "facebook.com"
#+b::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "chrome-extension://eemcgdkfndhakfknompkggombfjjjeno/main.html"
#+l::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "https://www.google.com/calendar"
#+d::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "https://plus.google.com/"
#+q::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "chrome-extension://mijlebbfndhelmdpmllgcfadlkankhok/app.html"
#+w::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "http://www.weather.com/weather/today/CHXX0008:1:CH"
;"http://www.wunderground.com/global/stations/54511.html"
#+a::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- "http://go.xiaomi.com/"
;#+g::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- ""
;#+g::Run "D:\Program Files\chrome-win32\chrome.exe" --user-data-dir=DATA -- ""

;-----------------------显示密保卡----------------------
;^#!q::
;{
;if secretToggle := !secretToggle
;  SplashImage, d:\program files\secret1.gif, b
;else
;  SplashImage, Off
;return
;}

;-----------------------打开笑来咨询目录---------------------
;#A::Run "D:\Dropbox\笑来咨询"
#B::Run "D:\Dropbox\Books"
;-----------------------重启坚果云客户端---------------------
^#!j::
{
   Run tskill nutstore*
   Sleep 1000
   Run nut
   return
}

;-----------------------打开翻墙程序---------------------
^#!i::
{
  openPrivoxy()
  openGoagent()
  Sleep, 3000
  ;openDropbox()
  return
}
;-----------------------关闭翻墙程序---------------------
^#!o::
{
  ;Process, Close, privoxy.exe
  ;Process, Close, goagent.exe
  ExitAPP
  return
}
;-----------------------打开程序函数--------------------
openGoagent()
{
  Process, Exist, wallproxy.exe 
  if ErrorLevel 
  {}
  else
  {
    Run wallproxy
  }
  return
}
openPrivoxy()
{
  Process, Exist, privoxy.exe 
  if ErrorLevel 
  {}
  else
  {
     Run privoxy
     WinWaitActive, Privoxy, , 2
     if ErrorLevel
     {
         MsgBox, 打开Privoxy失败
         return
     }
     else
     {
         send !{F4}
     }
  }
  return
}
openDropbox(){
  Run runas /user:dropbox "C:\Program Files\Dropbox\bin\dropbox.exe"
  WinWaitActive, C:\Windows\system32\runas.exe, , 2
  if ErrorLevel
  {
      MsgBox, 打开dropbox失败
      return
  }
  else
  {
      Send dropbox{Enter}
  }
  return
}
