#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Common\Size\size.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Panel Resizer
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2012
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <SliderConstants.au3>

#include "Common.au3"

; Check arguments
If $CmdLine[0] < 3 Then _OmnimoError("Omnimo Panel Resizer", "Too few command line arguments specified.")

; Set up variables
Const $Config = $CmdLine[2]
Const $SettingsPath = $CmdLine[3]
Const $SkinsPath = IniRead($SettingsPath & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & "\Documents\Rainmeter\Skins\")

$XPosition = IniRead($SettingsPath & "Rainmeter.ini", $Config, "WindowX", "0")
$YPosition = IniRead($SettingsPath & "Rainmeter.ini", $Config, "WindowY", "0")
$Size = IniRead($SkinsPath & $Config & "\size.inc", "Variables", "Height", "150")

; Set up GUI measurements
$Width = $Size
$Height = $Size

Switch $CmdLine[1]
	Case "single"
		$XPosition += 4
	Case "double"
		$XPosition += 4
		$Width = $Size * 2 + 10 ; double the width
	Case "doubleV"
		$XPosition += 4
		$Height = $Size * 2 + 10 ; double the height
	Case "all"
		$Width = 202
		$Height = 291
EndSwitch

; Create GUI
$Gui = GUICreate("", $Width + 16, 26, $XPosition, $YPosition + $Height + 5, BitOR($WS_BORDER, $WS_POPUP), $WS_EX_TOOLWINDOW)
$slider = GUICtrlCreateSlider(0, 1, $Width - 43, 25, $TBS_NOTICKS)
$input = GUICtrlCreateInput($Size, $Width - 43, 3, 40, 20)
$updown = GUICtrlCreateUpdown(-1)
$closed = GUICtrlCreatePic("close.jpg", $Width, 0, 16, 26)
$prevsize = $Size

; Set slider range and position
GUICtrlSetLimit($slider, 300, 100)
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
			IniWrite($SkinsPath & $Config & "\size.inc", "Variables", "Height", $newsize)

			If $CmdLine[1] = "All" Then
				_ResizePanels('WP7\Panels')
				_ResizePanels('WP7\InstalledPanels')
				SendBang("!Refresh *") ; refresh Rainmeter
			Else
				SendBang("!Refresh " & $Config) ; refresh panel
			EndIf

			Exit

		Case $updown, $input
			GUICtrlSetData($slider, GUICtrlRead($input))

	EndSwitch
WEnd

Func _ResizePanels($path)
	$files = RecursiveFileSearch($SkinsPath & $path)
	If Not $files[0] Then Return
	For $i = 1 To $files[0]
		IniWrite($files[$i] & "\size.inc", "Variables", "Height", GUICtrlRead($input))
	Next
EndFunc

Func RecursiveFileSearch($RFSstartDir, $RFSdepth = 0)
	;Ensure starting folder has a trailing slash
	If StringRight($RFSstartDir, 1) <> "\" Then $RFSstartDir &= "\"

	If $RFSdepth = 0 Then
		;Get count of all files in subfolders for initial array definition
		$RFSfilecount = DirGetSize($RFSstartDir, 1)
		;File count + folder count (will be resized when the function returns)
		Global $RFSarray[$RFSfilecount[1] + $RFSfilecount[2] + 1]
	EndIf

	$RFSsearch = FileFindFirstFile($RFSstartDir & "*.*")
	If @error Then Return

	;Search through all files and folders in directory
	While 1
		$RFSnext = FileFindNextFile($RFSsearch)
		If @error Then ExitLoop

		;If folder and recurse flag is set and regex matches
		If StringInStr(FileGetAttrib($RFSstartDir & $RFSnext), "D") Then
			RecursiveFileSearch($RFSstartDir & $RFSnext, $RFSdepth + 1)
			;Append folder name to array
			$inis = _FileListToArray($RFSstartDir & $RFSnext, '*.ini')
			If $inis <> 0 And $inis[0] Then
				$RFSarray[$RFSarray[0] + 1] = $RFSstartDir & $RFSnext
				$RFSarray[0] += 1
			EndIf
		EndIf
	WEnd
	FileClose($RFSsearch)

	If $RFSdepth = 0 Then
		Redim $RFSarray[$RFSarray[0] + 1]
		Return $RFSarray
	EndIf
EndFunc