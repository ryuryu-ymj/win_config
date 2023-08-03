l = WScript.Arguments(0)
f = WScript.Arguments(1)
s = "wsl echo nvim --headless -c \""VimtexInverseSearch " & l & " $(wslpath -u '" & f & "')\"" ^| /home/linuxbrew/.linuxbrew/bin/fish"
CreateObject("WScript.Shell").run s, 0