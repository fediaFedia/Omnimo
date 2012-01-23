#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Panels\miniNotes\notes.exe
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2011
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SliderConstants.au3>
#include <Constants.au3>
#Include <EditConstants.au3>

Opt("TrayIconHide", 1)

$AppDataDir = EnvGet("APPDATA")
$SystemDrive = EnvGet("SYSTEMDRIVE")

If FileFindFirstFile($AppDataDir & "\Rainmeter\Rainmeter.ini") <> -1 Then
	$DataFolder = $AppDataDir & "\Rainmeter\"
ElseIf FileFindFirstFile($SystemDrive & "\Program Files\Rainmeter\Rainmeter.ini") <> -1 Then
	$DataFolder = $SystemDrive & "\Program Files\Rainmeter\"
ElseIf FileFindFirstFile("..\..\..\..\Rainmeter.ini") <> -1 Then
	$DataFolder = "..\..\..\..\"
Else
	MsgBox(4096, "Error", "Could not locate Rainmeter.ini")
	Exit
EndIf

$SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", "")
$XPosition = IniRead($DataFolder & "Rainmeter.ini", "WP7\Panels\miniNotes", "WindowX", "")
$YPosition = IniRead($DataFolder & "Rainmeter.ini", "WP7\Panels\miniNotes", "WindowY", "")
$Size = IniRead($SkinPath & "WP7\Panels\miniNotes\size.inc", "Variables", "Height","")
$font = "Segoe UI"
$file = FileOpen($SkinPath & "WP7\Panels\miniNotes\Notes.txt", 0)
$text = FileRead($file)
FileClose($file)
$parse = StringRegExpReplace($text, "\[Variables\]" & @CRLF & "Notes=", "")
$Gui = GUICreate("Notes", $Size, $Size, $XPosition+5, $YPosition+5, BitOR($WS_VISIBLE,$WS_POPUP),$WS_EX_TOOLWINDOW)
GUISetBkColor(0x292929)
$Drag = GUICtrlCreatePic("gradient.jpg", $Size/30, 0, $Size/3.75, $Size/30, Default, $GUI_WS_EX_PARENTDRAG)
$Notes = GUICtrlCreateEdit($parse, 10, 10, $Size-20, $Size/3*2, $ES_MULTILINE + $ES_AUTOVSCROLL, 0)
GUICtrlSetFont(-1, $Size/15, 400, 0, $font)
GUICtrlSetBkColor(-1, 0x292929)
GUICtrlSetColor(-1, 0xffffff)
$CancelButton = GUICtrlCreatePic("button.jpg", 0, $Size-($Size/7.5), $Size/3, $Size/7.5, Default, $GUI_WS_EX_PARENTDRAG)
$Cancel = GUICtrlCreateLabel("Cancel", $Size/15, $Size/1.15, $Size/3, $Size/7.5)
GUICtrlSetFont(-1, $Size/15, 400, 0, $font)
GUICtrlSetBkColor(-1, 0x1d1d1d)
GUICtrlSetColor(-1, 0xffffff)
$SaveButton = GUICtrlCreatePic("button.jpg", $Size-($Size/3), $Size-($Size/7.5), $Size/3, $Size/7.5, Default, $GUI_WS_EX_PARENTDRAG)
$Save = GUICtrlCreateLabel("Save", $Size/1.35,  $Size/1.15, $Size/3, $Size/7.5)
GUICtrlSetFont(-1, $Size/15, 400, 0, $font)
GUICtrlSetBkColor(-1, 0x1d1d1d)
GUICtrlSetColor(-1, 0xffffff)
GUISetState(@SW_SHOWNOACTIVATE)

While 1

	$nMsg = GUIGetMsg()

	Switch $nMsg

			Case $GUI_EVENT_CLOSE
				Exit

			Case $CancelButton
				Exit

			Case $SaveButton, $Save
				$file2 = FileOpen($SkinPath & "WP7\Panels\miniNotes\Notes.txt", 2)
				FileWrite($file2, "[Variables]" & @CRLF & "Notes=" & GUICtrlRead($Notes))
				FileClose($file2)
				ShellExecute("refresh.exe", "/!RainmeterRefresh WP7\Panels\miniNotes")
				Exit

	EndSwitch

WEnd