#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icons\ColorChooser.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\ColorChanger.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=6.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>

#include "Includes\Common.au3"
#include "Includes\ColorChooser.au3"
#include "Includes\MouseOnEvent.au3"

If $CmdLine[0] < 1 Then OmnimoError("Individual Panel Color", "Too few command line arguments specified.")

; Setup variables
Const $SettingsPath = $CmdLine[1]
Const $SkinPath = IniRead($SettingsPath & 'Rainmeter.ini', 'Rainmeter', 'SkinPath', @UserProfileDir & '\Documents\Rainmeter\Skins\')
Const $Opacity = IniRead($SkinPath & '\WP7\Common\Color\color.inc', 'Variables', 'Opacity', '255')
Const $Variables = $SkinPath & "WP7\Common\Variables\"

Const $BgColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor", "0xe1e1e1")
Const $BgColor2 = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor2", "0xd2d2d2")
Const $TextColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigTextColor", "0x323232")

Const $GuiOptions = BitOR($WS_VISIBLE, $WS_SYSMENU, $WS_BORDER)
Const $ListOptions = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL)

; Create GUI
$hGUI = GUICreate("Change panel color", 379, 288, 356, 317, $GuiOptions)
GUISetBkColor($BgColor)
$PanelList = GUICtrlCreateList("", 8, 32, 177, 214, $ListOptions, 0)
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
$DefaultColor = GUICtrlCreateButton("Default color", 198, 216, 78, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$ApplyColor = GUICtrlCreateButton("Apply color", 278, 216, 78, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$RefreshList = GUICtrlCreateLabel("[Refresh active panels]", 8, 10, 120, 17)
GUICtrlSetColor(-1, $TextColor)
$plus = GUICtrlCreatePic("plus.bmp", 320, 152, 33, 33)
GUICtrlSetState(-1, $GUI_HIDE)

; Close GUI on middle-click
_MouseSetOnEvent($MOUSE_WHEELUP_EVENT , "_WheelDown", "", "", $hGUI, -1)

GUISetState(@SW_SHOW)

; Read colors into an array
Global $colors[17]
_FileReadToArray('colors.txt', $colors)
If @error Then OmnimoError("Individual Panel Color", "Unable to read colors from colors.txt.")

; Read blacklist into an array
Global $blacklist[100]
_FileReadToArray('blacklist.txt', $blacklist)
If @error Then OmnimoError("Individual Panel Color", "Unable to read blacklist from blacklist.txt.")

Global $Color = IniRead($SkinPath & '\WP7\Common\Color\color.inc', 'Variables', 'ColorSkin', '27,161,226,' & $Opacity) & ',' & $Opacity
Global $Custom = $Color
Global $ButtonsHidden = 1
Global $prev = 0

; Width and height for the color buttons
Const $Width = 33
Const $Height = 33

; Create color buttons and their borders
Global $ColorButtons[16]
Global $ColorButtonsb[16]
For $i = 0 To 3
	$x = $i * 40 + 200 ; button x position
	For $j = 0 To 3
		$y = $j * 40 + 32 ; button y position
		$k = $i * 4 + $j ; list index for the element
		$ColorButtons[$k] = GUICtrlCreateGraphic($x, $y, $Width, $Height)
		$ColorButtonsb[$k] = GUICtrlCreateGraphic($x - 1, $y - 1, $Width + 2, $Height + 2)
		GUICtrlSetBkColor($ColorButtons[$k], $colors[$k + 1])
		GUICtrlSetGraphic($ColorButtonsb[$k], $GUI_GR_COLOR, 0x000000)
		GUICtrlSetGraphic($ColorButtonsb[$k], $GUI_GR_PENSIZE, 1)
		GUICtrlSetGraphic($ColorButtonsb[$k], $GUI_GR_RECT, 0, 0, $Width + 2, $Height + 2)
		GUICtrlSetState($ColorButtons[$k], $GUI_HIDE)
		GUICtrlSetState($ColorButtonsb[$k], $GUI_HIDE)
	Next
Next

; Read active skins from Rainmeter.ini
_ReadActiveSkins()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			Exit

		Case $PanelList
			; Show all buttons
			If $ButtonsHidden Then
				For $i = 0 To 15
					GUICtrlSetState($ColorButtons[$i], $GUI_SHOW)
				Next
				GUICtrlSetState($DefaultColor, $GUI_SHOW)
				GUICtrlSetState($ApplyColor, $GUI_SHOW)
				GUICtrlSetState($plus, $GUI_SHOW)
				$ButtonsHidden = 0
			EndIf

		Case $DefaultColor, $ApplyColor
			$selected = GUICtrlRead($PanelList)
			; List all ini files in panel's directory
			$filelist = _FileListToArray($SkinPath & 'WP7\' & $selected, '*.ini', 1)
			; Write 'ColorSkin' variable to each file
			For $i = 1 To UBound($filelist) - 1
				$filepath = $SkinPath & 'WP7\' & $selected & '\' & $filelist[$i]
				If $nMsg = $DefaultColor Then
					IniDelete($filepath, "Variables", "ColorSkin")
				Else
					IniWrite($filepath, "Variables", "ColorSkin", $Color)
				EndIf
			Next

			; Refresh panel
			SendBang("!Refresh WP7\" & $selected)

		Case $RefreshList
			_ReadActiveSkins()

		Case $plus, $ColorButtons[15]
			; Show a color chooser dialog for custom color
			$Data = _ColorChooserDialog(RGBToHex($Custom), $hGUI)
			If $Data = -1 Then ContinueCase
			GUICtrlSetBkColor($ColorButtons[15], $Data)
			GUICtrlSetState($plus, $GUI_HIDE)
			$Color = _ColorChoose(15, $Data)
			$Custom = $Color

		Case Else
			For $i = 0 To 14
				If $nMsg = $ColorButtons[$i] Then
					$Color = _ColorChoose($i, $colors[$i + 1])
					ExitLoop
				EndIf
			Next

	EndSwitch
WEnd

; Read active skins from Rainmeter.ini
Func _ReadActiveSkins()
	$file = FileOpen($SettingsPath & '\Rainmeter.ini')
	If $file = -1 Then OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")

	GUICtrlSetData($PanelList, "")
	While 1
		$line = FileReadLine($file)
		If @error = -1 Then ExitLoop
		; Only want panels here
		If StringRegExp($line, '^\[WP7\\(Installed|Donator)?Panels.*\]$') Then
			If FileReadLine($file) <> 'Active=0' Then
				$mark = False
				$escaped = StringRegExpReplace($line, "[\[\]]", "")
				For $j = 1 To $blacklist[0]
					If StringInStr($escaped, $blacklist[$j]) Then
						$mark = True ; Panel was on blacklist!
						ExitLoop
					EndIf
				Next
				If Not $mark Then GUICtrlSetData($PanelList, StringReplace($escaped, "WP7\", ""))
			EndIf
		EndIf
	Wend

	FileClose($file)
EndFunc

Func _ColorChoose($n, $hex)
	GUICtrlSetState($ColorButtonsb[$prev], $GUI_HIDE)
	GUICtrlSetState($ColorButtonsb[$n], $GUI_SHOW)
	$prev = $n
	Return HexToRGB($hex) & ',' & $Opacity
EndFunc

Func _WheelDown()
	Exit
EndFunc