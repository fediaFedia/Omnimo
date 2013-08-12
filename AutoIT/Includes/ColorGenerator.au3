#include-once

#include <File.au3>
#include <Math.au3>
#include <Misc.au3>

#include "ColorChooser.au3"
#include "Common.au3"

Func GenerateColorful(ByRef $colors)
	Const $numColors = $colors[0]
	Const $mix[3] = [Random(100, 200, 1), Random(100, 200, 1), Random(100, 200, 1)]

	For $i = 1 To $numColors
		$r = Int((Random(0, 255, 1) + $mix[0]) / 2)
		$g = Int((Random(0, 255, 1) + $mix[1]) / 2)
		$b = Int((Random(0, 255, 1) + $mix[2]) / 2)
		$colors[$i] = "0x" & Hex($r, 2) & Hex($g, 2) & Hex($b, 2)
	Next
EndFunc

Func GenerateContigious(ByRef $colors)
	Const $numColors = $colors[0]
	Const $offset = 30

	$r = Random(50, 200, 1)
	$g = Random(50, 200, 1)
	$b = Random(50, 200, 1)

	$colors[1] = "0x" & Hex($r, 2) & Hex($g, 2) & Hex($b, 2)
	For $i = 2 To $numColors
		$value = ($r + $g + $b) / 3
		$newValueS = $value + 2 * Random() * $offset
		$newValue = _Iif($newValueS <= $offset, $newValueS, $newValueS - $offset)
		$valueRatio = _Iif($value == 0, 0.9, $newValue / $value)
		$r = _Min(Int($r * $valueRatio), 200)
		$g = _Min(Int($g * $valueRatio), 200)
		$b = _Min(Int($b * $valueRatio), 200)
		$colors[$i] = "0x" & Hex($r, 2) & Hex($g, 2) & Hex($b, 2)
	Next
EndFunc

Func GenerateContrasting(ByRef $colors)
	Const $numColors = $colors[0]

	Local $HSL[3] = [Random(48, 216, 1), 0, 0]
	For $i = 1 To $numColors
		$HSL[1] = Random(0, 240, 1)
		$HSL[2] = Random(40, 200, 1)
		$RGB = _HSL2RGB($HSL)
		$colors[$i] = "0x" & Hex($RGB[0], 2) & Hex($RGB[1], 2) & Hex($RGB[2], 2)
	Next
EndFunc

Func ApplyColors(ByRef $colors)
	Local Const $numColors = $colors[0]
	Local Const $_VarFile = @AppDataDir & "\Rainmeter\Rainmeter.ini"
	Local Const $_SkinsPath = IniRead($_VarFile, "Rainmeter", "SkinPath", @UserProfileDir & "\Documents\Rainmeter\Skins\")
	Local $var = IniReadSectionNames($_VarFile)

	For $i = 1 To $var[0]
		If Not StringInStr($var[$i], "Panels") Then ContinueLoop
		$active = IniRead($_VarFile, $var[$i], "Active", "0")
		If $active == "0" Then ContinueLoop
		If IniRead($_SkinsPath & "\WP7\@Resources\Config\" & StringTrimLeft($var[$i], 4) & "\RainConfigure.cfg", "Options", "Colorizable", "1") = "0" Then ContinueLoop
		$FileList = _FileListToArray($_SkinsPath & $var[$i], "*.ini", 1)
		If @error Or Int($active) > $FileList[0] Then ContinueLoop
		IniWrite($_SkinsPath & $var[$i] & "\" & $FileList[Int($active)], "Variables", "ColorSkin", HexToRGB($colors[Random(1, $numColors - 1, 1)]))
	Next

	SendBang("!Refresh *")
EndFunc