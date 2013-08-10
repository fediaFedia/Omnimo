#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\Size\size.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Panel Resizer
#AutoIt3Wrapper_Res_Fileversion=6.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SliderConstants.au3>

#include "Includes\Common.au3"

; Check arguments
If $CmdLine[0] < 4 Then OmnimoError("Omnimo Panel Resizer", "Too few command line arguments specified.")

; Set up variables
Const $Config = $CmdLine[2]
Const $File = $CmdLine[3]
Const $SettingsPath = $CmdLine[4]
Const $SkinsPath = IniRead($SettingsPath & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & "\Documents\Rainmeter\Skins\")

; Resize all without GUI
If $CmdLine[0] = 5 Then
	_ResizeAll($CmdLine[4])
	Exit
EndIf

Const $Size = IniRead($SkinsPath & $Config & "\" & $File, "Variables", "Height", "150")
$XPosition  = IniRead($SettingsPath & "Rainmeter.ini", $Config, "WindowX", "0") + 4
$YPosition  = IniRead($SettingsPath & "Rainmeter.ini", $Config, "WindowY", "0")

; Set up GUI measurements
$Width = $Size
$Height = $Size

Switch $CmdLine[1]
	Case "double"
		$Width = $Size * 2 + 10 ; double the width
	Case "doubleV"
		$Height = $Size * 2 + 10 ; double the height
	Case "all"
		$XPosition -= 4
		$Width = 202
		$Height = 291
EndSwitch

; Create GUI
$Gui      = GUICreate("", $Width + 16, 26, $XPosition, $YPosition + $Height + 5, BitOR($WS_BORDER, $WS_POPUP), $WS_EX_TOOLWINDOW)
$slider   = GUICtrlCreateSlider(0, 1, $Width - 43, 25, $TBS_NOTICKS)
$input    = GUICtrlCreateInput($Size, $Width - 43, 3, 40, 20)
$updown   = GUICtrlCreateUpdown(-1)
$closed   = GUICtrlCreatePic("close.jpg", $Width, 0, 16, 26)
$prevsize = $Size

; Set slider range and position
GUICtrlSetLimit($slider, 300, 70)
GUICtrlSetData($slider, $Size)

GUISetState(@SW_SHOW)

While 1
	Sleep(50)

	$newsize = GuiCtrlRead($slider)
	If $newsize <> $prevsize Then
		GUICtrlSetData($input, $newsize)
		$prevsize = $newsize
	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			Exit

		Case $closed
			If $newsize = $Size Then Exit
			IniWrite($SkinsPath & $Config & "\" & $File, "Variables", "Height", $newsize)

			If $CmdLine[1] = "all" Then
				MsgBox(48, "Warning", "Resizing all panels might take a while")
				_ResizeAll(GUICtrlRead($input))
				SendBang("!Refresh *") ; refresh Rainmeter
			Else
				SendBang("!Refresh " & $Config) ; refresh panel
			EndIf

			Exit

		Case $updown, $input
			GUICtrlSetData($slider, GUICtrlRead($input))

	EndSwitch
WEnd

Func _ResizeAll($size)
	_ResizePanels('WP7\Panels\', $size)
	_ResizePanels('WP7\InstalledPanels\', $size)
EndFunc

Func _ResizePanels($path, $size)
	$files = RecursiveFileSearch($SkinsPath & $path, ".*ini$", ".", 1)
	If $files = -1 Or Not $files[0] Then Return
	For $i = 1 To $files[0]
		IniWrite($files[$i], "Variables", "Height", $size)
	Next
EndFunc

Func RecursiveFileSearch($RFSstartDir, $RFSFilepattern = ".", $RFSFolderpattern = ".", $RFSFlag = 0, $RFSrecurse = true, $RFSdepth = 0)
     If StringRight($RFSstartDir, 1) <> "\" Then $RFSstartDir &= "\"

     If $RFSdepth = 0 Then
		$RFSfilecount = DirGetSize($RFSstartDir, 1)

        If IsArray($RFSfilecount) Then
            Global $RFSarray[$RFSfilecount[1] + $RFSfilecount[2] + 1]
        Else
            SetError(1)
            Return
        EndIf
     EndIf

	$RFSsearch = FileFindFirstFile($RFSstartDir & "*.*")
	If @error Then Return

	While 1
		$RFSnext = FileFindNextFile($RFSsearch)
		If @error Then ExitLoop

		If StringInStr(FileGetAttrib($RFSstartDir & $RFSnext), "D") Then
             If $RFSrecurse And StringRegExp($RFSnext, $RFSFolderpattern, 0) Then
				RecursiveFileSearch($RFSstartDir & $RFSnext, $RFSFilepattern, $RFSFolderpattern, $RFSFlag, $RFSrecurse, $RFSdepth + 1)
				If $RFSFlag <> 1 Then
					$RFSarray[$RFSarray[0] + 1] = $RFSstartDir & $RFSnext
					$RFSarray[0] += 1
				EndIf
			EndIf
		ElseIf StringRegExp($RFSnext, $RFSFilepattern, 0) And $RFSFlag <> 2 Then
			$RFSarray[$RFSarray[0] + 1] = $RFSstartDir & $RFSnext
			$RFSarray[0] += 1
		EndIf
	WEnd
	FileClose($RFSsearch)

	If $RFSdepth = 0 Then
		Redim $RFSarray[$RFSarray[0] + 1]
		Return $RFSarray
	EndIf
EndFunc