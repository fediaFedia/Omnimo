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
#include <GDIPlus.au3>
#include <Misc.au3>

#include "Includes\Common.au3"
#include "Includes\MouseOnEvent.au3"
#include "Includes\DragDropEvent.au3"
#include "Includes\ColorChooser.au3"

; Check arguments
If $CmdLine[0] < 5 Then OmnimoError("Omnimo Panel Config", "Too few command line arguments specified.")

; Set up variables
Const $Font       = "Segoe UI"
Const $Config     = $CmdLine[2]
Const $File       = $CmdLine[3]
Const $DataFolder = $CmdLine[4]
Const $SkinPath   = $CmdLine[5]

Const $Variables  = $SkinPath & "WP7\@Resources\Common\Variables\"
Const $VarFile    = $SkinPath & "WP7\@Resources\Config" & StringTrimLeft($Config, 3) & "\UserVariables.inc"
Const $XPosition  = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowX", "0")
Const $YPosition  = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowY", "0")
Global $Size      = IniRead($SkinPath & $Config & "\" & $File, "Variables", "Height", "150")

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
$listH  = $height - $Size / 7.25 - 18
$CommentLimit = $height / 25

; Read label variables from Config.cfg
$ResetText = IniRead("Config.cfg", "Variables", "Reset", "[RESET]")
$BrowseText = IniRead("Config.cfg", "Variables", "Browse", "[Browse]")
$ColorText = IniRead("Config.cfg", "Variables", "Color", "Color")

; Create GUI
$Gui = GUICreate("Configure", $width - 2, $height - 2, $XPosition + 5, $YPosition + 5, $GuiOptions, $WS_EX_TOOLWINDOW)
GUISetBkColor($BgColor)
GUISetState()

; An empty label to act as activation area for set button
$SetLabel = GUICtrlCreateLabel("", $width - $Size / 5.77, $height - $Size / 6.75, $Size / 6.5, $Size / 7.5)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

; Set up GDI resources
_GDIPlus_Startup()
$Set      = _GDIPlus_ImageLoadFromFile("set.png")
$hGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
$hBrush   = _GDIPlus_BrushCreateSolid("0xFF" & StringTrimLeft($BgColor2, 2))
$hBrush2  = _GDIPlus_BrushCreateSolid("0xFF" & StringTrimLeft($TextColor, 2))
$hFormat  = _GDIPlus_StringFormatCreate()
$hFamily  = _GDIPlus_FontFamilyCreate($Font)
$hFont    = _GDIPlus_FontCreate($hFamily, $Size / 16.7)
_DrawBottom()

; Create an edit control for comments if needed
$opts = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL)
If $Comments <> "" And $VarCount > 0 And $VarCount < $CommentLimit Then
	$opts = 0
	$listH = $listH * ($VarCount / ($CommentLimit + 1)) + $Size / 10
	GUICtrlCreateEdit($Comments, 9, $listH, $width - 18, $height - $Size / 7.25 - 18 - $listH + $Size / 15, $ES_MULTILINE + $ES_AUTOVSCROLL, 0)
	GUICtrlSetBkColor(-1, $BgColor)
	GUICtrlSetColor(-1, $TextColor)
	GUICtrlSetFont(-1, $Size / 15, 400, 0, $Font)
	GUICtrlSetState(-1, $GUI_DISABLE)
EndIf

; Create the list of variables
$VariableList = GUICtrlCreateList("", 10, 15, $width - 20, $listH, $opts, 0)
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetFont(-1, $Size / 15, 400, 0, $Font)

If $VarCount = 0 Then
	GUICtrlSetData($VariableList, $ColorText)
	GUICtrlSetState($VariableList, $GUI_DISABLE)
Else
	For $ListCount = 0 To $VarCount - 1
		GUICtrlSetData($VariableList, $VarName[$ListCount] & "|")
	Next
EndIf

$VariableInput = GUICtrlCreateInput("", 2, $height - $Size / 7.25 - 1, $width - 32, $Size / 7.25, $ES_AUTOHSCROLL, 0)
GUICtrlSetFont(-1, $Size / 15, 400, 0, $Font)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetBkColor(-1, $BgColor2)
GUICtrlSetState(-1, $GUI_HIDE)

$VariableSlider = GUICtrlCreateSlider(0, $height - $Size / 6.25, $width - $Size / 5, $Size / 6.25, BITOR($TBS_NOTICKS, $TBS_TOOLTIPS))
GUICtrlSetState(-1, $GUI_HIDE)

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

; Register drag/drop events
DragDropEvent_Startup()
DragDropEvent_Register($Gui)

GUIRegisterMsg($WM_DRAGENTER, "OnDragDrop")
GUIRegisterMsg($WM_DRAGOVER, "OnDragDrop")
GUIRegisterMsg($WM_DRAGLEAVE, "OnDragDrop")
GUIRegisterMsg($WM_DROP, "OnDragDrop")

; Close on middle-click
_MouseSetOnEvent($MOUSE_WHEELUP_EVENT , "_Exit", "", "", $Gui, -1)

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
			If $CurrentVarName == "" Then ContinueCase

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

		Case $VariableColorbox
			$Chose = _ColorChooserDialog(_ToColor($ColorData), $Gui)
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
				Case "Folder"
					$BrowseData = FileSelectFolder("Select folder", "", 1 + 2 + 4, $SkinPath & $Config)
			EndSwitch

		Case $SetLabel
			_WriteOption()
			SendBang("!Refresh " & $CmdLine[2]) ; refresh config
			_Exit()

	EndSwitch
WEnd

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
		Else
			IniWrite($SkinPath & $Config & "\" & $File, "Variables", "ColorSkin", $value)
		EndIf
	Else
		IniWrite($VarFile, $CurrentVarSection, $CurrentVarName, $value)
	Endif
EndFunc

Func _CreateVariableInput($value)
	_DrawBottom()
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

Func OnDragDrop($hWnd, $Msg, $wParam, $lParam)
	#forceref $hWnd, $lParam
    Static $DropAccept

	If $CreatedElement <> $INPUT Then Return
    Switch $Msg
        Case $WM_DRAGENTER, $WM_DROP
            Select
                Case DragDropEvent_IsFile($wParam)
                    If $Msg = $WM_DROP Then
                        Local $FileList = DragDropEvent_GetFile($wParam)
						GUICtrlSetData($VariableInput, StringReplace($FileList, "|", @LF))
                    EndIf
                    $DropAccept = $DROPEFFECT_COPY

                Case DragDropEvent_IsText($wParam)
                    If $Msg = $WM_DROP Then
						GUICtrlSetData($VariableInput, DragDropEvent_GetText($wParam))
                    EndIf
                    $DropAccept = $DROPEFFECT_COPY

                Case Else
                    $DropAccept = $DROPEFFECT_NONE

            EndSelect
            Return $DropAccept

        Case $WM_DRAGOVER
            GUICtrlSetData($VariableInput, "Drop file here")
            Return $DropAccept

        Case $WM_DRAGLEAVE
			GUICtrlSetData($VariableInput, IniRead($VarFile, $CurrentVarSection, $CurrentVarName, ""))

    EndSwitch
EndFunc

Func _Exit()
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_ImageDispose($Set)
	_GDIPlus_ShutDown()
	Exit
EndFunc