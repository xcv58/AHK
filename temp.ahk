#2::
   InputBox, photoPath, 请输入Camera Uploads的路径 , 类似：D:\Dropbox\Camera Uploads, , 300,128
   if ErrorLevel
      MsgBox, 退出，88~
   else
   {
      photoPath := RegExReplace(photoPath,"\\$","")   ;删除末尾多余的\
      ;MsgBox, You entered "%photoPath%"
      Loop, %photoPath%\*.*, 0, 1
      {
          ;MsgBox, 4, , Filename = %A_LoopFileFullPath%`n`nContinue?
          tempFile = %A_LoopFileFullPath%
          FoundPos := RegExMatch(tempFile, "2002-12-08 12.00.00")
          if FoundPos
          {
             ;msgbox %tempFile% %FoundPos%
             renameOneFile(tempFile)
          }
      }
   }
return

renameOneFile(filePath)
{
   FileGetTime, modifiedTime, %filePath%
   ;tempFileFullPath := RegExReplace(modifiedTime,"(\d4)(\d2)(\d2)(\d2)(\d2)(\d2)","$1-$2-$3 $4.$5.$6")
   tempFileFullPath := RegExReplace(modifiedTime,"(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})","$1-$2-$3 $4.$5.$6")
   tempFileFullPath := RegExReplace(filePath,"(?<=\\)[\d-\. ]{19,}(?=.[a-z]{3})",tempFileFullPath)
   ;msgbox %filePath%`n%tempFileFullPath% 
   FileMove, %filePath%, %tempFileFullPath%, 0
   if ErrorLevel
     msgbox %filePath%
   return
}
