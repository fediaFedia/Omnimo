#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Panels\miniNotes\notes.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2012
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

#include "Common.au3"

If $CmdLine[0] < 1 Then _OmnimoError("miniNotes", "Too few command line arguments specified.")
Const $DataFolder = $CmdLine[1]

; Set up variables
Const $font = "Segoe UI"
Const $SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & '\Documents\Rainmeter\Skins\')
Const $XPosition = IniRead($DataFolder & "Rainmeter.ini", "WP7\Panels\miniNotes", "WindowX", "0")
Const $YPosition = IniRead($DataFolder & "Rainmeter.ini", "WP7\Panels\miniNotes", "WindowY", "0")
Const $Size = IniRead($SkinPath & "WP7\Panels\miniNotes\size.inc", "Variables", "Height", "150")
Const $text = StringReplace(IniRead($SkinPath & "WP7\Panels\miniNotes\Notes.txt", "Variables", "Notes", ""), "#CRLF#", @CRLF)

$Gui = GUICreate("Notes", $Size, $Size, $XPosition + 5, $YPosition + 5, BitOR($WS_VISIBLE, $WS_POPUP), $WS_EX_TOOLWINDOW)
GUISetBkColor(0x292929)

$Drag = GUICtrlCreatePic("gradient.jpg", $Size / 30, 0, $Size / 3.75, $Size / 30, Default, $GUI_WS_EX_PARENTDRAG)
$Notes = GUICtrlCreateEdit($text, 10, 10, $Size - 20, $Size / 3 * 2, BitOR($ES_MULTILINE, $ES_AUTOVSCROLL, $ES_WANTRETURN), 0)
GUICtrlSetFont(-1, $Size / 15, 400, 0, $font)
GUICtrlSetBkColor(-1, 0x292929)
GUICtrlSetColor(-1, 0xffffff)

$CancelButton = GUICtrlCreatePic("button.jpg", 0, $Size - ($Size / 7.5), $Size / 3, $Size / 7.5)
$Cancel = GUICtrlCreateLabel("Cancel", $Size / 15, $Size / 1.15, $Size / 3, $Size / 7.5)
GUICtrlSetFont(-1, $Size / 15, 400, 0, $font)
GUICtrlSetBkColor(-1, 0x1d1d1d)
GUICtrlSetColor(-1, 0xffffff)
$SaveButton = GUICtrlCreatePic("button.jpg", $Size - ($Size / 3), $Size - ($Size / 7.5), $Size / 3, $Size / 7.5)
$Save = GUICtrlCreateLabel("Save", $Size / 1.35, $Size / 1.15, $Size / 3, $Size / 7.5)

GUICtrlSetFont(-1, $Size / 15, 400, 0, $font)
GUICtrlSetBkColor(-1, 0x1d1d1d)
GUICtrlSetColor(-1, 0xffffff)

GUISetState(@SW_SHOWNOACTIVATE)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE, $CancelButton
			Exit

		Case $SaveButton, $Save
			$newtext = StringReplace(GUICtrlRead($Notes), @CRLF, "#CRLF#")
			IniWriteSection($SkinPath & "WP7\Panels\miniNotes\Notes.txt", "Variables", "Notes=" & $newtext)
			SendBang("!Refresh WP7\Panels\miniNotes")
			Exit

	EndSwitch

WEnd