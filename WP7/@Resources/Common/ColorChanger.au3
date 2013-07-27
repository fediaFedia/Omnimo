#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=iconcolor.ico
#AutoIt3Wrapper_Outfile=ColorChanger.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made with love for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made with love for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.2
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>

#include "Includes\ColorChooser.au3"
#include "Includes\Common.au3"
#include "Includes\MouseOnEvent.au3"

Const $SettingsPath = $CmdLine[1]
Const $SkinPath = IniRead($SettingsPath & 'Rainmeter.ini', 'Rainmeter', 'SkinPath', @UserProfileDir & '\Documents\Rainmeter\Skins\')
Const $Opacity = IniRead($SkinPath & '\WP7\@Resources\Common\Color\color.inc', 'Variables', 'Opacity', '255')
Global $Color = IniRead($SkinPath & '\WP7\@Resources\Common\Color\color.inc', 'Variables', 'ColorSkin', '27,161,226,' & $Opacity) & ',' & $Opacity
Global $Custom = $Color
Const $font = "Segoe UI"
Const $Variables = $SkinPath & "WP7\@Resources\Common\Variables\"


$BgColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor", "0xe1e1e1")
$BgColor2 = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor2", "0xd2d2d2")
$TextColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigTextColor", "0x323232")
$GuiOptions = BitOR($WS_VISIBLE, $WS_SYSMENU, $WS_BORDER)
$opts = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL)

; Create GUI
$Form1 = GUICreate("Change panel color", 379, 288, 356, 317, $GuiOptions)
GUISetBkColor($BgColor)
_MouseSetOnEvent($MOUSE_WHEELUP_EVENT , "_WheelDown", "", "", $Form1, -1)
$List1 = GUICtrlCreateList("", 8, 32, 177, 214, $opts, 0)
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetColor(-1, $TextColor)
$Button1 = GUICtrlCreateButton("Default color", 198, 216, 78, 25)
$Button2 = GUICtrlCreateButton("Apply color", 278, 216, 78, 25)
$Button3 = GUICtrlCreateLabel("[Refresh active panels]", 8, 10, 120, 17)
GUICtrlSetColor(-1, $TextColor)

GUISetState(@SW_SHOW)

$width = 33
$heigth = 33

; Color buttons
$c1 = GUICtrlCreateGraphic(200, 32, $width, $heigth)
$c1b = GUICtrlCreateGraphic(199, 31, $width+2, $heigth+2)
$c2 = GUICtrlCreateGraphic(200, 72, $width, $heigth)
$c2b = GUICtrlCreateGraphic(199, 71, $width+2, $heigth+2)
$c3 = GUICtrlCreateGraphic(200, 112, $width, $heigth)
$c3b = GUICtrlCreateGraphic(199, 111, $width+2, $heigth+2)
$c4 = GUICtrlCreateGraphic(200, 152, $width, $heigth)
$c4b = GUICtrlCreateGraphic(199, 151, $width+2, $heigth+2)
$c5 = GUICtrlCreateGraphic(240, 32, $width, $heigth)
$c5b = GUICtrlCreateGraphic(239, 31, $width+2, $heigth+2)
$c6 = GUICtrlCreateGraphic(240, 72, $width, $heigth)
$c6b = GUICtrlCreateGraphic(239, 71, $width+2, $heigth+2)
$c7 = GUICtrlCreateGraphic(240, 112, $width, $heigth)
$c7b = GUICtrlCreateGraphic(239, 111, $width+2, $heigth+2)
$c8 = GUICtrlCreateGraphic(240, 152, $width, $heigth)
$c8b = GUICtrlCreateGraphic(239, 151, $width+2, $heigth+2)
$c9 = GUICtrlCreateGraphic(280, 32, $width, $heigth)
$c9b = GUICtrlCreateGraphic(279, 31, $width+2, $heigth+2)
$c10 = GUICtrlCreateGraphic(280, 72, $width, $heigth)
$c10b = GUICtrlCreateGraphic(279, 71, $width+2, $heigth+2)
$c11 = GUICtrlCreateGraphic(280, 112, $width, $heigth)
$c11b = GUICtrlCreateGraphic(279, 111, $width+2, $heigth+2)
$c12 = GUICtrlCreateGraphic(280, 152, $width, $heigth)
$c12b = GUICtrlCreateGraphic(279, 151, $width+2, $heigth+2)
$c13 = GUICtrlCreateGraphic(320, 32, $width, $heigth)
$c13b = GUICtrlCreateGraphic(319, 31, $width+2, $heigth+2)
$c14 = GUICtrlCreateGraphic(320, 72, $width, $heigth)
$c14b = GUICtrlCreateGraphic(319, 71, $width+2, $heigth+2)
$c15 = GUICtrlCreateGraphic(320, 112, $width, $heigth)
$c15b = GUICtrlCreateGraphic(319, 111, $width+2, $heigth+2)
$c16 = GUICtrlCreateGraphic(320, 152, $width, $heigth)
$c16b = GUICtrlCreateGraphic(319, 151, $width+2, $heigth+2)
$plus = GUICtrlCreatePic("plus.bmp", 320, 152, 33, 33)

Global $elems[19] = [$c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $c10, $c11, $c12, $c13, $c14, $c15, $c16, $plus, $Button1, $Button2]
Global $elemsb[16] = [$c1b, $c2b, $c3b, $c4b, $c5b, $c6b, $c7b, $c8b, $c9b, $c10b, $c11b, $c12b, $c13b, $c14b, $c15b, $c16b]

; Read colors into an array
Global $colors[17]
_FileReadToArray('colors.txt', $colors)
If @error Then _OmnimoError("Individual Panel Color", "Unable to read colors from colors.txt.")

; Read blacklist into an array
Global $blacklist[100]
_FileReadToArray('blacklist.txt', $blacklist)
If @error Then _OmnimoError("Individual Panel Color", "Unable to read blacklist from blacklist.txt.")

; Colorize buttons and add borders
For $i = 0 To 15 Step 1
	GUICtrlSetBkColor($elems[$i], $colors[$i+1])
	GUICtrlSetGraphic($elemsb[$i], $GUI_GR_COLOR, 0x000000)
	GUICtrlSetGraphic($elemsb[$i], $GUI_GR_PENSIZE, 1)
	GUICtrlSetGraphic($elemsb[$i], $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
	GUICtrlSetState($elemsb[$i], $GUI_HIDE)
	GUICtrlSetState($elems[$i], $GUI_HIDE)
Next

For $i = 16 To 18 Step 1
	GUICtrlSetState($elems[$i], $GUI_HIDE)
Next

If $CmdLine[0] < 1 Then _OmnimoError("Individual Panel Color", "Too few command line arguments specified.")




$file = FileOpen($SettingsPath & '\Rainmeter.ini', 0)
If $file = -1 Then _OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")

; Read active skins from Rainmeter.ini
While 1
    $line = FileReadLine($file)
    If @error = -1 Then ExitLoop
	; Only want panels here
	If StringInStr($line, '[WP7\Panels') OR StringInStr($line, '[WP7\InstalledPanels') OR StringInStr($line, '[WP7\DonatorPanels') Then
		If FileReadLine($file) <> 'Active=0' Then
			$mark = False
			For $j = 1 To $blacklist[0]
				If StringInStr(StringRegExpReplace($line, "[\[\]]", ""), $blacklist[$j]) Then
					$mark = True ; Panel was on blacklist!
				EndIf
			Next
			If Not $mark Then
				GUICtrlSetData($List1, StringReplace(StringRegExpReplace($line, "[\[\]]", ""), "WP7\", ""))
			EndIf
		EndIf
	EndIf
Wend

FileClose($file)

While 1
	$nMsg = GUIGetMsg()

	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $List1
			_HideOthers('')
			For $i = 0 To 18 Step 1
				GUICtrlSetState($elems[$i], $GUI_SHOW)
			Next
		Case $c1
			$Color = _ColorChoose($c1b, 0)
		Case $c2
			$Color = _ColorChoose($c2b, 1)
		Case $c3
			$Color = _ColorChoose($c3b, 2)
		Case $c4
			$Color = _ColorChoose($c4b, 3)
		Case $c5
			$Color = _ColorChoose($c5b, 4)
		Case $c6
			$Color = _ColorChoose($c6b, 5)
		Case $c7
			$Color = _ColorChoose($c7b, 6)
		Case $c8
			$Color = _ColorChoose($c8b, 7)
		Case $c9
			$Color = _ColorChoose($c9b, 8)
		Case $c10
			$Color = _ColorChoose($c10b, 9)
		Case $c11
			$Color = _ColorChoose($c11b, 10)
		Case $c12
			$Color = _ColorChoose($c12b, 11)
		Case $c13
			$Color = _ColorChoose($c13b, 12)
		Case $c14
			$Color = _ColorChoose($c14b, 13)
		Case $c15
			$Color = _ColorChoose($c15b, 14)
		Case $c16
			$Data = _ColorChooserDialog(_RGBToHex($Custom), $Form1)
			GUICtrlSetBkColor($c16, $Data)
			GUICtrlSetState($c16b, $GUI_SHOW)
			_HideOthers($c16b)
			$Color = _HexToRGB($Data)
			$Custom = $Color
		Case $Button2
			; List all ini files in panel's directory
			$filelist = _FileListToArray($SkinPath & 'WP7\' & GUICtrlRead($List1), '*.ini', 1)
			; Write 'ColorSkin' variable to each file
			For $i = 1 To UBound($filelist)-1
				IniWrite($SkinPath & 'WP7\' & GUICtrlRead($list1) & '\' & $filelist[$i], "Variables", "ColorSkin", $Color)
			Next
			; Refresh panel
			SendBang("!Refresh WP7\" & GUICtrlRead($list1))
		Case $Button1
			; List all ini files in panel's directory
			$filelist = _FileListToArray($SkinPath & 'WP7\' & GUICtrlRead($List1), '*.ini', 1)
			; Delete 'ColorSkin' variable from each file
			For $i = 1 To UBound($filelist)-1
				IniDelete($SkinPath & 'WP7\' & GUICtrlRead($list1) & '\' & $filelist[$i], "Variables", "ColorSkin")
			Next
			; Refresh panel
			SendBang("!Refresh WP7\" & GUICtrlRead($list1))

		Case $Button3


$file = FileOpen($SettingsPath & '\Rainmeter.ini', 0)
If $file = -1 Then _OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")

; Read active skins from Rainmeter.ini again
While 1
    $line = FileReadLine($file)
    If @error = -1 Then ExitLoop
	If StringInStr($line, '[WP7\Panels') OR StringInStr($line, '[WP7\InstalledPanels') OR StringInStr($line, '[WP7\DonatorPanels') Then
		If FileReadLine($file) <> 'Active=0' Then
			$mark = False
			For $j = 1 To $blacklist[0]
				If StringInStr(StringRegExpReplace($line, "[\[\]]", ""), $blacklist[$j]) Then
					$mark = True ; Panel was on blacklist!
				EndIf
			Next
			If Not $mark Then
				GUICtrlSetData($List1, StringReplace(StringRegExpReplace($line, "[\[\]]", ""), "WP7\", ""))
			EndIf
		EndIf
	EndIf
Wend

FileClose($file)

	EndSwitch
WEnd

; Select the element and return matching color
Func _ColorChoose($el, $n)
	GUICtrlSetState($el, $GUI_SHOW)
	_HideOthers($el)
	Return _HexToRGB($colors[$n+1])
EndFunc

; Convert Hex to RGB
Func _HexToRGB($Color)
	$Blue = BitAND($Color, 0xFF)
	$Green = BitAND(BitShift($Color, 8), 0xFF)
	$Red = BitAND(BitShift($Color, 16), 0xFF)
	Return $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
EndFunc

; Convert RGB to Hex
Func _RGBToHex($Color)
	$split = StringSplit($Color, ',')
	Return '0x' & Hex($split[1], 2) & Hex($split[2], 2) & Hex($split[3], 2)
EndFunc

; Hide borders
Func _HideOthers($el)
	For $i = 0 To 15 Step 1
		If $elemsb[$i] <> $el Then
			GUICtrlSetState($elemsb[$i], $GUI_HIDE)
		EndIf
	Next
EndFunc

Func _WheelDown()
	Exit
EndFunc