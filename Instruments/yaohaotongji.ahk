#2::
   InputBox, userPath, Please Input the PATH of pdf & txt files ,Please Input the PATH of pdf & txt files , , 300,128   ;input setting
   if ErrorLevel
      MsgBox, Exit，88~
   else
   ;userPath = D:\摇号\原始文件
   ;FileCopy, D:\摇号\原始文件\1296008719599.txt, D:\摇号\原始文件\测试.txt
   if ErrorLever
      msgbox, Error
   {
      userPath := RegExReplace(userPath,"\\$","")   ;删除末尾多余的\ | Delete the extra \ in the end of the path
      ;MsgBox, You entered "%userPath%"
      count = 0;
      Loop, %userPath%\*.*, 0, 1    ;Loop the input fold
      {
          ;MsgBox, 4, , Filename = %A_LoopFileFullPath%`n`nContinue?
          tempFile = %A_LoopFileFullPath%
          FoundPos := RegExMatch(tempFile, "\.txt")   ;detect one file is txt file
          if FoundPos
          {
             ;msgbox %tempFile% %FoundPos%
             processOneFile(tempFile)   ;process one file
             count += 1
          }
      }
      msgbox, Process %count% files
   }
return


#3::
;   InputBox, userPath, Please Input the PATH of pdf & txt files ,Please Input the PATH of pdf & txt files , , 300,128   ;input setting
;   if ErrorLevel
;      MsgBox, Exit，88~
;   else
   userPath = D:\摇号\文本
   resultFile = D:\摇号\结果.txt
   resultWriter := FileOpen(resultFile, "w", "utf-8")
   FileEncoding , utf-8
;   if ErrorLever
;      msgbox, Error
   {
      userPath := RegExReplace(userPath,"\\$","")   ;删除末尾多余的\ | Delete the extra \ in the end of the path
      ;MsgBox, You entered "%userPath%"
msgbox, start
      Loop, %userPath%\*.*, 0, 1    ;Loop the input fold
      {
          ;MsgBox, 4, , Filename = %A_LoopFileFullPath%`n`nContinue?
          tempFile = %A_LoopFileFullPath%
          FoundPos := RegExMatch(tempFile, "单位指标配置\.txt")   ;detect one file is txt file
          if FoundPos
          {
             tooltip %tempFile% %FoundPos%
             Loop
             {
                FileReadLine, tmpline, %tempFile%, %A_Index%
                if ErrorLevel
                   break
              ;msgbox %tempFile% %tmpLine% END
                FoundPos := RegExMatch(tmpLine, "^\d{1,6}\s+\d*.*")
                if FoundPos
                {
                  ;msgbox %tmpLine%
                  tmpLine := RegExReplace(tmpLine, "(?<=\d)\s+", ",", null,2)
                  resultWriter.Write(tmpLine)
                  Tooltip, %tempFile%`n%tmpLine%
                  resultWriter.Write("`n")
                }
             }
             file.close()
             ;msgbox, File CLOSE
          }
      }
   }
   resultWriter.close()
msgbox, end
return

processOneFile(filePath)
{
   pdfFilePath := RegExReplace(filePath, "\.txt", ".pdf")
   FoundPos := RegExMatch(filePath, "(?<=\\)\d*(?=.[a-z]{3})", fileName)
   ;msgbox, %filePath% + %pdfFilePath%
   file := FileOpen(filePath, "r", "utf-8")
   Loop
   {
      tmpLine := file.ReadLine()
      FoundPos := RegExMatch(tmpLine, "(?<=分期描述：)20\d\d年第\d\d期..指标配置", finalFileName)   ;detect one file is txt file
   ;分期描述：2011年第01期个人指标配置
      if FoundPos
      {
        ;msgbox %finalFileName%
        break
      }
   }
   file.close()

;   finalFilePath := RegExReplace(filePath,fileName, finalFileName)
;   finalFilePath := RegExReplace(filePath,"原始文件", "重命名")
;   finalPdfFilePath := RegExReplace(pdfFilePath,fileName, finalFileName)
;   finalPdfFilePath := RegExReplace(pdfFilePath,"原始文件", "重命名")
    finalFilePath := changeFilePath(filePath,fileName, finalFileName)
    finalPdfFilePath := changeFilePath(pdfFilePath,fileName, finalFileName)
;msgbox %filePath%`n%pdfFilePath%`n%finalFilePath%`n%finalPdfFilePath%
   ;msgbox, %filePath% %finalFilePath%
   ;FileCopy, D:\摇号\原始文件\1296008719599.txt, D:\摇号\原始文件\2011年第01期个人指标配置.txt
   FileCopy, %filePath%, %finalFilePath%
     if ErrorLevel
        MsgBox 复制%filePath%出错
   FileCopy, %pdfFilePath%, %finalPdfFilePath%
     if ErrorLevel
        MsgBox 复制%pdfFilePath%出错
   return
}


changeFilePath(original, fileName, finalFileName)
{
   tmp = ""
   tmp := RegExReplace(original,fileName, finalFileName)
   tmp := RegExReplace(tmp,"原始文件", "重命名")
   return tmp
}
