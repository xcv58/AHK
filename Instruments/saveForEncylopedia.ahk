`::
{
IfWinActive, 中国大百科全书
{
if count = 
  count = 0
count++

saveForEncylopedia()
renameForEncylopedia()
Send ^{Down}
}
else
{
msgbox 请在中国大百科全书中使用
}
return
}

saveForEncylopedia()
{
Send !{f}
Send {s}
Send 123
Send {Tab 4}
Send {Up 10}
Send {Enter}
return
}

renameForEncylopedia()
{
defaultFile = C:\AAA\123.txt 
Loop
{
FileReadLine, name, %defaultFile%, 3
If name = 
{
  continue
}
else
{
FileMove, %defaultFile%, C:\AAA\%name%.txt, 1
break
}
}
global count
ToolTip, %count%  %name% 
name =
return
}
