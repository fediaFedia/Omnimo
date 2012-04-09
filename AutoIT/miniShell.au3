#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Modified for Omnimo UI
#AutoIt3Wrapper_Res_Description=Modified for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include "Common.au3"

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include "MouseOnEvent.au3"

Local $vDos, $sline = ""
Const $font = "Segoe UI"
Const $Config = $CmdLine[2]
Const $DataFolder = $CmdLine[3]

Const $SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & "\Documents\Rainmeter\Skins\")
Const $XPosition = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowX", "0")
Const $YPosition = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowY", "0")
$Size = IniRead($SkinPath & $Config & "\size.inc", "Variables", "Height", "150")
$TextColor = IniRead($SkinPath & $Config & "\UserVariables.inc", "Variables", "TextColor", "0x00FF00")
$FontFace = IniRead($SkinPath & $Config & "\UserVariables.inc", "Variables", "Font", "Arial")
$FontSize = IniRead($SkinPath & $Config & "\UserVariables.inc", "Variables", "FontSize", "7")
$BackgroundColor = IniRead($SkinPath & $Config & "\UserVariables.inc", "Variables", "BackgroundColor", "0x000000")
$BackgroundColor2 = IniRead($SkinPath & $Config & "\UserVariables.inc", "Variables", "BackgroundColor2", "0x292929")
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Notes", ($Size * 2 + 10), $Size, $XPosition + 5, $YPosition + 5, BitOR($WS_VISIBLE, $WS_EX_TRANSPARENT, $WS_BORDER, $WS_POPUP), $WS_EX_TOOLWINDOW)
GUISetBkColor(0x292929)
$Edit1 = GUICtrlCreateEdit("Omnimo [Version 5.0.0001] miniCMD ", 0, 0, ($Size * 2 + 10), ($Size / 15 * 13), BitOR($WS_EX_TOOLWINDOW, $WS_VSCROLL, $ES_READONLY, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetStyle(-1, $WS_EX_TOOLWINDOW, $WS_EX_TRANSPARENT)
GUICtrlSetBkColor(-1, $BackgroundColor)
GUICtrlSetFont(-1, $FontSize, 400, 0, $FontFace)
_MouseSetOnEvent($MOUSE_WHEELUP_EVENT , "_WheelDown", "", "", $Form1, -1)
$Group1 = GUICtrlCreateGroup("Command", 8, 400, 433, 57, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetFont(-1, 5, 600, 0, "Segoe UI")
$Input1 = GUICtrlCreateInput("", 0, ($Size / 15 * 13), ($Size * 2 - 10), 20, BitOR($WS_EX_TOOLWINDOW, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetFont(-1, 10, 400, 0, $font)
GUICtrlSetBkColor(-1, $BackgroundColor2)
GUICtrlSetStyle(-1, $WS_EX_TOOLWINDOW, $WS_EX_TRANSPARENT)
GUICtrlSetColor(-1, 0xffffff)
GUICtrlSetState(-1, $GUI_FOCUS)
$Button1 = GUICtrlCreateButton("Go", 280, 130, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
$Closed = GUICtrlCreatePic("close.bmp", ($Size * 2 - 10), ($Size  - 20) , 20, 20)
#EndRegion ### END Koda GUI section ###


;----> Create dummy keys for accelerators
$hENTER = GUICtrlCreateDummy()
Dim $AccelKeys[1][2] = [["{ENTER}", $hENTER]] ; Set accelerators
GUISetAccelerators($AccelKeys)
;<----


Func _WheelDown()
	Exit
EndFunc

While 1
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE, $Closed
                        Exit

                Case $Button1, $hENTER
                        $vDos = Run(@ComSpec & " /c " & GUICtrlRead($Input1), @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                        While 1
                                $sline &= StdoutRead($vDos)
                                If @error Then ExitLoop
                        WEnd
                        GUICtrlSetData($Edit1, $sline & @CRLF)
                        GUICtrlSetData($Input1, "")
                        ;----> Reset
                        $sline = ""
                        ;<----
        EndSwitch
WEnd