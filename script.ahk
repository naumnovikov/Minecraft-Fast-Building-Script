#NoEnv 
SendMode Input 
SetBatchLines, -1  
;81.9

Home::
    loopstop = 0
    Send {s down}
    Sleep 225
    Send {Lshift down}
    Sleep 120
    Click right
    Send {Lshift up}
    Loop, 1000
    {
        Sleep 200
        Send {Lshift down}
        Sleep 140
        Click right
        Sleep 30
        Send {Lshift up}
        if loopstop = 1
        {
            loopstop = 0
            break
        }
    }
    Send {s up}
    Send {w}
    Sleep 50
return

~$X::
    Send {s down}
    Send {Space down}
    
    
    while GetKeyState("X", "P")
    {
        Click right
        Sleep % Random(6, 12)
    }
    
    Send {s up}
    Send {Space up}
return

Random(min, max) {
    Random, rand, %min%, %max%
    return rand
}

*End::
    loopstop = 1
    SixClickEnabled := false
return

SixClickEnabled := false

*XButton2::
    SixClickEnabled := false
    Sleep, 30
return

$LButton::
    if (SixClickEnabled)
    {
        Loop, 6
        {
            Click down
            Sleep, 30
            Click up
            Sleep, 30
        }
    }
    else
    {
        ; Обычный режим: позволяет зажимать и выделять
        Send {LButton down}
        KeyWait, LButton ; Ждем, пока вы отпустите кнопку
        Send {LButton up}
    }
return

*XButton1::
	SixClickEnabled := true
	Sleep, 30
return

Del::ExitApp


