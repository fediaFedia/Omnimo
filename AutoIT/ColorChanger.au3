#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Common\ColorChanger.exe
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2011
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <ColorChooser.au3>
#include <File.au3>

#Region ### START Koda GUI section ### Form=

$Form1 = GUICreate("Change panel color", 369, 258, 336, 287)
$List1 = GUICtrlCreateList("", 8, 32, 177, 214)
$Label1 = GUICtrlCreateLabel("Active panels", 8, 8, 68, 17)
$Button1 = GUICtrlCreateButton("Reset color", 198, 216, 78, 25)
$Button2 = GUICtrlCreateButton("Apply color", 278, 216, 78, 25)

FileInstall("plus.jpg", @ScriptDir & '\plus.jpg')
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
$width = 33
$heigth = 33
$c1 = GUICtrlCreateGraphic(200, 32, $width, $heigth)
GUICtrlSetBkColor(-1, 0xff0097)
$c1b = GUICtrlCreateGraphic(199, 31, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c2 = GUICtrlCreateGraphic(200, 72, $width, $heigth)
GUICtrlSetBkColor(-1, 0x6e155f)
$c2b = GUICtrlCreateGraphic(199, 71, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c3 = GUICtrlCreateGraphic(200, 112, $width, $heigth)
GUICtrlSetBkColor(-1, 0x4eb3b9)
$c3b = GUICtrlCreateGraphic(199, 111, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c4 = GUICtrlCreateGraphic(200, 152, $width, $heigth)
GUICtrlSetBkColor(-1, 0x96b232)
$c4b = GUICtrlCreateGraphic(199, 151, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c5 = GUICtrlCreateGraphic(240, 32, $width, $heigth)
GUICtrlSetBkColor(-1, 0xA05000)
$c5b = GUICtrlCreateGraphic(239, 31, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c6 = GUICtrlCreateGraphic(240, 72, $width, $heigth)
GUICtrlSetBkColor(-1, 0xe671bb)
$c6b = GUICtrlCreateGraphic(239, 71, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c7 = GUICtrlCreateGraphic(240, 112, $width, $heigth)
GUICtrlSetBkColor(-1, 0xde9317)
$c7b = GUICtrlCreateGraphic(239, 111, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c8 = GUICtrlCreateGraphic(240, 152, $width, $heigth)
GUICtrlSetBkColor(-1, 0x1ba1e2)
$c8b = GUICtrlCreateGraphic(239, 151, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c9 = GUICtrlCreateGraphic(280, 32, $width, $heigth)
GUICtrlSetBkColor(-1, 0xe51400)
$c9b = GUICtrlCreateGraphic(279, 31, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c10 = GUICtrlCreateGraphic(280, 72, $width, $heigth)
GUICtrlSetBkColor(-1, 0x339933)
$c10b = GUICtrlCreateGraphic(279, 71, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c11 = GUICtrlCreateGraphic(280, 112, $width, $heigth)
GUICtrlSetBkColor(-1, 0x034888)
$c11b = GUICtrlCreateGraphic(279, 111, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c12 = GUICtrlCreateGraphic(280, 152, $width, $heigth)
GUICtrlSetBkColor(-1, 0x5859b9)
$c12b = GUICtrlCreateGraphic(279, 151, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c13 = GUICtrlCreateGraphic(320, 32, $width, $heigth)
GUICtrlSetBkColor(-1, 0xd54d34)
$c13b = GUICtrlCreateGraphic(319, 31, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c14 = GUICtrlCreateGraphic(320, 72, $width, $heigth)
GUICtrlSetBkColor(-1, 0xa200ff)
$c14b = GUICtrlCreateGraphic(319, 71, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$c15 = GUICtrlCreateGraphic(320, 112, $width, $heigth)
GUICtrlSetBkColor(-1, 0x260930)
$c15b = GUICtrlCreateGraphic(319, 111, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)
$plus = GUICtrlCreatePic("plus.jpg", 320, 152, 33, 33)
$c16 = GUICtrlCreateGraphic(320, 152, $width, $heigth)
GUICtrlSetBkColor(-1, 0x000000)
GUICtrlSetState(-1, $GUI_HIDE)
$c16b = GUICtrlCreateGraphic(319, 151, $width+2, $heigth+2)
GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x000000)
GUICtrlSetGraphic(-1, $GUI_GR_PENSIZE, 1)
GUICtrlSetGraphic(-1, $GUI_GR_RECT, 0, 0, $width+2, $heigth+2)
GUICtrlSetState(-1, $GUI_HIDE)

local $lista[19] = [$c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $c10, $c11, $c12, $c13, $c14, $c15, $c16, $plus, $Button1, $Button2]
global $lista2[16] = [$c1b, $c2b, $c3b, $c4b, $c5b, $c6b, $c7b, $c8b, $c9b, $c10b, $c11b, $c12b, $c13b, $c14b, $c15b, $c16b]
global $color = 0
local $blacklist[21] = ['WP7\Panels\FruitClock', 'WP7\Panels\Live', 'WP7\Panels\Steam', 'WP7\Panels\Adobe', 'WP7\Panels\Flickr', 'WP7\Panels\Moon', 'WP7\Panels\MediaCenter', 'WP7\Panels\Stocks', 'WP7\InstalledPanels\Kuler', 'WP7\InstalledPanels\SunClock', 'WP7\InstalledPanels\Reddit', 'WP7\InstalledPanels\Bing', 'WP7\InstalledPanels\PhotoEnhancer', 'WP7\InstalledPanels\MyLocation', 'WP7\InstalledPanels\CNN', 'WP7\InstalledPanels\PremiumNotes', 'WP7\DonatorPanels\LearnFromMyFail', 'WP7\InstalledPanels\SoundEnhancer', 'WP7\DonatorPanels\SportScores', 'WP7\DonatorPanels\SteamNew', 'WP7\DonatorPanels\GoldPrice']

For $i = 0 To 18 Step 1
	GUICtrlSetState($lista[$i], $GUI_HIDE)
Next

$SkinPath = $CmdLine[1]
$ProgramPath = $CmdLine[2]
$Opacity = "255"
$file = FileOpen($CmdLine[3] & '\Rainmeter.ini', 0)

While 1
    $line = FileReadLine($file)
    If @error = -1 Then
		ExitLoop
	ElseIf StringInStr($line, '[WP7\Panels') OR StringInStr($line, '[WP7\InstalledPanels') OR StringInStr($line, '[WP7\DonatorPanels') Then
		If FileReadLine($file) <> 'Active=0' Then
			$mark = False
			For $j = 0 To UBound($blacklist)-1
				If $blacklist[$j] == StringRegExpReplace($line, "[\[\]]", "") Then
					$mark = True
				EndIf
			Next
			If $mark == False Then
				GUICtrlSetData($List1, StringRegExpReplace($line, "[\[\]]", ""))
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
				GUICtrlSetState($lista[$i], $GUI_SHOW)
			Next
		Case $c1
			GUICtrlSetState($c1b, $GUI_SHOW)
			_HideOthers($c1b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0xff0097
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c2
			GUICtrlSetState($c2b, $GUI_SHOW)
			_HideOthers($c2b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x6e155f
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c3
			GUICtrlSetState($c3b, $GUI_SHOW)
			_HideOthers($c3b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x4eb3b9
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c4
			GUICtrlSetState($c4b, $GUI_SHOW)
			_HideOthers($c4b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x96b232
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c5
			GUICtrlSetState($c5b, $GUI_SHOW)
			_HideOthers($c5b)
			$nColor = 0xA05000
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c6
			GUICtrlSetState($c6b, $GUI_SHOW)
			_HideOthers($c6b)
			$nColor = 0xe671bb
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c7
			GUICtrlSetState($c7b, $GUI_SHOW)
			_HideOthers($c7b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0xde9317
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c8
			GUICtrlSetState($c8b, $GUI_SHOW)
			_HideOthers($c8b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x1ba1e2
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c9
			GUICtrlSetState($c9b, $GUI_SHOW)
			_HideOthers($c9b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0xe51400
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c10
			GUICtrlSetState($c10b, $GUI_SHOW)
			_HideOthers($c10b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x339933
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c11
			GUICtrlSetState($c11b, $GUI_SHOW)
			_HideOthers($c11b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x034888
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c12
			GUICtrlSetState($c12b, $GUI_SHOW)
			_HideOthers($c12b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x5859b9
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c13
			GUICtrlSetState($c13b, $GUI_SHOW)
			_HideOthers($c13b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0xd54d34
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c14
			GUICtrlSetState($c14b, $GUI_SHOW)
			_HideOthers($c14b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0xa200ff
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c15
			GUICtrlSetState($c15b, $GUI_SHOW)
			_HideOthers($c15b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = 0x260930
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $c16
			$Data = _ColorChooserDialog($Color, $Form1)
			GUICtrlSetBkColor($c16, $Data)
			GUICtrlSetState($c16b, $GUI_SHOW)
			_HideOthers($c16b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = $Data
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $plus
			_HideOthers('')
			$Data = _ColorChooserDialog($Color, $Form1)
			GUICtrlSetState($plus, $GUI_HIDE)
			GUICtrlSetBkColor($c16, $Data)
			GUICtrlSetState($c16, $GUI_SHOW)
			GUICtrlSetState($c16b, $GUI_SHOW)
			_HideOthers($c16b)
			$Opacity = IniRead($SkinPath & '\WP7\Common\Color\Color.inc', 'Variables', 'Opacity', '255')
			$nColor = $Data
			$Blue = BitAND($nColor, 0xFF)
			$Green = BitAND(BitShift($nColor, 8), 0xFF)
			$Red = BitAND(BitShift($nColor, 16), 0xFF)
			$Color = $Red & ',' & $Green & ',' & $Blue & ',' & $Opacity
		Case $Button2
			$filelist = _FileListToArray($SkinPath & GUICtrlRead($List1), '*.ini', 1)
			For $i = 1 To UBound($filelist)-1
				IniWrite($SkinPath & GUICtrlRead($list1) & '\' & $filelist[$i], "Variables", "ColorSkin", $Color)
			Next
			ShellExecute($ProgramPath & 'Rainmeter.exe', '!RainmeterRefresh ' & GUICtrlRead($list1))
		Case $Button1
			$filelist = _FileListToArray($SkinPath & GUICtrlRead($List1), '*.ini', 1)
			For $i = 1 To UBound($filelist)-1
				IniDelete($SkinPath & GUICtrlRead($list1) & '\' & $filelist[$i], "Variables", "ColorSkin")
			Next
			ShellExecute($ProgramPath & 'Rainmeter.exe', '!RainmeterRefresh ' & GUICtrlRead($list1))
	EndSwitch
WEnd

Func _HideOthers($el)
	For $i = 0 To 15 Step 1
		If $lista2[$i] <> $el Then
			GUICtrlSetState($lista2[$i], $GUI_HIDE)
		EndIf
	Next
EndFunc