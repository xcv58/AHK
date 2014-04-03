;复制后触发计算操作
^1::
   countOnePersonScore()
return



countOnePersonScore()
{
  filePath = D:\20908双证\out.txt
  FileEncoding, utf-8
  resultWriter := FileOpen(filePath, "A", "utf-8")
  tmpContent = %ClipBoard%
  Tooltip, %tmpContent%
  tmpScore = 0
  tmpWeightScore = 0
  tmpNumOfSub = 0
  tmpNumOfCredit = 0
  result := ""
  ;得到姓名，学号
  studentNumber := extractOneAttribute(tmpContent,"(?<=学\s\s\s\s号:\s)2090\d{4}")
  studentName :=  extractOneAttribute(tmpContent,"(?<=姓\s\s\s名:\t)[^\s]{2,4}(?=\s)")
  studentGender :=  extractOneAttribute(tmpContent,"(?<=性\s\s\s别:\t)[^\s]{1,4}(?=\s)")
  studentID :=  extractOneAttribute(tmpContent,"(?<=身份证号:\t)\d{16,20}(?=\s)")

  ;得到所有科目的信息，包括名称，学时，成绩；并写入result
  tmpSub :=  extractOneAttribute(tmpContent,"((?<=\n)..课.*\r\n){1,}")
  ;把换行和空格都换为逗号
  tmpSub := RegExReplace(tmpSub, "(\r\n)|(\t)", ",")
  ;去掉科目代码
  ;tmpSub := RegExReplace(tmpSub, "[\d]", ",")
  
  result = %studentNumber%,%studentName%,%studentGender%,%studentID%,%tmpSub%
  Tooltip, %result%
  ;msgbox %result% `n %tmp%
  ;写入结果
  ;writeResult(result,writer)
  resultWriter.Write(result)
  resultWriter.Write("`n")
  resultWriter.close()
  return
}
writeResult(result, writer)
{
  writer.Write(result)
  writer.Write("`n")
  return
}

extractOneAttribute(origin,regex)
{
  FoundPos := RegExMatch(origin,regex,tmpResult)
origin = 
;  if FoundPos
;  {
;     result = %result%%tmpResult%,
;  }
  return tmpResult
}
