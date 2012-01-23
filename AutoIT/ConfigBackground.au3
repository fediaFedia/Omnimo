#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Background\Config.exe
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2011
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

$GUI = GUICreate("Configure background", 350, 350, -1, -1, BitOR($WS_SYSMENU, $WS_BORDER, $WS_CLIPSIBLINGS))
$Appearance = GUICtrlCreateGroup("Appearance", 8, 8, 329, 145)
$AeroGlassValue = IniRead("size.inc", "Variables", "EnableAero", "")
$Enable = GUICtrlCreateCheckbox("Enable Aero Glass", 16, 96, 113, 25)

If $AeroGlassValue = 1 Then
	GuiCtrlSetState(-1, $GUI_CHECKED)
EndIf

$RoundedEdgesValue = IniRead("size.inc", "Variables", "RoundedEdges", "")
$Checkbox2 = GUICtrlCreateCheckbox("This option does nothing", 170, 96, 145, 25)

If $RoundedEdgesValue = 1 Then
	GuiCtrlSetState(-1, $GUI_CHECKED)
EndIf

$showbordertopbottomValue = IniRead("size.inc", "Variables", "showbordertopbottom", "")
$Show = GUICtrlCreateCheckbox("Show top and bottom borders", 170, 120, 160, 25)

If $showbordertopbottomValue = 0 Then
	GuiCtrlSetState(-1, $GUI_CHECKED)
EndIf

$showborderleftrightValue = IniRead("size.inc", "Variables", "showborderleftright", "")
$Checkbox1 = GUICtrlCreateCheckbox("Show left and right borders", 16, 120, 153, 25)

If $showborderleftrightValue = 0 Then
	GuiCtrlSetState(-1, $GUI_CHECKED)
EndIf

; Beautifully generated GUI
$Width = GUICtrlCreateLabel("Width", 16, 35, 32, 17)
$WidthValue = IniRead("size.inc", "Variables", "Width", "")
$Slider1 = GUICtrlCreateSlider(56, 32, 240, 25, BitOR($GUI_SS_DEFAULT_SLIDER,$TBS_NOTICKS))
GUICtrlSetLimit(-1, @DesktopWidth, 50)
GuiCtrlSetData(-1, $WidthValue)
$wi = GUICtrlCreateLabel("0", 300, 33, 32, 17)
GUICtrlSetFont(-1, 10)
GUICtrlSetColor(-1, 0x606060)
$Height = GUICtrlCreateLabel("Height", 16, 67, 35, 17)
$HeightValue = IniRead("size.inc", "Variables", "Height", "")
$Slider2 = GUICtrlCreateSlider(56, 64, 240, 25, BitOR($GUI_SS_DEFAULT_SLIDER,$TBS_NOTICKS))
GUICtrlSetLimit(-1, @DesktopHeight, 50)
GuiCtrlSetData(-1, $HeightValue)
$hi = GUICtrlCreateLabel("0", 300, 65, 32, 17)
GUICtrlSetFont(-1, 10)
GUICtrlSetColor(-1, 0x606060)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Advanced = GUICtrlCreateGroup("Advanced Appearance", 8, 160, 329, 121)
$Color1Value = IniRead("size.inc", "Variables", "Color1", "")
$Color2Value = IniRead("size.inc", "Variables", "Color2", "")
$gradientangleValue = IniRead("size.inc", "Variables", "gradientangle", "")
$ColorBorderValue = IniRead("size.inc", "Variables", "ColorBorder", "")
$borderwidthValue = IniRead("size.inc", "Variables", "borderwidth", "")
$Color1 = GUICtrlCreateInput($Color1Value, 16, 200, 105, 21)
$Color2 = GUICtrlCreateInput($Color2Value, 128, 200, 105, 21)
$Input3 = GUICtrlCreateInput($gradientangleValue, 240, 200, 90, 21)
GuiCtrlCreateUpDown(-1)
$Border = GUICtrlCreateInput($borderwidthValue, 184, 246, 145, 21)
GuiCtrlCreateUpDown(-1)
$Input4 = GUICtrlCreateInput($ColorBorderValue, 16, 246, 161, 21)
$Label1 = GUICtrlCreateLabel("Color1", 16, 182, 34, 17)
$Label2 = GUICtrlCreateLabel("Color2", 128, 182, 34, 17)
$Label4 = GUICtrlCreateLabel("Border Color", 16, 228, 62, 17)
$Label5 = GUICtrlCreateLabel("Border Width", 184, 228, 66, 17)
$Label3 = GUICtrlCreateLabel("Gradient Angle", 240, 182, 74, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$InstructionsButton = GUICtrlCreateButton("Instructions", 8, 288, 80, 25)
$ApplyButton = GUICtrlCreateButton("Apply", 258, 288, 80, 25)
$OKButton = GUICtrlCreateButton("OK", 92, 288, 80, 25)
$cancelButton = GUICtrlCreateButton("Cancel", 175, 288, 80, 25)
GUISetState(@SW_SHOWNOACTIVATE)
$oldw = 0
$oldh = 0

While 1
	$tempw = GUICtrlRead($Slider1)
	$temph = GUICtrlRead($slider2)
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
		Case $GUI_EVENT_CLOSE
			Exit

		Case $CancelButton
			Exit

		Case $InstructionsButton
			ShellExecute("readme.txt")

		Case $ApplyButton
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
			ShellExecute("refresh.exe", "/!RainmeterRefresh WP7\Background")

		Case $OKButton
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
			ShellExecute("refresh.exe", "/!RainmeterRefresh WP7\Background")
			Exit

	EndSwitch
WEnd
