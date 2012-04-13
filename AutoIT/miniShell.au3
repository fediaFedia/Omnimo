#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\InstalledPanels\miniCMD\miniShell.exe
#AutoIt3Wrapper_Res_Comment=Modified for Omnimo UI
#AutoIt3Wrapper_Res_Description=miniShell
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

#include "Includes\MouseOnEvent.au3"
#include "Includes\Common.au3"

; Set up variables
Const $font = "Segoe UI"
Const $Config = $CmdLine[2]
Const $DataFolder = $CmdLine[3]

Const $SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & "\Documents\Rainmeter\Skins\")
Const $XPosition = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowX", "0")
Const $YPosition = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowY", "0")
Const $ConfigPath = $SkinPath & $Config

Const $Size = IniRead($ConfigPath & "\size.inc", "Variables", "Height", "150")
Const $TextColor = IniRead($ConfigPath & "\UserVariables.inc", "Variables", "TextColor", "0x00FF00")
Const $FontFace = IniRead($ConfigPath & "\UserVariables.inc", "Variables", "Font", "Arial")
Const $FontSize = IniRead($ConfigPath & "\UserVariables.inc", "Variables", "FontSize", "7")
Const $BackgroundColor = IniRead($ConfigPath & "\UserVariables.inc", "Variables", "BackgroundColor", "0x000000")
Const $BackgroundColor2 = IniRead($ConfigPath & "\UserVariables.inc", "Variables", "BackgroundColor2", "0x292929")

$hGUI = GUICreate("miniShell", ($Size * 2 + 10), $Size, $XPosition + 5, $YPosition + 5, BitOR($WS_VISIBLE, $WS_EX_TRANSPARENT, $WS_BORDER, $WS_POPUP), $WS_EX_TOOLWINDOW)
GUISetBkColor(0x292929)
$Output = GUICtrlCreateEdit("Omnimo [Version 5.0.0001] miniCMD ", 0, 0, ($Size * 2 + 10), ($Size / 15 * 13), BitOR($WS_EX_TOOLWINDOW, $WS_VSCROLL, $ES_READONLY, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL), $WS_EX_TRANSPARENT)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetBkColor(-1, $BackgroundColor)
GUICtrlSetFont(-1, $FontSize, 400, 0, $FontFace)
$Input = GUICtrlCreateInput("", 0, ($Size / 15 * 13), ($Size * 2 - 10), 20, BitOR($WS_EX_TOOLWINDOW, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL), $WS_EX_TRANSPARENT)
GUICtrlSetBkColor(-1, $BackgroundColor2)
GUICtrlSetColor(-1, 0xffffff)
GUICtrlSetFont(-1, 10, 400, 0, $font)
GUICtrlSetState(-1, $GUI_FOCUS)
$Closed = GUICtrlCreatePic("close.bmp", ($Size * 2 - 10), ($Size  - 20), 20, 20)

GUISetState(@SW_SHOW)

; Create dummy keys for accelerators
$hENTER = GUICtrlCreateDummy()
Global $AccelKeys[1][2] = [["{ENTER}", $hENTER]] ; Set accelerators
GUISetAccelerators($AccelKeys)
Global $vDos, $sline = ""

_MouseSetOnEvent($MOUSE_WHEELUP_EVENT , "_WheelDown", "", "", $hGUI, -1)

While 1
        Switch GUIGetMsg()
                Case $GUI_EVENT_CLOSE, $Closed
                        Exit

                Case $hENTER
                        $vDos = Run(@ComSpec & " /c " & GUICtrlRead($Input), @WindowsDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
                        While 1
                                $sline &= StdoutRead($vDos)
                                If @error Then ExitLoop
                        WEnd
                        GUICtrlSetData($Output, $sline)
                        GUICtrlSetData($Input, "")
                        $sline = "" ; Reset
        EndSwitch
WEnd

Func _WheelDown()
	Exit
EndFunc