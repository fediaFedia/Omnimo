#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Common\Config\config.exe
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Config Tool
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2012
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
#include <StaticConstants.au3>

#include "Common.au3"

; Check arguments
If $CmdLine[0] < 3 Then _OmnimoError("Omnimo Panel Config", "Too few command line arguments specified.")

; Set up variables
Const $font = "Segoe UI"
Const $Config = $CmdLine[2]
Const $DataFolder = $CmdLine[3]

Const $SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & "\Documents\Rainmeter\Skins\")
Const $Variables = $SkinPath & "WP7\Common\Variables\"
Const $XPosition = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowX", "0")
Const $YPosition = IniRead($DataFolder & "Rainmeter.ini", $Config, "WindowY", "0")

$Size = IniRead($SkinPath & $Config & "\size.inc", "Variables", "Height", "150")
$BgColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor", "0xe1e1e1")
$BgColor2 = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigBackgroundColor2", "0xd2d2d2")
$TextColor = IniRead($Variables & "UserVariables.inc", "Variables", "ConfigTextColor", "0x323232")
$CloseString = IniRead($Variables & "Languages\lang.inc", "Variables", "CloseString", "Close")
$SetString = IniRead($Variables & "Languages\lang.inc", "Variables", "SetString", "Set")

; Store variables and their descriptions into arrays
Global $VarName[50]
Global $VarDescription[50]
Global $VarCount = 0
Global $ChangeInput = 0
Global $VariableInput
Global $CurrentVarName
Global $Comments = ""
Global $CommentLimit = 5

; Open configuration file for reading
$CfgFile = FileOpen($SkinPath & $CmdLine[2] & "\RainConfigure.cfg", 0)
If $CfgFile = -1 Then _OmnimoError("Unable to open RainConfigure.cfg", "The configuration tool was unable to open RainConfigure.cfg")

FileReadLine($CfgFile) ; skip over section name

; Read variables and their descriptions into arrays
While 1
	$name = FileReadLine($CfgFile)
	If StringLeft($name, 1) = "#" Then
		$Comments &= (StringTrimLeft($name, 1) & @CRLF)
	ElseIf $name = "" Then
		$Comments &= @CRLF
	Else
		$VarCount = $VarCount + 1
		$VarName[$VarCount] = $name
		$VarDescription[$VarCount] = FileReadLine($CfgFile)
	EndIf
	If $name = "[Files]" Then ExitLoop
WEnd
FileClose($CfgFile)

$VarFile = $SkinPath & $CmdLine[2] & "\UserVariables.inc"
$VarCount -= 1

$GuiOptions = BitOR($WS_VISIBLE, $WS_BORDER, $WS_POPUP)

; Set up GUI measurements
Switch $CmdLine[1]
	Case "double"
		$width = $Size * 2 + 10
		$height = $Size
		$listH = $Size * 0.64
		$setX = $Size * 1.53
		$buttonsY = $Size / 1.15
		$inputY = $Size / 1.35 - 1

	Case "doubleV"
		$width = $Size
		$height = $Size * 2 + 10
		$listH = $Size * 1.7
		$setX = $Size / 2.1
		$buttonsY = $Size * 1.92
		$inputY = $Size * 1.78
		$CommentLimit = 13

	Case "text"
		$Size = 150
		$width = 200
		$height = 310
		$listH = 250
		$setX = 120
		$buttonsY = 288
		$inputY = 267
		$CommentLimit = 13
		$GuiOptions = Default

	Case Else
		$width = $Size
		$height = $Size
		$listH = $Size * 0.64
		$setX = $Size / 2.1
		$buttonsY = $Size / 1.15
		$inputY = $Size / 1.35 - 1
EndSwitch

; Create GUI
$Gui = GUICreate("Configure", $width, $height, $XPosition + 5, $YPosition + 5, $GuiOptions, $WS_EX_TOOLWINDOW)
GUISetBkColor($BgColor)
GUICtrlCreatePic("header.jpg", $Size / 30, 0, $Size / 3.75, $Size / 30, Default)

; Create an edit control for comments if needed
If $VarCount < $CommentLimit Then
	$opts = 0
	$prevlistH = $listH
	$listH = $listH * ($VarCount / ($CommentLimit + 1)) + $Size / 10
	GUICtrlCreateEdit($Comments, 9, $listH, $width - 18, $prevlistH - $listH + $Size / 15, $ES_MULTILINE + $ES_AUTOVSCROLL, 0)
	GUICtrlSetBkColor(-1, $BgColor)
	GUICtrlSetColor(-1, $TextColor)
	GUICtrlSetFont(-1, $Size / 15, 400, 0, $font)
	GUICtrlSetState(-1, $GUI_DISABLE)
	If $CmdLine[1] = "text" Then $listH -= 15
Else
	$opts = BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $WS_HSCROLL, $WS_VSCROLL)
EndIf

$VariableList = GUICtrlCreateList("", 10, 15, $width - 20, $listH, $opts, 0)
GUICtrlSetBkColor(-1, $BgColor)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetFont(-1, $Size / 15, 400, 0, $font)
_CreateVariableInput(-1)
$Close = GUICtrlCreateLabel($CloseString, ($Size / 15 - 5), $buttonsY, $Size / 2.2, $Size / 7.5)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetFont(-1, $Size / 15, 600, 0, $font)
$Set = GUICtrlCreateLabel($SetString, $setX, $buttonsY, ($Size / 2), $Size / 7.5, $SS_RIGHT)
GUICtrlSetColor(-1, $TextColor)
GUICtrlSetFont(-1, $Size / 15, 600, 0, $font)

GUISetState()

For $ListCount = 1 To $VarCount
	GUICtrlSetData($VariableList, $VarName[$ListCount] & "|")
Next

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE, $Close
			Exit

		Case $VariableList
			$CurrentVarName = GUICtrlRead($VariableList)

			; Set input field to block variables with 'password' in them
			If StringInStr($CurrentVarName, "Password", 2) Then
				_CreateVariableInput(BitOR($ES_AUTOHSCROLL, $ES_PASSWORD))
				$ChangeInput = 1 ; recreate input field next time
			ElseIf $ChangeInput = 1 Then
				_CreateVariableInput(-1)
				$ChangeInput = 0
			EndIf

			For $ListCount = 1 To $VarCount
				If $VarName[$ListCount] = $CurrentVarName Then
					$CurrentVarDescription = $VarDescription[$ListCount]
				EndIf
			Next

			; Show variable description as tooltip
			ToolTip($CurrentVarDescription)

			GUICtrlSetData($VariableInput, IniRead($VarFile, "Variables", $CurrentVarName, ""))

		Case $Set
			; Write variable to file
			GUICtrlSetColor($Set, 0x7A7A7A)
			If $CurrentVarName <> "" Then
				IniWrite($VarFile, "Variables", $CurrentVarName, GUICtrlRead($VariableInput))
				SendBang("!RainmeterRefresh " & $CmdLine[2]) ; refresh config
			EndIf
			Sleep(100)
			GUICtrlSetColor($Set, $TextColor)

	EndSwitch
WEnd

Func _CreateVariableInput($opts)
	GUICtrlDelete($VariableInput)
	$VariableInput = GUICtrlCreateInput("", 0, $inputY, $width, $Size / 7.5, $opts, 0)
	GUICtrlSetFont(-1, $Size / 15, 400, 0, $font)
	GUICtrlSetColor(-1, $TextColor)
	GUICtrlSetBkColor(-1, $BgColor2)
EndFunc