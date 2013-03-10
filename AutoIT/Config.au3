#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\Config\config.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Config Tool
#AutoIt3Wrapper_Res_Fileversion=6.0
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
Const $VarFile    = $SkinPath & $Config & "\UserVariables.inc"
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
Global $VarOpts[5]
Global $VarCount = 0
Global $VariableInput
Global $VariableSlider
Global $VariableCheckbox
Global $VariableColorbox
Global $VariableLabel
Global $CreatedElement
Global $CurrentVarName
Global $CurrentVarDescription
Global $CurrentVarType
Global $Comments = ""
Global $CommentLimit = 5
Global $ColorData
Global $BrowseData
Global $Colorizable
Global $ColorSkin

; Enumerated type to keep track of which element was created last
Global Enum $INPUT, $SLIDER, $CHECKBOX, $COLOR, $BROWSE

; Open configuration file for reading
$CfgFile = FileOpen($SkinPath & $CmdLine[2] & "\RainConfigure.cfg", 0)
If $CfgFile = -1 Then OmnimoError("Unable to open RainConfigure.cfg", "The configuration tool was unable to open RainConfigure.cfg.")

FileReadLine($CfgFile) ; skip over section name

; Read variables and their descriptions into arrays
While 1
	$name = FileReadLine($CfgFile)
	If $name == "[Options]" Then ExitLoop
	If StringLeft($name, 1) == "#" Then
		$Comments &= (StringTrimLeft($name, 1) & @CRLF)
	ElseIf $name == "" Then
		$Comments &= @CRLF
	Else
		$VarName[$VarCount] = $name
		$VarDescription[$VarCount] = FileReadLine($CfgFile)
		$VarType[$VarCount] = FileReadLine($CfgFile)
		$VarCount += 1
		FileReadLine($CfgFile) ; Skip over empty line
	EndIf
	If @error = -1 Then OmnimoError("Unable to read RainConfigure.cfg", "An error occurred while reading RainConfigure.cfg")
WEnd
$Colorizable = Int(StringRight(FileReadLine($CfgFile), 1))
FileClose($CfgFile)

Global $SizeOptions[6]
$SizeOptions = StringSplit(IniRead("Config.cfg", "Variables", $CmdLine[1], "1:1:0:0:0"), ":")
Global $GuiOptions = _Iif($SizeOptions[5] == "1", Default, BitOR($WS_VISIBLE, $WS_BORDER, $WS_POPUP))
$W  = Int($SizeOptions[1])
$H  = Int($SizeOptions[2])
$PW = Int($SizeOptions[3])
$PH = Int($SizeOptions[4])
$width = $Size * $W + $PW
$height = $Size * $H + $PH
$listH = $height - $Size / 7.25 - 18
$CommentLimit = $height / 25

; Create GUI
$Gui = GUICreate("Configure", $width, $height, $XPosition + 5, $YPosition + 5, $GuiOptions, $WS_EX_TOOLWINDOW)
GUISetBkColor($BgColor)
GUISetState()

DragDropEvent_Startup()
DragDropEvent_Register($Gui)

GUIRegisterMsg($WM_DRAGENTER, "OnDragDrop")
GUIRegisterMsg($WM_DRAGOVER, "OnDragDrop")
GUIRegisterMsg($WM_DRAGLEAVE, "OnDragDrop")
GUIRegisterMsg($WM_DROP, "OnDragDrop")

$SetLabel = GUICtrlCreateLabel("", $width - $Size / 5.77, $height - $Size / 6.75, $Size / 6.5, $Size / 7.5)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

_GDIPlus_Startup()
$Set = _GDIPlus_ImageLoadFromFile("set.png")
$hGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
$hBrush = _GDIPlus_BrushCreateSolid("0xFF" & StringTrimLeft($BgColor2, 2))
$hBrush2 = _GDIPlus_BrushCreateSolid("0xFF" & StringTrimLeft($TextColor, 2))
$hFormat = _GDIPlus_StringFormatCreate()
$hFamily = _GDIPlus_FontFamilyCreate($Font)
$hFont = _GDIPlus_FontCreate($hFamily, $Size / 16.7)
_DrawBottom()

; Create an edit control for comments if needed
If $Comments <> "" And $VarCount < $CommentLimit Then
	$opts = 0
	$prevlistH = $listH
	$listH = $listH * ($VarCount / ($CommentLimit + 1)) + $Size / 10
	GUICtrlCreateEdit($Comments, 9, $listH, $width - 18, $prevlistH - $listH + $Size / 15, $ES_MULTILINE + $ES_AUTOVSCROLL, 0)
	GUICtrlSetBkColor(-1, $BgColor)
	GUICtrlSetColor(-1, $TextColor)
	GUICtrlSetFont(-1, $Size / 15, 400, 0, $Font)
	GUICtrlSetState(-1, $GUI_DISABLE)
	If $CmdLine[1] == "text" Then $listH -= 15
Else
	$opts = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL)
EndIf

$VariableList = GUICtrlCreateList("", 10, 15, $width - 20, $listH, $opts, 0)
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetFont(-1, $Size / 15, 400, 0, $Font)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)

If $Colorizable = 1 Then
	Global $PanelColor = IniRead($SkinPath & $Config & "\" & $File, "Variables", "ColorSkin", "")
	If $PanelColor == "" Then $PanelColor = IniRead($SkinPath & "WP7\@Resources\Common\Color\color.inc", "Variables", "ColorSkin", "0,0,0")
	$ColorData = $PanelColor
	$ColorSkin = 1
	_CreateColorBox($PanelColor)
Else
	_CreateVariableInput("")
EndIf

_MouseSetOnEvent($MOUSE_WHEELUP_EVENT , "_Exit", "", "", $Gui, -1)

For $ListCount = 0 To $VarCount - 1
	GUICtrlSetData($VariableList, $VarName[$ListCount] & "|")
Next

While 1
	$nMsg = GUIGetMsg()
	Switch $nMSg

		Case 0

		Case $GUI_EVENT_CLOSE
			_Exit()

		Case $VariableList
			_WriteOption()
			$CurrentVarName = GUICtrlRead($VariableList)
			If $CurrentVarName == "" Then ContinueCase

			For $ListCount = 0 To $VarCount - 1
				If $VarName[$ListCount] = $CurrentVarName Then
					$CurrentVarDescription = $VarDescription[$ListCount]
					$CurrentVarType = $VarType[$ListCount]
					ExitLoop
				EndIf
			Next

			; Show variable description as tooltip
			ToolTip(_Iif(StringLen($CurrentVarDescription) > 1, $CurrentVarDescription, ""))

			GUICtrlDelete($VariableInput)
			GUICtrlDelete($VariableSlider)
			GUICtrlDelete($VariableCheckbox)
			GUICtrlDelete($VariableColorbox)
			GUICtrlDelete($VariableLabel)

			$ColorSkin = 0
			$VarOpts = StringSplit($CurrentVarType, ":")
			$CurrentValue = IniRead($VarFile, "Variables", $CurrentVarName, "")

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
			If $CreatedElement <> $COLOR Then ContinueCase
			$Chose = _ColorChooserDialog($ColorData, $Gui)
			$ColorData = _Iif($Chose <> -1, $Chose, $ColorData)
			GUICtrlSetBkColor($VariableColorbox, $ColorData)

		Case $VariableLabel
			Switch $CreatedElement
				Case $CHECKBOX
					GUICtrlSetState($VariableCheckbox, _Iif(GUICtrlRead($VariableCheckbox) = 1, $GUI_UNCHECKED, $GUI_CHECKED))

				Case $COLOR
					If $ColorSkin = 1 Then
						$value = IniRead($SkinPath & "WP7\@Resources\Common\Color\color.inc", "Variables", "ColorSkin", "0,0,0")
					Else
						$value = $VarOpts[2]
					EndIf

					If StringLEft($value, 2) == "0x" Then
						$DefaultColor = $value
					Else
						$DefaultColor = RGBToHex($value)
					EndIf
					GUICtrlSetBkColor($VariableColorbox, $DefaultColor)
					$ColorData = $DefaultColor

				Case $BROWSE
					If $VarOpts[2] == "File" Then
						$BrowseData = FileOpenDialog("Select file", $SkinPath & $Config, "All (*.*)")
					ElseIf $VarOpts[2] == "Folder" Then
						$BrowseData = FileSelectFolder("Select folder", "", 1 + 2 + 4, $SkinPath & $Config)
					EndIf
			EndSwitch

		Case $SetLabel
			_WriteOption()
			SendBang("!Refresh " & $CmdLine[2]) ; refresh config
			Exit

	EndSwitch
WEnd

Func _WriteOption()
	If $ColorSkin = 0 And $CurrentVarName == "" Then Return

	Switch $CreatedElement
		Case $INPUT
			$value = GUICtrlRead($VariableInput)
		Case $SLIDER
			$value = GUICtrlRead($VariableSlider)
		Case $CHECKBOX
			$value = _Iif(GUICtrlRead($VariableCheckbox) = 1, $VarOpts[3], $VarOpts[2])
		Case $COLOR
			$value = HexToRGB($ColorData)
		Case $BROWSE
			$value = $BrowseData
		Case Else
			Return
	EndSwitch

	If $ColorSkin = 1 Then
		IniWrite($SkinPath & $Config & "\" & $File, "Variables", "ColorSkin", $value)
	Else
		IniWrite($VarFile, "Variables", $CurrentVarName, $value)
	Endif
EndFunc

Func _CreateVariableInput($value)
	; Set input field to hide variables with 'password' in them
	_DrawBottom()
	$opts = _Iif(StringInStr($CurrentVarName, "Password", 2), BitOR($ES_AUTOHSCROLL, $ES_PASSWORD), -1)
	$VariableInput = GUICtrlCreateInput($value, 2, $height - $Size / 7.25 - 1, $width - 32, $Size / 7.25, $opts, 0)
	GUICtrlSetFont(-1, $Size / 15, 400, 0, $Font)
	GUICtrlSetColor(-1, $TextColor)
	GUICtrlSetBkColor(-1, $BgColor2)
	$CreatedElement = $INPUT
EndFunc

Func _CreateVariableSlider($value, $min, $max)
	_DrawBottom()
	$VariableSlider = GUICtrlCreateSlider(0, $height - $Size / 6.25, $width - $Size / 5, $Size / 6.25, BITOR($TBS_NOTICKS, $TBS_TOOLTIPS))
	GUICtrlSetLimit(-1, $max, $min)
	GUICtrlSetData(-1, $value)
	$CreatedElement = $SLIDER
EndFunc

Func _CreateCheckBox($value, $desc)
	$VariableLabel = GUICtrlCreateLabel("", $Size / 7.5, $height - $Size / 6.25 + 3, $Size / 1.75, $Size / 6.25)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	_DrawBottom()

	$VariableCheckbox = GUICtrlCreateCheckbox("", $Size / 30, $height - $Size / 6.25 + 1, $Size / 6.8, $Size / 6.8)
    $tLayout = _GDIPlus_RectFCreate($Size / 6.25, $height - $Size / 6.25 + 3)
    $aInfo = _GDIPlus_GraphicsMeasureString($hGraphic, $desc, $hFont, $tLayout, $hFormat)
    _GDIPlus_GraphicsDrawStringEx($hGraphic, $desc, $hFont, $aInfo[0], $hFormat, $hBrush2)

	GUICtrlSetBkColor($VariableCheckbox, $BgColor2)
	If $value == $VarOpts[3] Then GUICtrlSetState($VariableCheckbox, $GUI_CHECKED)
	$CreatedElement = $CHECKBOX
EndFunc

Func _CreateColorBox($value)
	$VariableLabel = GUICtrlCreateLabel("", $Size / 2.75, $height - $Size / 6.25 + 3, $Size / 3.75, $Size / 6.25)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetCursor(-1, 0)
	_DrawBottom()

	$VariableColorbox = GUICtrlCreateGraphic(0,  $height - $Size / 6.25, $Size / 3, $Size / 6.25)
	If $value == "" Then $value = "0x000000"
	If StringLeft($value, 2) <> "0x" Then $value = RGBToHex($value)

	GUICtrlSetBkColor(-1, $value)
	GUICtrlSetCursor(-1, 0)
	$tLayout = _GDIPlus_RectFCreate($Size / 2.75, $height - $Size / 6.25 + 3)
    $aInfo = _GDIPlus_GraphicsMeasureString($hGraphic, "[RESET]", $hFont, $tLayout, $hFormat)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, "[RESET]", $hFont, $aInfo[0], $hFormat, $hBrush2)

	$ColorData = $value
	$CreatedElement = $COLOR
EndFunc

Func _CreateBrowseButton($value)
	$VariableLabel = GUICtrlCreateLabel("", $width / 2.75, $height - $Size / 6.25 + 3, $Size / 3, $Size / 6.25)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	GUICtrlSetCursor(-1, 0)
	_DrawBottom()
	$tLayout = _GDIPlus_RectFCreate($width / 2 - $Size / 4.15, $height - $Size / 6.25 + 3)
    $aInfo = _GDIPlus_GraphicsMeasureString($hGraphic, "[Browse]", $hFont, $tLayout, $hFormat)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, "[Browse]", $hFont, $aInfo[0], $hFormat, $hBrush2)

	$BrowseData = $value
	$CreatedElement = $BROWSE
EndFunc

Func _DrawBottom()
	_GDIPlus_GraphicsFillRect($hGraphic, 0, $height - $Size / 6.25, $width, $Size / 6.25, $hBrush)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $Set, $width - $Size / 5.77, $height - $Size / 6.75, $Size / 6.5, $Size / 7.5)
EndFunc

Func OnDragDrop($hWnd, $Msg, $wParam, $lParam)
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
			GUICtrlSetData($VariableInput, IniRead($VarFile, "Variables", $CurrentVarName, ""))

    EndSwitch
EndFunc

Func _Exit()
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_ImageDispose($Set)
	_GDIPlus_ShutDown()
	Exit
EndFunc