#IF WinActive("ahk_class OpusApp")
F6::setLineSpace(22)
F2::setFontName("宋体")
F3::setFontName()
F4::setFontSize("小四")
F5::setFontSize("五号")

F7::toggleAmend()
F8::toggleAmendShow()


F1::
{
  Click
  Send {Delete}
  Send {4}
return
}


setFontName(input = "Times New Roman")
{
  Send {Alt}
  Send {h}{f}{f}
  enIME()
  Send %input%
  Send {Enter}
  zhIME()
  ToolTip, 字体：%input%
  SetTimer, RemoveToolTip, 1000
}

setFontSize(input = "小四")
{
  Send {Alt}
  Send {h}{f}{s}
  enIME()
  Send %input%
  Send {Enter}
  zhIME()
  ToolTip, 字号：%input%
  SetTimer, RemoveToolTip, 1000
}

toggleAmendShow()
{
  global amend
  Send {Alt}
  Send {r}
  Send {t}{d}
  Send {PgUP}
  if amend := !amend
  {
    Send {Down}
    ToolTip, 最终状态
  }
  else
  {
    ToolTip, 最终：显示标记
  }
  SetTimer, RemoveToolTip, 1000
  Send {Enter}
}

toggleAmend()
{
  global amend
  Send {Alt}
  Send {r}
  Send {g}{g}
  ToolTip, 切换修订状态
  SetTimer, RemoveToolTip, 1000
}


setLineSpace(input = 22)
{
  ToolTip, 行距：%input%
	Send {Alt}
	Send {h}{p}{g}
	Send {Tab 10}
	Send {Down 7}
	Send {Up}
	Send {Enter}
	Send {Tab}
	Send %input%
	Send {Enter}
  SetTimer, RemoveToolTip, 1000
	return
}
#IF
