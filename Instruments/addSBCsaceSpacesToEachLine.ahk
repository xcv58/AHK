;对剪切板中的每一行文本都生效。
;去除原文中的空行
;去除所有正常空格以及全角空格，并添加两个全角空格。是写博客排版至高利器。
;每两行之间增加一个空行
;删除文字末尾的空格与全角空格
;自动按^c复制选中的文字；在处理完成之后自动进行粘贴。
;by xcv58
^F1::
{
Bak = %Clipboard%
clipboard = 
Send, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, 复制失败，请重试
    return
}
Temp = %Clipboard%
Temp := RegExReplace(Temp,"(?<=\r|\n|^)(\s|　)*(?=\r\n)","")   ;文章中的空行
Temp := RegExReplace(Temp,"^(\s|　|\r|\n)*","")     ;首行空行
Temp := RegExReplace(Temp,"(?<=\n|^)(\s|　)*","　　")    ;添加全角空格
Temp := RegExReplace(Temp,"\r\n","`r`n`r`n")      ;段落之间增加空行
Temp := RegExReplace(Temp,"(\s|\r|\n|　)*$","")
Clipboard := Temp
Tooltip, % Clipboard
;Sleep, 1000
;Tooltip
Loop
{
    if NOT GetKeyState("Ctrl", "P")
    {
        Tooltip
        break
    }
}
send ^v
return
}
