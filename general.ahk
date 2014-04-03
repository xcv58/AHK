;-----------------外部文件------------------
#Include %A_ScriptDir%
#include QuickStart.ahk
#include VimBrowser\vimBrowser.ahk
#include IME.ahk
#include Cursor.ahk
#include DeleteAFormFromWord.ahk
;#include vimLog.ahk
#include KDE Windower.ahk
;#include ReaderJ.ahk
#include WindowControl.ahk
#include MultiMonitor.ahk
#include MoveMouse.ahk
#include Tools.ahk
;#include Speech.ahk
#include Wheel.ahk
;#include WordPlus.ahk
;#include fixDropboxCameraUploadTimeBug.ahk
;#include Instruments\yaohaotongji.ahk
;#include Instruments\scoreCountForBit.ahk



;----------------------工具-------------------------------------
;#include Instruments\saveForEncylopedia.ahk
#include Instruments\War3.ahk
;#include Instruments\addSBCsaceSpacesToEachLine.ahk
;#include Instruments\ContinuallyClick.ahk



;---------------抢课-----------------
^F1::
{
   InputBox, CourseNum, 输入想选择的课程代码, , , 300,100
   if ErrorLevel
   {
     msgbox 设置失败，请重新启动！
     return
   }
   TargetSubject = Computer Science & Engineering
   Send {Tab 5}
   Send CSE{Tab}
   Loop
   {
      Bak = %Clipboard%
      GoSub, getAllContent
      clipboard = 
      ClipWait, 0.1
      if ErrorLevel
      {
          ;MsgBox, 复制失败，请重试
          GoSub, getAllContent
      }
      Temp = %Clipboard%
      FoundPos := RegExMatch(Temp, TargetSubject) ;whether select subject
      if FoundPos
      {
        Clipboard := Bak
        break
      }
      Clipboard := Bak
      Sleep, 10
   }
   Send {Tab}
   Send %CourseNum%
   Send {Tab 2}{Space}{Enter}
return

  getAllContent:
      Send ^a
      Send ^c
  return
}





;---------------测试-----------------
isPrimeNumber(a)
{
   Loop % Floor(Sqrt(a))-1 {
      If !Mod(a,A_Index+1)
         Return 0
   }
   Return 1
}

;F11::
;loop, 10000000
;{
;click, left
;}
;return
;---------------测试-----------------
;-::
;MouseClick, right
;Send {UP}
;Send {Enter}
;return

;F1::
;{
;Send {F2}
;Send {Left 7}
;Send +{Home}{Del}
;return
;}

;^1::ControlSetText, , New Text Here, ahk_class Notepad

;Gui +LastFound  ; Make the GUI window the last found window for use by the line below.
;WinSet, Style, -0xC00000, A








;---------------用vim打开一行的文件路径-------------------
;!e::
;  WinActivate Collins COBUILD
;return
;F10::
;Send {End}
;Send +{Home}
;Send ^c
;Sleep 50
;Run Gvim `"%Clipboard%`"
;return
;
;#If WinActive("ahk_class Vim")
;F10::
;Send {Esc}
;Send {End}
;Send {v}
;Send {Home}
;Send ^c
;Sleep 50
;Run Gvim `"%Clipboard%`"
;return
;#If

;---------------测试-------------------
#Persistent
;^1::Gui()
Gui()
{
Gui +LastFound
hWnd := WinExist()
DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage")
Return
}

ShellMessage( wParam,lParam )
{
    static HSHELL_WINDOWACTIVATED := 4
    If ( wParam = HSHELL_WINDOWACTIVATED )
    {
        WinGetTitle, WinTitle, ahk_id %lParam%
        ToolTip % WinTitle
msgbox %WinTitle%
    }
return
}

;---------------测试-------------------

;^1::test()
test()
{
Loop
{
If WinActive("ahk_class Chrome_WidgetWin_0") or WinActive("ahk_class IEFrame") or WinActive("ahk_class MozillaWindowClass") or WinActive("ahk_class AcrobatSDIWindow")
;SetTitleMatchMode, slow Visible Text
;SetTitleMatchMode, Slow
WinGetTitle, BrowserTitle, A
WinGetText, url, A
if (BrowserTitle <> BrowserTitleNew) 
{
MsgBox, Title: "%BrowserTitle%" `n Url: "%url%"
BrowserTitleNew = %BrowserTitle%
}
Sleep 1000
}
return
}



;ToolTip, Multiline`nTooltip, 100, 150
;
;; To have a ToolTip disappear after a certain amount of time
;; without having to use Sleep (which stops the current thread):
;#Persistent
;ToolTip, Timed ToolTip`nThis will be displayed for 5 seconds.
;SetTimer, RemoveToolTip, 5000
;return
;
;RemoveToolTip:
;SetTimer, RemoveToolTip, Off
;ToolTip
;return

;^1::send ^`.

;Numpad0 & Numpad2::ControlSend,, {up},ahk_class Chrome_WidgetWin_0
;Numpad0 & Numpad2::UrlDownloadToFile, ftp://10.1.0.144/Chrome/chrome-win32-2011-03-23.zip, C:\123.zip
;~Up::Run notepad
;RButton::MsgBox You clicked the right mouse button.


;#IfWinActive, ahk_class Notepad
;'^a::MsgBox You pressed Ctrl-A while Notepad is active. Pressing Ctrl-A in any other window will pass the Ctrl-A keystroke to that window.
;#c::MsgBox You pressed Win-C while Notepad is active.
;'#IfWinActive
;#c::MsgBox You pressed Win-C while any window except Notepad is active.

;RControl & RShift::AltTab  ; Hold down right-control then press right-shift repeatedly to move forward.
;RControl & Enter::ShiftAltTab  ; Without even having to release right-control, press Enter to reverse direction.
;RAlt & j::AltTab
;RAlt & k::ShiftAltTab

;::#w::
;(
;Any text between the top and bottom parentheses is treated literally, including commas and percent signs.
;By default, the hard carriage return (Enter) between the previous line and this one is also preserved.
;    By default, the indentation (tab) to the left of this line is preserved.
;
;See continuation section for how to change these default behaviors.
;)

;#SingleInstance force

;$F1::
;while GetKeyState("F1", "P")  ; While the F1 key is being held down physically.
;{
;    Click
;}
;return


;----------------Reload----------------
#Q::
   Run AutoHotkey "%A_ScriptFullPath%"
return
;Run Gvim %A_ScriptFullPath%
;return
#W::Run %A_ScriptDir%


UPDATEDSCRIPT:
{
   FileGetAttrib,attribs,%A_ScriptFullPath%
   IfInString,attribs,A
   {
      FileSetAttrib,-A,%A_ScriptFullPath%
      posX = %A_CaretX%
      posY = %A_CaretY%
      ToolTip,Updated script,%posX%,%posY%
      Sleep,500
      Reload
   }
Return
}
