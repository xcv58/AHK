F8::
   Click,2
   Send ^c
   speech(Clipboard)
return

F7::
   Send ^c
   speech(Clipboard)
return

#If WinActive("ahk_class Vim")
!h::
F6::
^h::
   Send {Home}v{End}{Left}
   Send ^c
   speech(Clipboard)
return
#If


speech(word)
{
   SpeechPath = D:\Speech\
   FileType = .mp3
   SpeechPath1 = D:\Program Files\Lingoes\Translator2\speech\webster\voice\
   FileType1 = .wav
   SpeechPath2 = D:\Program Files\Lingoes\Translator2\speech\Longman
   FileType2 = .mp3

   Error = C:\Windows\Media\Windows Error.wav
   targetWord := word

   StringGetPos, pos, targetWord, `n
   if pos >= 0
   {
     StringLeft, targetWord, targetWord, pos-1
     ;MsgBox,  %pos%`n%targetWord%
     send zc
   }

   StringReplace, targetWord, targetWord, %A_SPACE%, , All
   StringReplace, targetWord, targetWord, %A_Tab%, , All
   StringReplace, targetWord, targetWord, ., , All
   StringReplace, targetWord, targetWord, 1, , All
   StringReplace, targetWord, targetWord, 2, , All
   StringReplace, targetWord, targetWord, 3, , All
   StringReplace, targetWord, targetWord, 4, , All
   StringReplace, targetWord, targetWord, 5, , All
   StringReplace, targetWord, targetWord, 6, , All
   StringReplace, targetWord, targetWord, 7, , All
   StringReplace, targetWord, targetWord, 8, , All
   StringReplace, targetWord, targetWord, 9, , All
   StringReplace, targetWord, targetWord, 0, , All
   StringReplace, targetWord, targetWord, =, , All
   ;StringReplace, targetWord, targetWord, -, , All
   StringReplace, targetWord, targetWord, <, , All
   StringReplace, targetWord, targetWord, >, , All
   StringReplace, targetWord, targetWord, +, , All
   StringReplace, targetWord, targetWord, ~, , All
   StringReplace, targetWord, targetWord, 　, , All

   StringMid, initialLetter, targetWord, 0, 1
   SpeechFile = %SpeechPath%%initialLetter%\%targetWord%%FileType%
   SpeechFile1 = %SpeechPath1%%initialLetter%\%targetWord%%FileType1%
   SpeechFile2 = %SpeechPath2%%initialLetter%\%targetWord%%FileType2%
   FileGetSize, fileSize, %SpeechFile%
   if fileSize =
   {
      FileGetSize, fileSize1, %SpeechFile1%
      if fileSize1 = 
      {
         FileGetSize, fileSize2, %SpeechFile2%
         if fileSize2 = 
         {
           SoundPlay, %Error%
           return
         }
         else
         {
           SoundPlay, %SpeechFile2%
         } 
      }
      else
      {
         SoundPlay, %SpeechFile1%
      }
      return
   }
   else
   {
      SoundPlay, %SpeechFile%
   }
return
}


