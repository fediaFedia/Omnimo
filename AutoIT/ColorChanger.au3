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
#include <GuiMenu.au3>
#include <GuiListBox.au3>

#include "Includes\Common.au3"
#include "Includes\ColorChooser.au3"
#include "Includes\ColorGenerator.au3"

If $CmdLine[0] < 1 Then OmnimoError("Individual Panel Color", "Too few command line arguments specified.")

; Setup variables
Const $SettingsPath = $CmdLine[1]
Const $SkinPath = IniRead($SettingsPath & 'Rainmeter.ini', 'Rainmeter', 'SkinPath', @UserProfileDir & '\Documents\Rainmeter\Skins\')
Const $Opacity = IniRead($SkinPath & '\WP7\@Resources\Common\Color\color.inc', 'Variables', 'Opacity', '255')
Const $Variables = $SkinPath & "WP7\@Resources\Common\Variables\"

Const $BgColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor", "0xe1e1e1")
Const $BgColor2 = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor2", "0xd2d2d2")
Const $TextColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigTextColor", "0x323232")

Const $GuiOptions = BitOR($WS_VISIBLE, $WS_SYSMENU, $WS_BORDER)
Const $ListOptions = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL, $LBS_EXTENDEDSEL)

; Create GUI
$hGUI = GUICreate("Change panel color", 445, 240, Default, Default, $GuiOptions)
GUISetBkColor($BgColor2)
GUICtrlCreateGraphic(0, 0, 165, 240) ; left pane
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetState(-1, $GUI_DISABLE)
$PanelList = GUICtrlCreateList("", 8, 10, 145, 175, $ListOptions, 0)
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
$SelectAll = GUICtrlCreateLabel("Select all", 10, 190, 50, 20)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetBkColor(-1, $BgColor)
$Refresh = GUICtrlCreateLabel("Refresh", 110, 190, 50, 20)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetBkColor(-1, $BgColor)
$Random = GUICtrlCreateButton("Random", 184, 170, 76, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$Reset = GUICtrlCreateButton("Reset", 342, 170, 77, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$NewPalette = GUICtrlCreateButton("New palette", 263, 170, 76, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$plus = GUICtrlCreatePic("plus.jpg", 385, 108, 33, 33)
GUICtrlSetState(-1, $GUI_HIDE)

GUISetState(@SW_SHOW)

; Read colors into an array
Global $colors[19]
_FileReadToArray('colors.txt', $colors)
If @error Then OmnimoError("Individual Panel Color", "Unable to read colors from colors.txt.")

Global $Color = IniRead($SkinPath & '\WP7\@Resources\Common\Color\color.inc', 'Variables', 'ColorSkin', '27,161,226') & ',' & $Opacity
Global $ButtonsHidden = True
Global $prev = 0
Global $NumPanels = 0
Global $panels[100]

; Width and height for the color buttons
Const $Width = 33
Const $Height = 33

; Create color buttons and their borders
Global $ColorButtons[18]
Global $ColorButtonsb[18]
CreateColorButtons()
SetColorButtons()

; Read active skins from Rainmeter.ini
ReadActiveSkins()

$hContextMenu = GUICtrlCreateContextMenu($NewPalette)
$_Default = GUICtrlCreateMenuItem("Default", $hContextMenu)
$_Colorful = GUICtrlCreateMenuItem("Colorful", $hContextMenu)
$_Contigious = GUICtrlCreateMenuItem("Contigious", $hContextMenu)
$_Contrasting = GUICtrlCreateMenuItem("Contrasting", $hContextMenu)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			_FileWriteFromArray("colors.txt", $colors, 1)
			Exit

		Case $SelectAll
			For $i = 0 To $NumPanels - 1
				_GUICtrlListBox_SetSel($PanelList, $i)
			Next
			ShowElements()

		Case $Refresh
			ReadActiveSkins()

		Case $Random
			$ret = _GUICtrlListBox_GetSelItems($PanelList)
			For $j = 1 To $ret[0]
				ApplyColor($Panels[$ret[$j]], HexToRGB($colors[Random(1, 17, 1)]) & ',' & $Opacity)
			Next

		Case $NewPalette
			_GUICtrlMenu_TrackPopupMenu(GUICtrlGetHandle($hContextMenu), $hGUI)

		Case $_Default
			_FileReadToArray("defaultcolors.txt", $colors)
			SetColorButtons()

		Case $_Colorful
			GenerateColorful($colors)
			SetColorButtons()

		Case $_Contigious
			GenerateContigious($colors)
			SetColorButtons()

		Case $_Contrasting
			GenerateContrasting($colors)
			SetColorButtons()

		Case $PanelList
			ShowElements()

		Case $Reset
			$ret = _GUICtrlListBox_GetSelItems($PanelList)
			For $j = 1 To $ret[0]
				ApplyColor($Panels[$ret[$j]], -1)
			Next

		Case $plus, $ColorButtons[17]
			; Show a color chooser dialog for custom color
			$Data = _ColorChooserDialog(0x000000, $hGUI)
			If $Data = -1 Then ContinueCase
			$Selected = HexToRGB($Data) & ',' & $Opacity
			$ret = _GUICtrlListBox_GetSelItems($PanelList)
			For $j = 1 To $ret[0]
				ApplyColor($Panels[$ret[$j]], $Selected)
			Next

		Case Else
			For $i = 0 To 16
				If $nMsg = $ColorButtons[$i] Then
					$ret = _GUICtrlListBox_GetSelItems($PanelList)
					$Color = ColorChoose($i, $colors[$i + 1])
					For $j = 1 To $ret[0]
						ApplyColor($Panels[$ret[$j]], $Color)
					Next
					ExitLoop
				EndIf
			Next

	EndSwitch
WEnd

Func CreateColorButtons()
	For $i = 0 To 5
		$x = $i * 40 + 185 ; button x position
		For $j = 0 To 2
			$y = $j * 40 + 28 ; button y position
			$k = $i * 3 + $j ; list index for the element
			$ColorButtons[$k] = GUICtrlCreateGraphic($x, $y, $Width, $Height)
			$ColorButtonsb[$k] = GUICtrlCreateGraphic($x - 1, $y - 1, $Width + 2, $Height + 2)
			GUICtrlSetGraphic($ColorButtonsb[$k], $GUI_GR_COLOR, 0x000000)
			GUICtrlSetGraphic($ColorButtonsb[$k], $GUI_GR_PENSIZE, 1)
			GUICtrlSetGraphic($ColorButtonsb[$k], $GUI_GR_RECT, 0, 0, $Width + 2, $Height + 2)
			GUICtrlSetState($ColorButtons[$k], $GUI_HIDE)
			GUICtrlSetState($ColorButtonsb[$k], $GUI_HIDE)
		Next
	Next
EndFunc

Func SetColorButtons()
	For $i = 0 To 16
		GUICtrlSetBkColor($ColorButtons[$i], $colors[$i + 1])
	Next
EndFunc

Func ShowElements()
	If Not $ButtonsHidden Then Return
	For $i = 0 To 17
		GUICtrlSetState($ColorButtons[$i], $GUI_SHOW)
	Next
	GUICtrlSetState($Random, $GUI_SHOW)
	GUICtrlSetState($Reset, $GUI_SHOW)
	GUICtrlSetState($NewPalette, $GUI_SHOW)
	GUICtrlSetState($plus, $GUI_SHOW)
	$ButtonsHidden = False
EndFunc

Func ReadActiveSkins()
	Const $RainmeterINI = $SettingsPath & "\Rainmeter.ini"
	Const $Sections = IniReadSectionNames($RainmeterINI)
	If @error Then OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")

	$NumPanels = 0
	GUICtrlSetData($PanelList, "")
	For $i = 1 To $Sections[0]
		; Only want panels here
		If StringRegExp($Sections[$i], '^WP7\\(Installed|Donator)?Panels.*$') Then
			If IniRead($RainmeterINI, $Sections[$i], "Active", "0") <> "0" And FileExists($SkinPath & $Sections[$i]) Then
				$config = StringReplace($Sections[$i], "WP7\", "WP7\@Resources\Config\") & "\RainConfigure.cfg"
				If IniRead($config, "Options", "Colorizable", "1") == "0" Then ContinueLoop
				GUICtrlSetData($PanelList, StringRegExpReplace($Sections[$i], "WP7\\(Installed|Donator)?Panels\\", ""))
				$Panels[$NumPanels] = $Sections[$i]
				$NumPanels += 1
			EndIf
		EndIf
	Next
EndFunc

Func ColorChoose($n, $hex)
	GUICtrlSetState($ColorButtonsb[$prev], $GUI_HIDE)
	GUICtrlSetState($ColorButtonsb[$n], $GUI_SHOW)
	$prev = $n
	Return HexToRGB($hex) & ',' & $Opacity
EndFunc

Func WheelDown()
	Exit
EndFunc

Func ApplyColor($Panel, $NewColor)
	; List all ini files in panel's directory
	$filelist = _FileListToArray($SkinPath & "\" & $Panel, "*.ini", 1)
	; Write 'ColorSkin' variable to each file
	For $i = 1 To UBound($filelist) - 1
		$filepath = $SkinPath & "\" & $Panel & "\" & $filelist[$i]
		If $NewColor = -1 Then
			IniDelete($filepath, "Variables", "ColorSkin")
		Else
			IniWrite($filepath, "Variables", "ColorSkin", $NewColor)
		EndIf
	Next

	; Refresh panel
	SendBang("!Refresh " & $Panel)
EndFunc