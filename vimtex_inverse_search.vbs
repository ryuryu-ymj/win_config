l = WScript.Arguments(0)
f = WScript.Arguments(1)
s = "wsl nvim --headless -c 'VimtexInverseSearch " & l & " '(string replace -r '/mnt/c/wsl.+/home' '/home' (wslpath '" & f & "'))"
CreateObject("WScript.Shell").run s, 0