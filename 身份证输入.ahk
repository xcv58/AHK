NumpadEnter::
  Send ^a
  Send ^c
  Sleep 200
  tempInput := Clipboard  ;获取输入
  StringLen, length, tempInput
  if length = 9  ;判断是否需要加X
    tempInput = %tempInput%X
  tempInput = 42115319%tempInput%  ;加前缀
  Clipboard := tempInput
  send ^v   ;输入
return
