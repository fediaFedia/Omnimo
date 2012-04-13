#NoTrayIcon
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Background\Config.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2012
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <WindowsConstants.au3>

#include "Includes\Common.au3"

; Create GUI
$GUI = GUICreate("Configure background", 350, 350, -1, -1, BitOR($WS_SYSMENU, $WS_BORDER, $WS_CLIPSIBLINGS))
$Appearance = GUICtrlCreateGroup("Appearance", 8, 8, 329, 145)

$AeroGlassValue = IniRead("size.inc", "Variables", "EnableAero", "0")
$Enable = GUICtrlCreateCheckbox("Enable Aero Glass", 16, 96, 113, 25)

If $AeroGlassValue = 1 Then
	GUICtrlSetState(-1, $GUI_CHECKED)
EndIf

$RoundedEdgesValue = IniRead("size.inc", "Variables", "RoundedEdges", "")
$Checkbox2 = GUICtrlCreateCheckbox("This option does nothing", 170, 96, 145, 25)

If $RoundedEdgesValue = 1 Then
	GUICtrlSetState(-1, $GUI_CHECKED)
EndIf

$showbordertopbottomValue = IniRead("size.inc", "Variables", "showbordertopbottom", "")
$Show = GUICtrlCreateCheckbox("Show top and bottom borders", 170, 120, 160, 25)

If $showbordertopbottomValue = 0 Then
	GUICtrlSetState(-1, $GUI_CHECKED)
EndIf

$showborderleftrightValue = IniRead("size.inc", "Variables", "showborderleftright", "")
$Checkbox1 = GUICtrlCreateCheckbox("Show left and right borders", 16, 120, 153, 25)

If $showborderleftrightValue = 0 Then
	GUICtrlSetState(-1, $GUI_CHECKED)
EndIf

; Background width slider and label
$Width = GUICtrlCreateLabel("Width", 16, 35, 32, 17)
$WidthValue = IniRead("size.inc", "Variables", "Width", @DesktopWidth)
$Slider1 = GUICtrlCreateSlider(56, 32, 240, 25, BitOR($GUI_SS_DEFAULT_SLIDER, $TBS_NOTICKS))
GUICtrlSetLimit(-1, @DesktopWidth, 50) ; slider ranger
GUICtrlSetData(-1, $WidthValue) ; slider position
$wi = GUICtrlCreateLabel("0", 300, 33, 32, 17)
GUICtrlSetFont(-1, 10)
GUICtrlSetColor(-1, 0x606060)

; Background height slider and label
$Height = GUICtrlCreateLabel("Height", 16, 67, 35, 17)
$HeightValue = IniRead("size.inc", "Variables", "Height", @DesktopHeight)
$Slider2 = GUICtrlCreateSlider(56, 64, 240, 25, BitOR($GUI_SS_DEFAULT_SLIDER, $TBS_NOTICKS))
GUICtrlSetLimit(-1, @DesktopHeight, 50) ; slider range
GUICtrlSetData(-1, $HeightValue) ; slider position
$hi = GUICtrlCreateLabel("0", 300, 65, 32, 17)
GUICtrlSetFont(-1, 10)
GUICtrlSetColor(-1, 0x606060)

GUICtrlCreateGroup("", -99, -99, 1, 1) ; close control group

$Color1Value = IniRead("size.inc", "Variables", "Color1", "")
$Color2Value = IniRead("size.inc", "Variables", "Color2", "")
$gradientangleValue = IniRead("size.inc", "Variables", "gradientangle", "")
$ColorBorderValue = IniRead("size.inc", "Variables", "ColorBorder", "")
$borderwidthValue = IniRead("size.inc", "Variables", "borderwidth", "")

; Appearance controls
$Advanced = GUICtrlCreateGroup("Advanced Appearance", 8, 160, 329, 121)
$Color1 = GUICtrlCreateInput($Color1Value, 16, 200, 105, 21)
$Color2 = GUICtrlCreateInput($Color2Value, 128, 200, 105, 21)
$Input3 = GUICtrlCreateInput($gradientangleValue, 240, 200, 90, 21)
$Border = GUICtrlCreateInput($borderwidthValue, 184, 246, 145, 21)
$Input4 = GUICtrlCreateInput($ColorBorderValue, 16, 246, 161, 21)

GUICtrlCreateUpdown($Input3)
GUICtrlCreateUpdown($Border)

; Labels
$Label1 = GUICtrlCreateLabel("Color1", 16, 182, 34, 17)
$Label2 = GUICtrlCreateLabel("Color2", 128, 182, 34, 17)
$Label4 = GUICtrlCreateLabel("Border Color", 16, 228, 62, 17)
$Label5 = GUICtrlCreateLabel("Border Width", 184, 228, 66, 17)
$Label3 = GUICtrlCreateLabel("Gradient Angle", 240, 182, 74, 17)

GUICtrlCreateGroup("", -99, -99, 1, 1) ; close control group

; Buttons
$InstructionsButton = GUICtrlCreateButton("Instructions", 8, 288, 80, 25)
$ApplyButton = GUICtrlCreateButton("Apply", 258, 288, 80, 25)
$OKButton = GUICtrlCreateButton("OK", 92, 288, 80, 25)
$cancelButton = GUICtrlCreateButton("Cancel", 175, 288, 80, 25)

; variables to store previous slider positions in
$oldw = 0
$oldh = 0

GUISetState(@SW_SHOWNOACTIVATE)

While 1
	; update label values with slider values
	$tempw = GUICtrlRead($Slider1)
	$temph = GUICtrlRead($Slider2)

	If $tempw <> $oldw Then
		GUICtrlSetData($wi, $tempw)
		$oldw = $tempw
	EndIf

	If $temph <> $oldh Then
		GUICtrlSetData($hi, $temph)
		$oldh = $temph
	EndIf

	$nMsg = GUIGetMsg()

	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $cancelButton
			Exit

		Case $InstructionsButton
			ShellExecute("readme.txt")

		Case $ApplyButton
			_ApplySettings()

		Case $OKButton
			_ApplySettings()
			Exit

	EndSwitch
WEnd

Func _ApplySettings()
	IniWrite("size.inc", "Variables", "Width", GUICtrlRead($Slider1))
	IniWrite("size.inc", "Variables", "Height", GUICtrlRead($Slider2))

	If GUICtrlRead($Enable) = $GUI_CHECKED Then
		IniWrite("size.inc", "Variables", "EnableAero", "1")
	Else
		IniWrite("size.inc", "Variables", "EnableAero", "0")
	EndIf

	If GUICtrlRead($Checkbox2) = $GUI_CHECKED Then
		IniWrite("size.inc", "Variables", "RoundedEdges", "1")
	Else
		IniWrite("size.inc", "Variables", "RoundedEdges", "0")
	EndIf

	If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then
		IniWrite("size.inc", "Variables", "showborderleftright", "0")
	Else
		IniWrite("size.inc", "Variables", "showborderleftright", "1")
	EndIf

	If GUICtrlRead($Show) = $GUI_CHECKED Then
		IniWrite("size.inc", "Variables", "showbordertopbottom", "0")
	Else
		IniWrite("size.inc", "Variables", "showbordertopbottom", "1")
	EndIf

	IniWrite("size.inc", "Variables", "Color1", GUICtrlRead($Color1))
	IniWrite("size.inc", "Variables", "Color2", GUICtrlRead($Color2))
	IniWrite("size.inc", "Variables", "gradientangle", GUICtrlRead($Input3))
	IniWrite("size.inc", "Variables", "ColorBorder", GUICtrlRead($Input4))
	IniWrite("size.inc", "Variables", "borderwidth", GUICtrlRead($Border))

	SendBang("!Refresh WP7\Background") ; refresh background
EndFunc   ;==>_ApplySettings