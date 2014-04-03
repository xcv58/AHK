#2::
   InputBox, photoPath, Please Input the PATH of Camera Uploads , like:D:\Dropbox\Camera Uploads, , 300,128   ;input setting
   if ErrorLevel
      MsgBox, Exit，88~
   else
   {
      photoPath := RegExReplace(photoPath,"\\$","")   ;删除末尾多余的\ | Delete the extra \ in the end of the path
      ;MsgBox, You entered "%photoPath%"
      Loop, %photoPath%\*.*, 0, 1    ;Loop the input fold
      {
          ;MsgBox, 4, , Filename = %A_LoopFileFullPath%`n`nContinue?
          tempFile = %A_LoopFileFullPath%
          FoundPos := RegExMatch(tempFile, "2002-12-08 12.00.00")   ;detect one file is a file with time bug
          if FoundPos
          {
             ;msgbox %tempFile% %FoundPos%
             renameOneFile(tempFile)   ;process one file
          }
      }
   }
return

renameOneFile(filePath)
{
   FileGetTime, modifiedTime, %filePath%    ;get the modified time
   ;tempFileFullPath := RegExReplace(modifiedTime,"(\d4)(\d2)(\d2)(\d2)(\d2)(\d2)","$1-$2-$3 $4.$5.$6")
   tempFileFullPath := RegExReplace(modifiedTime,"(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})","$1-$2-$3 $4.$5.$6")    ;convert only number time to the Dropbox format file name
   tempFileFullPath := RegExReplace(filePath,"(?<=\\)[\d-\. ]{19,}(?=.[a-z]{3})",tempFileFullPath)  ;add path
   ;msgbox %filePath%`n%tempFileFullPath% 
   FileMove, %filePath%, %tempFileFullPath%, 0   ;change the file name
   if ErrorLevel
     msgbox %filePath%      ;msg the file path that cannot be changed for user
   return
}
