' Hides the flashing command window
' https://superuser.com/a/62646/1047024
CreateObject("Wscript.Shell").Run "" & WScript.Arguments(0) & "", 0, False