#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\Background\Config.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=6.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <GDIPlus.au3>
#include <WinAPI.au3>

#include "Includes\Common.au3"
#include "Includes\ColorChooser.au3"

Const $VarFile = $CmdLine[1]

Const $CurrentLanguage = IniRead("Varrar.inc", "Variables", "Language", "English")
Const $LangFile = @ScriptDir & "\Language\" & $CurrentLanguage & ".cfg"

If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$Sections = IniReadSection($LangFile, "Variables")
For $i = 1 To $Sections[0][0]
	$Language.Add($Sections[$i][0], $Sections[$i][1])
Next

$Color1Value = IniRead($VarFile, "Variables", "Color1", "0,0,0")
$Color2Value = IniRead($VarFile, "Variables", "Color2", "0,0,0")
$Color3Value = IniRead($VarFile, "Variables", "ColorBorder", "0,0,0")
$GradientAngleValue = IniRead($VarFile, "Variables", "gradientangle", "0")
$ColorBorderValue = IniRead($VarFile, "Variables", "ColorBorder", "0,0,0")
$BorderWidthValue = IniRead($VarFile, "Variables", "borderwidth", "0")
$WidthValue = IniRead($VarFile, "Variables", "Width", @DesktopWidth)
$HeightValue = IniRead($VarFile, "Variables", "Height", @DesktopHeight)
$AeroGlassValue = IniRead($VarFile, "Variables", "EnableAero", "0")
$TopBottomBorderValue = IniRead($VarFile, "Variables", "showbordertopbottom", "0")
$LeftRightBorderValue = IniRead($VarFile, "Variables", "showborderleftright", "0")
$ImageValue = IniRead($VarFile, "Variables", "BackgroundImage", "")

$Color1Split = StringSplit($Color1Value, ",")
If $Color1Split[0] < 4 Then
	$OpacityValue = 255
Else
	$OpacityValue = $Color1Split[4]
EndIf

$Gui = GUICreate($Language.Item("BackgroundSettings"), 340, 438, Default, Default, BitXOR($GUI_SS_DEFAULT_GUI, $WS_MINIMIZEBOX))
GUISetBkColor(0xFFFFFF)
GUISetState()

_GDIPlus_Startup()
$hGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
Global $hImage

; Title
GUICtrlCreateLabel($Language.Item("BackgroundSettings"), 16, 16, 300, 28)
GUICtrlSetFont(-1, 13, 400, 0, "Segoe UI")
GUICtrlSetColor(-1, 0x376DD0)

; Footer
GUICtrlCreateGraphic(0, 393, 340, 45)
GUICtrlSetColor(-1, 0xF0F0F0)
GUICtrlSetBkColor(-1, 0xF0F0F0)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGraphic(0, 391, 340, 1)
GUICtrlSetColor(-1, 0x898C95)

$Cancel = GUICtrlCreateButton($Language.Item("Cancel"), 160, 403, 81, 25)
$OK = GUICtrlCreateButton("OK", 72, 403, 81, 25)
$Apply = GUICtrlCreateButton("Apply", 248, 403, 81, 25)

; Group labels
$Line1X = StringLen($Language.Item("Appearance")) * 5 + 35
$Line2X = StringLen($Language.Item("Borders")) * 5 + 35
$Line3X = StringLen($Language.Item("Advanced")) * 5 + 35

GUICtrlCreateLabel($Language.Item("Appearance"), 16, 48, 200, 17)
GUICtrlSetColor(-1, 0x636363)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlCreateGraphic($Line1X, 55, 315 - $Line1X, 1)
GUICtrlSetColor(-1, 0xD8D8D8)
GUICtrlCreateLabel($Language.Item("Borders"), 16, 222, 200, 17)
GUICtrlSetColor(-1, 0x636363)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlCreateGraphic($Line2X, 230, 315 - $Line2X, 1)
GUICtrlSetColor(-1, 0xD8D8D8)
GUICtrlCreateLabel($Language.Item("Advanced"), 16, 294, 200, 17)
GUICtrlSetColor(-1, 0x636363)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlCreateGraphic($Line3X, 302, 315 - $Line3X, 1)
GUICtrlSetColor(-1, 0xD8D8D8)

GUICtrlCreateLabel($Language.Item("Color"), 32, 80, 28, 17)
GUICtrlCreateLabel($Language.Item("Opacity"), 32, 112, 40, 17)
GUICtrlCreateLabel($Language.Item("Width"), 32, 148, 32, 17)
GUICtrlCreateLabel($Language.Item("Height"), 32, 182, 35, 17)

$Opacity = GUICtrlCreateInput("0", 80, 110, 49, 21, $ES_NUMBER)
GUICtrlSetData(-1, $OpacityValue)
GUICtrlCreateUpdown($Opacity)

If $Color1Value Then $Color1Value = RGBToHex($Color1Value)
If $Color2Value Then $Color2Value = RGBToHex($Color2Value)
If $Color3Value Then $Color3Value = RGBToHex($Color3Value)

$Color1 = GUICtrlCreateGraphic(80, 78, 40, 21)
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, $Color1Value)
$Color2 = GUICtrlCreateGraphic(119, 78, 40, 21)
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, $Color2Value)
$Color3 = GUICtrlCreateGraphic(148, 252, 40, 21)
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, $Color3Value)

$Width = GUICtrlCreateSlider(74, 146, 170, 25, $TBS_NOTICKS)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetLimit(-1, @DesktopWidth)
GUICtrlSetData(-1, $WidthValue)
$Height = GUICtrlCreateSlider(74, 181, 170, 25, $TBS_NOTICKS)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetLimit(-1, @DesktopHeight)
GUICtrlSetData(-1, $HeightValue)

$Image = GUICtrlCreateCheckbox($Language.Item("UseImage"), 170, 110, 81, 25)
$Browse = GUICtrlCreateButton($Language.Item("Browse"), 253, 112, 62, 22)

GUICtrlCreateLabel($Language.Item("Sides"), 32, 254, 30, 17)
GUICtrlCreateLabel($Language.Item("Width"), 214, 254, 32, 17)
GUICtrlCreateLabel($Language.Item("GradientAngle"), 175, 360, 74, 17)

$LeftRight = GUICtrlCreateCheckbox("", 88, 254, 17, 17)
$TopBottom = GUICtrlCreateCheckbox("", 120, 254, 17, 17)
$BorderWidth = GUICtrlCreateInput("0", 255, 252, 60, 21, $ES_NUMBER)
GUICtrlSetData(-1, $BorderWidthValue)
GUICtrlCreateUpdown($BorderWidth)
If $LeftRightBorderValue = "0" Then GUICtrlSetState($LeftRight, $GUI_CHECKED)
If $TopBottomBorderValue = "0" Then GUICtrlSetState($TopBottom, $GUI_CHECKED)

$AeroGlass = GUICtrlCreateCheckbox($Language.Item("EnableAero"), 32, 328, 129, 17)
$Gradient = GUICtrlCreateCheckbox($Language.Item("Gradient"), 32, 360, 113, 17)
$GradientAngle = GUICtrlCreateInput("0", 255, 358, 60, 21, $ES_NUMBER)
GUICtrlSetData(-1, $GradientAngleValue)
GUICtrlCreateUpdown($GradientAngle)
If $AeroGlassValue = "1" Then GUICtrlSetState($AeroGlass, $GUI_CHECKED)
If $Color1Value <> $Color2Value Then GUICtrlSetState($Gradient, $GUI_CHECKED)

$WidthInput = GUICtrlCreateInput("0", 253, 146, 62, 21, BitOR($ES_NUMBER, $ES_CENTER))
$HeightInput = GUICtrlCreateInput("0", 253, 182, 62, 21, BitOR($ES_NUMBER, $ES_CENTER))

GUICtrlCreatePic(@ScriptDir & "\info.jpg", 299, 329, 16, 16)
GUICtrlSetTip(-1, $Language.Item("AeroTooltip"), $Language.Item("AeroTooltipTitle"), 1, 1)

GUICtrlCreateGraphic(83, 253, 1, 19)
GUICtrlSetBkColor(-1, 0xB0B0B0)
GUICtrlCreateGraphic(105, 253, 1, 19)
GUICtrlSetBkColor(-1, 0xB0B0B0)

GUICtrlCreateGraphic(116, 252, 21, 1)
GUICtrlSetBkColor(-1, 0xB0B0B0)
GUICtrlCreateGraphic(116, 272, 21, 1)
GUICtrlSetBkColor(-1, 0xB0B0B0)


Global $ImageFile

If $ImageValue Then
	GUICtrlSetState($Image, $GUI_CHECKED)
	GUICtrlSetState($Color1, $GUI_DISABLE)
	If GUICtrlRead($Gradient) = $GUI_CHECKED Then GUICtrlSetState($Color2, $GUI_DISABLE)
	GUICtrlSetState($AeroGlass, $GUI_DISABLE)
	GUICtrlSetState($Gradient, $GUI_DISABLE)
	If GUICtrlRead($Gradient) = $GUI_CHECKED Then GUICtrlSetState($GradientAngle, $GUI_DISABLE)
Else
	GUICtrlSetState($Browse, $GUI_DISABLE)
EndIf

If $Color1Value = $Color2Value Then
	GUICtrlSetState($GradientAngle, $GUI_DISABLE)
	GUICtrlSetState($Color2, $GUI_DISABLE)
EndIf

If GUICtrlRead($Gradient) = $GUI_UNCHECKED Then GUICtrlSetBkColor($Color2, $Color1Value)

While 1
	Sleep(50)

	If _WinAPI_GetFocus() = ControlGetHandle($Gui, "", $WidthInput) Then
		GUICtrlSetData($Width, GUICtrlRead($WidthInput))
    Else
        GUICtrlSetData($WidthInput, GUICtrlRead($Width))
    EndIf

	If _WinAPI_GetFocus() = ControlGetHandle($Gui, "", $HeightInput) Then
		GUICtrlSetData($Height, GUICtrlRead($HeightInput))
    Else
        GUICtrlSetData($HeightInput, GUICtrlRead($Height))
    EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $Cancel
			Exit

		Case $Apply
			ApplySettings()

		Case $OK
			ApplySettings()
			Exit

		Case $Color1
			$Chose = _ColorChooserDialog($Color1Value, $Gui)
			GUICtrlSetBkColor($Color1, $Chose)
			$Color1Value = $Chose
			If GUICtrlRead($Gradient) = $GUI_UNCHECKED Then GUICtrlSetBkColor($Color2, $Color1Value)

		Case $Color2
			$Chose = _ColorChooserDialog($Color2Value, $Gui)
			GUICtrlSetBkColor($Color2, $Chose)
			$Color2Value = $Chose

		Case $Color3
			$Chose = _ColorChooserDialog($Color3Value, $Gui)
			GUICtrlSetBkColor($Color3, $Chose)
			$Color3Value = $Chose

		Case $Image
			$State = _Iif(GUICtrlRead($Image) = $GUI_CHECKED, $GUI_DISABLE, $GUI_ENABLE)
			GUICtrlSetState($Color1, $State)
			If GUICtrlRead($Gradient) = $GUI_CHECKED Then GUICtrlSetState($Color2, $State)
			GUICtrlSetState($AeroGlass, $State)
			GUICtrlSetState($Gradient, $State)
			If GUICtrlRead($Gradient) = $GUI_CHECKED Then GUICtrlSetState($GradientAngle, $State)
			GUICtrlSetState($Browse, _Iif($State == $GUI_ENABLE, $GUI_DISABLE, $GUI_ENABLE))

		Case $Gradient
			$State = _Iif(GUICtrlRead($Gradient) = $GUI_CHECKED, $GUI_ENABLE, $GUI_DISABLE)
			GUICtrlSetState($GradientAngle, $State)
			GUICtrlSetState($Color2, $State)
			If GUICtrlRead($Gradient) = $GUI_CHECKED Then
				GUICtrlSetBkColor($Color2, $Color2Value)
			Else
				GUICtrlSetBkColor($Color2, $Color1Value)
			EndIf

		Case $Browse
			$ImageFile = FileOpenDialog("Choose an image", @UserProfileDir & "\Pictures", "Images (*.png;*.jpg;*.jpeg;*.bmp)", 1)
			If @error Then ContinueCase
			_GDIPlus_ImageDispose($hImage)
			$hImage = _GDIPlus_ImageLoadFromFile($ImageFile)
			_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage, 254, 72, 60, 35)
	EndSwitch
WEnd

_GDIPlus_GraphicsDispose($hGraphic)
_GDIPlus_ImageDispose($hImage)
_GDIPlus_ShutDown()

Func ApplySettings()
	IniWrite($VarFile, "Variables", "Width", GUICtrlRead($Width))
	IniWrite($VarFile, "Variables", "Height",	GUICtrlRead($Height))
	IniWrite($VarFile, "Variables", "EnableAero", _Iif(GUICtrlRead($AeroGlass) = $GUI_CHECKED, "1", "0"))
	IniWrite($VarFile, "Variables", "showborderleftright", _Iif(GUICtrlRead($LeftRight) = $GUI_CHECKED, "0", "1"))
	IniWrite($VarFile, "Variables", "showbordertopbottom", _Iif(GUICtrlRead($TopBottom) = $GUI_CHECKED, "0", "1"))
	IniWrite($VarFile, "Variables", "Color1", HexToRGB($Color1Value) & "," & GUICtrlRead($Opacity))
	If GUICtrlRead($Gradient) = $GUI_CHECKED Then
		IniWrite($VarFile, "Variables", "Color2", HexToRGB($Color2Value) & "," & GUICtrlRead($Opacity))
	Else
		IniWrite($VarFile, "Variables", "Color2", HexToRGB($Color1Value) & "," & GUICtrlRead($Opacity))
	EndIf
	IniWrite($VarFile, "Variables", "gradientangle", GUICtrlRead($GradientAngle))
	IniWrite($VarFile, "Variables", "ColorBorder", HexToRGB($Color3Value))
	IniWrite($VarFile, "Variables", "borderwidth", GUICtrlRead($BorderWidth))
	If GUICtrlRead($Image) = $GUI_CHECKED Then
		IniWrite($VarFile, "Variables", "BackgroundImage", $ImageFile)
		IniWrite($VarFile, "Variables", "BackgroundImageHidden", "0")
	Else
		IniWrite($VarFile, "Variables", "BackgroundImageHidden", "1")
	EndIf
	SendBang("!Refresh WP7\Background") ; refresh background
EndFunc   ;==>_ApplySettings