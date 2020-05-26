#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icons\ColorChooser.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\Config\config.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Config Tool
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 6 -w 7 -w 8

#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <SliderConstants.au3>
#include <GuiEdit.au3>
#include <GDIPlus.au3>
#include <Misc.au3>

#Include <GUIConstantsEx.au3>

#Include <WindowsConstants.au3>

; Check arguments

If $CmdLine[0] < 5 Then OmnimoError("Omnimo Panel Config", "Too few command line arguments specified.")







; Set up variables
Const $Font       = "Segoe UI"
Const $Config     = $CmdLine[2]
Const $File       = $CmdLine[3]
Const $DataFolder = $CmdLine[4]
Const $SkinPath   = $CmdLine[5]




Const $CurrentLanguage = IniRead($skinpath & "WP7\@Resources\Common\Background\Varrar.inc", "Variables", "Language", "English")
Const $LangFile = $skinpath & "WP7\@Resources\Common\Background\Language\" & $CurrentLanguage & ".cfg"

If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$Sections = IniReadSection($LangFile, "Variables")
For $i = 1 To $Sections[0][0]
	$Language.Add($Sections[$i][0], $Sections[$i][1])
 Next



Const $scaledpi = IniRead($skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc", "Variables", "ScaleDpi", "1")

Const $Variables  = $SkinPath & "WP7\@Resources\Common\Variables\"
Const $VarFile    = $SkinPath & "WP7\@Resources\Config" & StringTrimLeft($Config, 3) & "\UserVariables.inc"





If $CmdLine[1] = "bg" Then
;MsgBox($MB_ICONINFORMATION, "Info", "BG Options", 2)
 BGSettings()

Else



























Global $XPositionE = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowX", "0")
Global $YPositionE = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowY", "0")

Opt("WinTitleMatchMode", 4)
$Pos = WinGetPos("classname=Shell_TrayWnd")
$workareaheight = @DeskTopHeight - $Pos[3]


$stringE = $XPositionE
Global $a_rep[4][2] = [[3], ["#screenareawidth#", @DeskTopWidth], ["#screenareaheight#", @DeskTopHeight], ["#workareaheight#", $workareaheight]]
For $i = 1 To $a_rep[0][0]
    $stringE = StringRegExpReplace($stringE, "\Q" & $a_rep[$i][0] & "\E", $a_rep[$i][1])
 Next

 $stringD = $YPositionE
Global $a_rep[4][2] = [[3], ["#screenareawidth#", @DeskTopWidth], ["#screenareaheight#", @DeskTopHeight], ["#workareaheight#", $workareaheight]]
For $i = 1 To $a_rep[0][0]
    $stringD = StringRegExpReplace($stringD, "\Q" & $a_rep[$i][0] & "\E", $a_rep[$i][1])
 Next





Global $XPosition = execute($stringE)
Global $YPosition = execute($stringD)




Global $SizeL      = IniRead($SkinPath & $Config & "\" & $File, "Variables", "Height", "150")
Global $Size      = $SizeL * $scaledpi

Const $BgColor    = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor", "0xe1e1e1")
Const $BgColor2   = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor2", "0xd2d2d2")
Const $TextColor  = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigTextColor", "0x323232")

; Declare global variables
Global $VarName[50]
Global $VarDescription[50]
Global $VarType[50]
Global $VarSection[50]
Global $VarOpts[5]
Global $VarCount = 0
Global $CurrentVarName
Global $CurrentVarSection
Global $Comments = ""
Global $CreatedElement = -1
Global $ColorData
Global $BrowseData
Global $CurrentSection = ""
Global $ColorSkinReset
Global $ColorSkinSet


; Enumerated type to keep track of which element was created last
Global Enum $INPUT, $SLIDER, $CHECKBOX, $COLOR, $BROWSE

; Open configuration file for reading
$CfgFile = FileOpen($SkinPath & "WP7\@Resources\Config" & StringTrimLeft($Config, 3) & "\RainConfigure.cfg", 0)
If $CfgFile = -1 Then
	$Colorizable = 1
Else
	; Read variables and their descriptions into arrays
	While 1
		$name = FileReadLine($CfgFile)
		Switch StringLeft($name, 1)
			Case "["
				If $name == "[Options]" Then ExitLoop
				$CurrentSection = StringTrimLeft(StringTrimRight($name, 1), 1)
			Case "#"
				$Comments &= (StringTrimLeft($name, 1) & @CRLF)
			Case ""
				$Comments &= @CRLF
			Case Else
				$VarName[$VarCount] = $name
				$VarDescription[$VarCount] = FileReadLine($CfgFile)
				$VarType[$VarCount] = FileReadLine($CfgFile)
				$VarSection[$VarCount] = $CurrentSection
				$VarCount += 1
				$Empty = FileReadLine($CfgFile) ; Skip over empty line

				If $Empty == "[Options]" Then
					ExitLoop
				ElseIf $Empty <> "" Then
					OmnimoError("Unable to read RainConfigure.cfg", "An error occurred while reading RainConfigure.cfg")
				EndIf
		EndSwitch
		If @error = -1 Then OmnimoError("Unable to read RainConfigure.cfg", "An error occurred while reading RainConfigure.cfg")
	WEnd
	$Colorizable = Int(StringRight(FileReadLine($CfgFile), 1))
	FileClose($CfgFile)
EndIf

; Read config size from Config.cfg based on first command line argument
Global $SizeOptions[6]
$SizeOptions = StringSplit(IniRead("Config.cfg", "Variables", $CmdLine[1], "1:1:0:0:0"), ":")
Global $GuiOptions = _Iif($SizeOptions[5] == "1", Default, BitOR($WS_VISIBLE, $WS_BORDER, $WS_POPUP))
$W  = Int($SizeOptions[1])
$H  = Int($SizeOptions[2])
$PW = Int($SizeOptions[3])
$PH = Int($SizeOptions[4])
$width  = $Size * $W + $PW
$height = $Size * $H + $PH
$listH  = $height - $Size / 3
$CommentLimit = $height / 25

; Read label variables from Config.cfg
$ResetText = IniRead("Config.cfg", "Variables", "Reset", $Language.Item("Reset"))
$BrowseText = IniRead("Config.cfg", "Variables", "Browse", $Language.Item("Browse"))
$ColorText = IniRead("Config.cfg", "Variables", "Color", $Language.Item("Color"))

; Work around for Rainmeter not properly positioning full-screen skins
If $YPosition < 0 Then
	$XPosition = 50
	$YPosition = 50
 EndIf

   If $xposition > @DeskTopWidth - (150 * $scaledpi) Then
		$xposition = @DeskTopWidth/1.2

	 EndIf

   If $yposition > @DeskTopHeight -(150 * $scaledpi) Then
		$yposition = @DeskTopHeight/1.6

	 EndIf

   If $yposition < 50 Then
		$yposition = 50

	 EndIf
; Create GUI
$Gui = GUICreate("Configure", $width - 2, $height - 2, $XPosition + 5, $YPosition + 5, $GuiOptions, $WS_EX_TOOLWINDOW)
GUIRegisterMsg(0x0207, "_Exit")
GUISetBkColor($BgColor)
GUISetState()
  WinSetTrans($Gui, "", 220)
; An empty label to act as activation area for set button
$SetLabel = GUICtrlCreateLabel("", $width - $Size / 5.77, $height - $Size / 6.75, $Size / 6.5, $Size / 7.5)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

; Set up GDI resources
_GDIPlus_Startup()
$Set      = _GDIPlus_ImageLoadFromFile("set.png")
$bucket      = _GDIPlus_ImageLoadFromFile("bucket.png")

$hGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
$hBrush   = _GDIPlus_BrushCreateSolid("0xFF" & StringTrimLeft($BgColor2, 2))
$hBrush2  = _GDIPlus_BrushCreateSolid("0xFF" & StringTrimLeft($TextColor, 2))
$hFormat  = _GDIPlus_StringFormatCreate()
$hFamily  = _GDIPlus_FontFamilyCreate($Font)
$hFont    = _GDIPlus_FontCreate($hFamily, $Size / 16.7 / $scaledpi)
_DrawBottom()

; Create an edit control for comments if needed
$opts = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL)
If $Comments <> "" And $VarCount > 0 And $VarCount < $CommentLimit Then
	$opts = 0
	$listH = $listH * ($VarCount / ($CommentLimit + 1)) + $Size / 7 * $scaledpi
	GUICtrlCreateEdit($Comments, 9, $listH, $width - 18, $height - $Size / 7.25 - 18 - $listH + $Size / 25, $ES_MULTILINE + $ES_AUTOVSCROLL, 0)
	GUICtrlSetBkColor(-1, $BgColor)
	GUICtrlSetColor(-1, $TextColor)
	GUICtrlSetFont(-1, $Size / $scaledpi / 20, 400, 0, $Font)
	GUICtrlSetState(-1, $GUI_DISABLE)
EndIf

; Create the list of variables
$VariableList = GUICtrlCreateList("", 10, 15, $width - 20, $listH, $opts, 0)

GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetFont(-1, $Size / 15 / $scaledpi, 400, 0, $Font)

If $VarCount = 0 Then
	GUICtrlSetData($VariableList, $ColorText)
	GUICtrlSetState($VariableList, $GUI_DISABLE)
Else
	For $ListCount = 0 To $VarCount - 1
		GUICtrlSetData($VariableList, $VarName[$ListCount] & "|")
	Next
EndIf

$VariableInput = GUICtrlCreateInput("", 2, $height - $Size / 7.25 - 1, $width - 32, $Size / 7.25, BitOR($ES_AUTOHSCROLL, $ES_PASSWORD), 0)
GUICtrlSetFont(-1, $Size / 15 / $scaledpi, 400, 0, $Font)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetBkColor(-1, $BgColor2)
GUICtrlSetState(-1, $GUI_HIDE)
_GUICtrlEdit_SetPasswordChar($VariableInput, "0") ; "0" as password character means don't hide input

$VariableSlider = GUICtrlCreateSlider(0, $height - $Size / 6.25, $width - $Size / 5, $Size / 6.25, BITOR($TBS_NOTICKS, $TBS_TOOLTIPS))
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetBkColor(-1, $BgColor2)
$VariableCheckbox = GUICtrlCreateCheckbox("", $Size / 30, $height - $Size / 6.25 + 1, $Size / 6.8, $Size / 6.8)
GUICtrlSetBkColor(-1, $BgColor2)
GUICtrlSetState(-1, $GUI_HIDE)

$VariableColorbox = GUICtrlCreateGraphic(0,  $height - $Size / 6.25, $Size / 3, $Size / 6.25)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlSetCursor(-1, 0)

$BrowseLabel = GUICtrlCreateLabel("", $width / 2 - $Size / 4.15, $height - $Size / 6.25 + 3, $Size / 3, $Size / 6.25)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetCursor(-1, 0)
GUICtrlSetState(-1, $GUI_HIDE)

$ColorLabel = GUICtrlCreateLabel("", $Size / 2.75, $height - $Size / 6.25 + 3, $Size / 3.75, $Size / 6.25)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetCursor(-1, 0)
GUICtrlSetState(-1, $GUI_HIDE)

$CheckboxLabel = GUICtrlCreateLabel("", $Size / 7.5, $height - $Size / 6.25 + 3, $Size / 1.75, $Size / 6.25)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetState(-1, $GUI_HIDE)


$sliderE = GUICtrlCreateSlider(0, $height - $Size / 3.125, $width, $Size / 6.25, BITOR($TBS_NOTICKS, $TBS_TOOLTIPS))
GUICtrlSetLimit($sliderE, 300, 70)
GUICtrlSetData($sliderE, $Size)



GUICtrlSetBkColor(-1, $BgColor)
; Register drag/drop events


; Create colorbox if panel is marked as colorizable
If $Colorizable = 1 Then
	; Read current panel color
	$PanelColor = IniRead($SkinPath & $Config & "\" & $File, "Variables", "ColorSkin", "")
	If $PanelColor == "" Then $PanelColor = IniRead($SkinPath & "WP7\@Resources\Common\Color\color.inc", "Variables", "ColorSkin", "0,0,0")
	$ColorData = $PanelColor
	$Colorizable = 1
	_CreateColorBox($PanelColor)
Else
	_CreateVariableInput("")
EndIf

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			_Exit()

		Case $VariableList
			_WriteOption()

			$CurrentVarName = GUICtrlRead($VariableList)
			If $CurrentVarName <> "" Then
				; Find the new variable's data
				For $ListCount = 0 To $VarCount - 1
					If $VarName[$ListCount] = $CurrentVarName Then
						$CurrentVarDescription = $VarDescription[$ListCount]
						$CurrentVarType = $VarType[$ListCount]
						$CurrentVarSection = $VarSection[$ListCount]
						ExitLoop
					EndIf
				Next

				; Show variable description as tooltip
				ToolTip(_Iif(StringLen($CurrentVarDescription) > 1, $CurrentVarDescription, ""))

				; Hide previous GUI controls
				GUICtrlSetState($VariableInput, $GUI_HIDE)
				GUICtrlSetState($VariableSlider, $GUI_HIDE)
				GUICtrlSetState($VariableCheckbox, $GUI_HIDE)
				GUICtrlSetState($VariableColorbox, $GUI_HIDE)
				GUICtrlSetState($CheckboxLabel, $GUI_HIDE)
				GUICtrlSetState($ColorLabel, $GUI_HIDE)
					GUICtrlSetState($SliderE, $GUI_HIDE)
				GUICtrlSetState($BrowseLabel, $GUI_HIDE)

				$Colorizable = 0
				$VarOpts = StringSplit($CurrentVarType, ":")
				$CurrentValue = IniRead($VarFile, $CurrentVarSection, $CurrentVarName, "")

				; Create the GUI control
				Switch $VarOpts[1]
					Case "Text"
						_CreateVariableInput($CurrentValue)
					Case "Slider"
						_CreateVariableSlider($CurrentValue, Int($VarOpts[2]), Int($VarOpts[3]))
					Case "Checkbox"
						_CreateCheckBox($CurrentValue, $VarOpts[4])
					Case "Color"
						_CreateColorBox($CurrentValue)
					Case "Browse"
						_CreateBrowseButton($CurrentValue)
				EndSwitch
			 EndIf

		Case $sliderE

				IniWrite($SkinPath & $Config & "\" & $File, "Variables", "Height",  GUICtrlRead($sliderE))

		Case $VariableColorbox

		   $ColorSkinSet = True
			$Chose = _ChooseColor ( 2 )
			$ColorData = _Iif($Chose <> -1, $Chose, $ColorData)
			GUICtrlSetBkColor($VariableColorbox, $ColorData)

		Case $CheckboxLabel
			GUICtrlSetState($VariableCheckbox, _Iif(GUICtrlRead($VariableCheckbox) = 1, $GUI_UNCHECKED, $GUI_CHECKED))

		Case $ColorLabel
			If $Colorizable = 1 Then
				$value = IniRead($SkinPath & "WP7\@Resources\Common\Color\color.inc", "Variables", "ColorSkin", "0,0,0")
				$ColorSkinReset = True
			Else
				$value = $VarOpts[2]
			EndIf

			GUICtrlSetBkColor($VariableColorbox, _ToColor($value))
			$ColorData = $value

		Case $BrowseLabel
			Switch $VarOpts[2]
				Case "File"
					$BrowseData = FileOpenDialog("Select file", $SkinPath & $Config, "All (*.*)")
				Case "Image"
					$BrowseData = FileOpenDialog("Select image", $SkinPath & $Config, "All (*.png;*.jpeg;*.jpg;*.bmp)")
				Case "Folder"
					$BrowseData = FileSelectFolder("Select folder", "", 1 + 2 + 4, $SkinPath & $Config)
			EndSwitch

		Case $SetLabel
			_WriteOption()
			Sleep(100)


Run('"' & $CmdLine[6] & 'Rainmeter.exe" [!Refresh "' & $CmdLine[2] & '"]')

;Run('"C:\Program Files\Rainmeter\Rainmeter.exe" [!Refresh "' & $CmdLine[2] & '"]')


			_Exit()

	EndSwitch
 WEnd








EndIf

Func _WriteOption()
	If $Colorizable = 0 And $CurrentVarName == "" Then Return

	Switch $CreatedElement
		Case $INPUT
			$value = GUICtrlRead($VariableInput)
		Case $SLIDER
			$value = GUICtrlRead($VariableSlider)
		Case $CHECKBOX
			$value = _Iif(GUICtrlRead($VariableCheckbox) = 1, $VarOpts[3], $VarOpts[2])
		Case $COLOR
			If StringRegExp($ColorData, "^\d+$") Or StringLeft($ColorData, 2) == "0x" Then
				$value = HexToRGB($ColorData)
			Else
				$value = $ColorData
			EndIf
		Case $BROWSE
			$value = $BrowseData
	EndSwitch

	If $Colorizable = 1 Then
		If $ColorSkinReset = True Then
			IniDelete($SkinPath & $Config & "\" & $File, "Variables", "ColorSkin")
			IniDelete($SkinPath & $Config & "\" & $File, "Variables", "Height")
		IniWrite($SkinPath & $Config & "\" & $File, "Variables", "Height", "150")


		ElseIf $ColorSkinSet = True Then
			IniWrite($SkinPath & $Config & "\" & $File, "Variables", "ColorSkin", $value)
		Else

		EndIf
	Else
		IniWrite($VarFile, $CurrentVarSection, $CurrentVarName, $value)
	Endif
EndFunc

Func _CreateVariableInput($value)
	_DrawBottom()
	; Set input field to hide variables with 'password' in them
	_GUICtrlEdit_SetPasswordChar($VariableInput, _Iif(StringInStr($CurrentVarName, "Password", 2), "*", "0"))
	GUICtrlSetData($VariableInput, $value)
	GUICtrlSetState($VariableInput, $GUI_SHOW)
	$CreatedElement = $INPUT
EndFunc

Func _CreateVariableSlider($value, $min, $max)
	GUICtrlSetState($VariableSlider, $GUI_SHOW)
	GUICtrlSetLimit($VariableSlider, $max, $min)
	GUICtrlSetData($VariableSlider, $value)
	$CreatedElement = $SLIDER
EndFunc

Func _CreateCheckBox($value, $desc)
	GUICtrlSetState($CheckboxLabel, $GUI_SHOW)
	_DrawBottom()

	GUICtrlSetState($VariableCheckbox, $GUI_SHOW)
	GUICtrlSetState($VariableCheckbox, _Iif($value == $VarOpts[3], $GUI_CHECKED, $GUI_UNCHECKED))

	_DrawText($desc, $Size / 6.25)
	$CreatedElement = $CHECKBOX
EndFunc

Func _CreateColorBox($value)
	GUICtrlSetState($ColorLabel, $GUI_SHOW)
	_DrawBottom()

	GUICtrlSetBkColor($VariableColorbox, _ToColor($value))
	GUICtrlSetState($VariableColorbox, $GUI_SHOW)

	_DrawText($ResetText, $Size / 2.75)
	$ColorData = $value
	$CreatedElement = $COLOR
	$ColorSkinReset = False
	$ColorSkinSet = False



_GDIPlus_GraphicsDrawImageRect($hGraphic, $bucket, 10, $height - $Size / 6.75, $Size / 4.5, $Size / 7.5)

EndFunc

Func _CreateBrowseButton($value)
	GUICtrlSetState($BrowseLabel, $GUI_SHOW)

	_DrawBottom()
	_DrawText($BrowseText, $width / 2 - $Size / 4.15)

	$BrowseData = $value
	$CreatedElement = $BROWSE
EndFunc

Func _DrawBottom()
	_GDIPlus_GraphicsFillRect($hGraphic, 0, $height - $Size / 6.25, $width, $Size / 6.25, $hBrush)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $Set, $width - $Size / 5.77, $height - $Size / 6.75, $Size / 6.5, $Size / 7.5)


EndFunc

Func _DrawText($desc, $x)
	$tLayout = _GDIPlus_RectFCreate($x, $height - $Size / 6.25 + 3)
    $aInfo = _GDIPlus_GraphicsMeasureString($hGraphic, $desc, $hFont, $tLayout, $hFormat)
    _GDIPlus_GraphicsDrawStringEx($hGraphic, $desc, $hFont, $aInfo[0], $hFormat, $hBrush2)
EndFunc

Func _ToColor($str)
	If StringLeft($str, 2) == "0x" Then Return $str
	If StringRegExp($str, "\d+\,\s?\d+\,\s?\d+") Then Return RGBToHex($str)
	Return "0xFFFFFF"
EndFunc



Func _Exit()
   		Sleep(150)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_ImageDispose($Set)
	_GDIPlus_ShutDown()
	Exit
 EndFunc


; #FUNCTION# ====================================================================================================================
; Name...........: _Iif
; Description ...: Perform a boolean test within an expression.
; Syntax.........: _Iif($fTest, $vTrueVal, $vFalseVal)
; Parameters ....: $fTest     - Boolean test.
;                  $vTrueVal  - Value to return if $fTest is true.
;                  $vFalseVal - Value to return if $fTest is false.
; Return values .: True         - $vTrueVal
;                  False        - $vFalseVal
; Author ........: Dale (Klaatu) Thompson
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: Yes
; ===============================================================================================================================
Func _Iif($fTest, $vTrueVal, $vFalseVal)
	If $fTest Then
		Return $vTrueVal
	Else
		Return $vFalseVal
	EndIf
 EndFunc   ;==>_Iif






 Func BGSettings()
; Read GUI colors from Colors.inc
Const $ColorVariables = IniReadSection("..\PanelCreator\Resources\Colors.inc", "Variables")
Const $GuiBG = $ColorVariables[1][1]
Const $BrowseBG = $ColorVariables[3][1]
Const $CreateBG = $ColorVariables[4][1]
Const $FontColor = $ColorVariables[7][1]

Const $FooterBG = $ColorVariables[5][1]



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

$Gui = GUICreate($Language.Item("BackgroundSettings"), 340*$scaledpi, 438*$scaledpi, Default, Default, BitXOR($GUI_SS_DEFAULT_GUI, $WS_MINIMIZEBOX))
GUISetBkColor($GuiBG)
GUISetState()

_GDIPlus_Startup()
$hGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
Global $hImage

; Title
GUICtrlCreateLabel($Language.Item("BackgroundSettings"), 16*$scaledpi, 16*$scaledpi, 300*$scaledpi, 28*$scaledpi)
GUICtrlSetFont(-1, 12*$scaledpi, 400*$scaledpi, 0, "Segoe UI Light")
GUICtrlSetColor(-1, $fontcolor)



$Cancel = GUICtrlCreateButton($Language.Item("Cancel"), 160*$scaledpi, 403*$scaledpi, 81*$scaledpi, 25*$scaledpi)
$OK = GUICtrlCreateButton("OK", 72*$scaledpi, 403*$scaledpi, 81*$scaledpi, 25*$scaledpi)
$Apply = GUICtrlCreateButton($Language.Item("Apply"), 248*$scaledpi, 403*$scaledpi, 81*$scaledpi, 25*$scaledpi)

; Group labels
$Line1X = StringLen($Language.Item("Appearance")) * 5 + 35
$Line2X = StringLen($Language.Item("Borders")) * 5 + 35
$Line3X = StringLen($Language.Item("Advanced")) * 5 + 35

GUICtrlCreateLabel($Language.Item("Appearance"), 16*$scaledpi, 48*$scaledpi, 200*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlCreateGraphic($Line1X*$scaledpi, 55*$scaledpi, (315 - $Line1X)*$scaledpi, 1*$scaledpi)
GUICtrlSetColor(-1, $FooterBG)
GUICtrlCreateLabel($Language.Item("Borders"), 16*$scaledpi, 222*$scaledpi, 200*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlCreateGraphic($Line2X*$scaledpi, 230*$scaledpi, (315 - $Line2X)*$scaledpi, 1*$scaledpi)
GUICtrlSetColor(-1, $FooterBG)
GUICtrlCreateLabel($Language.Item("Advanced"), 16*$scaledpi, 294*$scaledpi, 200*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlCreateGraphic($Line3X*$scaledpi, 302*$scaledpi, (315 - $Line3X)*$scaledpi, 1*$scaledpi)
GUICtrlSetColor(-1, $FooterBG)

GUICtrlCreateLabel($Language.Item("Color"), 32*$scaledpi, 80*$scaledpi, 28*$scaledpi, 17)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlCreateLabel($Language.Item("Opacity"), 32*$scaledpi, 112*$scaledpi, 55*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlCreateLabel($Language.Item("Width"), 32*$scaledpi, 148*$scaledpi, 55*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlCreateLabel($Language.Item("Height"), 32*$scaledpi, 182*$scaledpi, 55*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)



If $Color1Value Then $Color1Value = RGBToHex($Color1Value)
If $Color2Value Then $Color2Value = RGBToHex($Color2Value)
If $Color3Value Then $Color3Value = RGBToHex($Color3Value)

$Color1 = GUICtrlCreateGraphic(100*$scaledpi, 78*$scaledpi, 30*$scaledpi, 21*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlSetBkColor(-1, $Color1Value)
$Color2 = GUICtrlCreateGraphic(129*$scaledpi, 78*$scaledpi, 30*$scaledpi, 21*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlSetBkColor(-1, $Color2Value)
$Color3 = GUICtrlCreateGraphic(168*$scaledpi, 252*$scaledpi, 30*$scaledpi, 21*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlSetBkColor(-1, $Color3Value)


$Opacity = GUICtrlCreateSlider(94*$scaledpi, 110*$scaledpi, 150*$scaledpi, 25*$scaledpi, $TBS_NOTICKS)
GUICtrlSetBkColor(-1, $GuiBG)
GUICtrlSetLimit(-1, "255")
GUICtrlSetData(-1, $OpacityValue)


$Width = GUICtrlCreateSlider(94*$scaledpi, 146*$scaledpi, 150*$scaledpi, 25*$scaledpi, $TBS_NOTICKS)
GUICtrlSetBkColor(-1, $GuiBG)
GUICtrlSetLimit(-1, @DesktopWidth)
GUICtrlSetData(-1, $WidthValue)
$Height = GUICtrlCreateSlider(94*$scaledpi, 181*$scaledpi, 150*$scaledpi, 25*$scaledpi, $TBS_NOTICKS)
GUICtrlSetBkColor(-1, $GuiBG)
GUICtrlSetLimit(-1, @DesktopHeight)
GUICtrlSetData(-1, $HeightValue)

$Image = GUICtrlCreateCheckbox("", 170*$scaledpi, 75*$scaledpi, 17*$scaledpi, 25*$scaledpi)

GUICtrlCreateLabel($Language.Item("UseImage"), 188*$scaledpi, 81*$scaledpi, 81*$scaledpi, 25*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)

$Browse = GUICtrlCreateButton($Language.Item("Browse"), 253*$scaledpi, 77*$scaledpi, 62*$scaledpi, 22*$scaledpi)

GUICtrlCreateLabel($Language.Item("Sides"), 32*$scaledpi, 254*$scaledpi, 30*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlCreateLabel($Language.Item("Width"), 214*$scaledpi, 254*$scaledpi, 45*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)
GUICtrlCreateLabel($Language.Item("GradientAngle"), 175*$scaledpi, 360*$scaledpi, 74*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)

$LeftRight = GUICtrlCreateCheckbox("", 88*$scaledpi, 254*$scaledpi, 17*$scaledpi, 17*$scaledpi)
$TopBottom = GUICtrlCreateCheckbox("", 120*$scaledpi, 254*$scaledpi, 17*$scaledpi, 17*$scaledpi)
$BorderWidth = GUICtrlCreateInput("0", 265*$scaledpi, 252*$scaledpi, 50*$scaledpi, 21*$scaledpi, $ES_NUMBER)
GUICtrlSetData(-1, $BorderWidthValue)
GUICtrlCreateUpdown($BorderWidth)
If $LeftRightBorderValue = "0" Then GUICtrlSetState($LeftRight, $GUI_CHECKED)
If $TopBottomBorderValue = "0" Then GUICtrlSetState($TopBottom, $GUI_CHECKED)

$AeroGlass = GUICtrlCreateCheckbox("", 32*$scaledpi, 328*$scaledpi, 17*$scaledpi, 17*$scaledpi)



GUICtrlCreateLabel($Language.Item("EnableAero"), 50*$scaledpi, 328*$scaledpi, 129*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)


$Gradient = GUICtrlCreateCheckbox("", 32*$scaledpi, 360*$scaledpi, 17*$scaledpi, 17*$scaledpi)

$GradientA = GUICtrlCreateLabel($Language.Item("Gradient"), 50*$scaledpi, 360*$scaledpi, 113*$scaledpi, 17*$scaledpi)
GUICtrlSetColor(-1, $fontcolor)

$GradientAngle = GUICtrlCreateInput("0", 255*$scaledpi, 358*$scaledpi, 60*$scaledpi, 21*$scaledpi, $ES_NUMBER)
GUICtrlSetData(-1, $GradientAngleValue)
GUICtrlCreateUpdown($GradientAngle)
If $AeroGlassValue = "1" Then GUICtrlSetState($AeroGlass, $GUI_CHECKED)

If $Color1Value <> $Color2Value Then GUICtrlSetState($Gradient, $GUI_CHECKED)


$OpacityInput = GUICtrlCreateInput("0", 253*$scaledpi, 110*$scaledpi, 62*$scaledpi, 21*$scaledpi, BitOR($ES_NUMBER, $ES_CENTER))
$WidthInput = GUICtrlCreateInput("0", 253*$scaledpi, 146*$scaledpi, 62*$scaledpi, 21*$scaledpi, BitOR($ES_NUMBER, $ES_CENTER))
$HeightInput = GUICtrlCreateInput("0", 253*$scaledpi, 182*$scaledpi, 62*$scaledpi, 21*$scaledpi, BitOR($ES_NUMBER, $ES_CENTER))



GUICtrlCreateGraphic(83*$scaledpi, 253*$scaledpi, 1*$scaledpi, 19*$scaledpi)
GUICtrlSetBkColor(-1, 0xB0B0B0)
GUICtrlCreateGraphic(105*$scaledpi, 253*$scaledpi, 1*$scaledpi, 19*$scaledpi)
GUICtrlSetBkColor(-1, 0xB0B0B0)

GUICtrlCreateGraphic(116*$scaledpi, 252*$scaledpi, 21*$scaledpi, 1*$scaledpi)
GUICtrlSetBkColor(-1, 0xB0B0B0)
GUICtrlCreateGraphic(116*$scaledpi, 272*$scaledpi, 21*$scaledpi, 1*$scaledpi)
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
	If _WinAPI_GetFocus() = ControlGetHandle($Gui, "", $OpacityInput) Then
		GUICtrlSetData($Opacity, GUICtrlRead($OpacityInput))
    Else
        GUICtrlSetData($OpacityInput, GUICtrlRead($Opacity))
    EndIf
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $Cancel
			Exit

		Case $Apply




				IniWrite($VarFile, "Variables", "Width", GUICtrlRead($Width))
	IniWrite($VarFile, "Variables", "Height",	GUICtrlRead($Height))
	IniWrite($VarFile, "Variables", "EnableAero", _Iif(GUICtrlRead($AeroGlass) = $GUI_CHECKED, "1", "0"))
	IniWrite($VarFile, "Variables", "UseWin10Blur", _Iif(GUICtrlRead($AeroGlass) = $GUI_CHECKED, "Blur", ""))
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



		Case $OK



				IniWrite($VarFile, "Variables", "Width", GUICtrlRead($Width))
	IniWrite($VarFile, "Variables", "Height",	GUICtrlRead($Height))
	IniWrite($VarFile, "Variables", "EnableAero", _Iif(GUICtrlRead($AeroGlass) = $GUI_CHECKED, "1", "0"))
	IniWrite($VarFile, "Variables", "UseWin10Blur", _Iif(GUICtrlRead($AeroGlass) = $GUI_CHECKED, "Blur", ""))
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




			Exit

		Case $Color1
			$Chose = _ChooseColor ( 2 )
			GUICtrlSetBkColor($Color1, $Chose)
			$Color1Value = $Chose
			If GUICtrlRead($Gradient) = $GUI_UNCHECKED Then GUICtrlSetBkColor($Color2, $Color1Value)

		Case $Color2
			$Chose = _ChooseColor ( 2 )
			GUICtrlSetBkColor($Color2, $Chose)
			$Color2Value = $Chose

		Case $Color3



			$Chose = _ChooseColor ( 2 )
			GUICtrlSetBkColor($Color3, $SelectColor)
			$Color3Value = $SelectColor

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

EndFunc


Func HexToRGB($Color)
	$Blue = BitAND($Color, 0xFF)
	$Green = BitAND(BitShift($Color, 8), 0xFF)
	$Red = BitAND(BitShift($Color, 16), 0xFF)
	Return $Red & ',' & $Green & ',' & $Blue
EndFunc

Func RGBToHex($Color)
	$split = StringSplit($Color, ',')
	Return '0x' & Hex($split[1], 2) & Hex($split[2], 2) & Hex($split[3], 2)
 EndFunc

Func SendBang($szBang)

Run('"' & $CmdLine[4] & 'Rainmeter.exe" [' & $szBang & ']')

EndFunc