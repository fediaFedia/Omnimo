#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Common\Config\configText.exe
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2011#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>

$AppDataDir = EnvGet("APPDATA")
$SystemDrive = EnvGet("SYSTEMDRIVE")

If FileFindFirstFile($AppDataDir & "\Rainmeter\Rainmeter.ini") <> -1 Then
	$DataFolder = $AppDataDir & "\Rainmeter\"
ElseIf FileFindFirstFile($SystemDrive & "\Program Files\Rainmeter\Rainmeter.ini") <> -1 Then
	$DataFolder = $SystemDrive & "\Program Files\Rainmeter\"
ElseIf FileFindFirstFile("..\..\..\..\Rainmeter.ini") <> -1 Then
	$DataFolder = "..\..\..\..\"
Else
	MsgBox(4096, "Error", "Could not locate Rainmeter.ini")
	Exit
EndIf

$SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", "")
If $SkinPath = "" Then
	MsgBox(4096, "Invalid SkinPath", "Your SkinPath in Rainmeter.ini looks to be empty")
	Exit
EndIf

$font = "Segoe UI"
$XPosition = IniRead($DataFolder & "Rainmeter.ini", $CmdLine[1], "WindowX", "")
$YPosition = IniRead($DataFolder & "Rainmeter.ini", $CmdLine[1], "WindowY", "")
$Size = "150"

$Gui = GUICreate("Configure", 200, 310, $XPosition+5, $YPosition+5, BitOR($WS_VISIBLE,$WS_POPUP),$WS_EX_TOOLWINDOW)
GUISetBkColor(0xe1e1e1)
GUICtrlCreatePic("header.jpg", 150/30, 0, 150/3.75, $Size/30, Default)
$VariableList = GUICtrlCreateList("", 10, 15, 190, $Size/5*8.6, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$WS_HSCROLL,$WS_VSCROLL), 0)
GUICtrlSetBkColor(-1, 0xe1e1e1)
GUICtrlSetColor(-1, 0x323232)
GUICtrlSetFont(-1, $Size/15, 400, 0, $font)
$VariableInput = GUICtrlCreateInput("", 0, $Size*1.78, 200, $Size/7.5, -1, 0)
GUICtrlSetFont(-1, $Size/15, 00, 0, $font)
GUICtrlSetColor(-1, 0x000000)
GUICtrlSetBkColor(-1, 0xd2d2d2)
$Cancel = GUICtrlCreateLabel("Close", $Size/15, $Size*1.92, $Size/3, $Size/7.5)
GUICtrlSetColor(-1, 0x323232)
GUICtrlSetFont(-1, $Size/15, 600, 0, $font)
$Set = GUICtrlCreateLabel("Set", $Size*1.1,  $Size*1.92, $Size/3, $Size/7.5)
GUICtrlSetColor(-1, 0x323232)
GUICtrlSetFont(-1, $Size/15, 600, 0, $font)

GUISetState(@SW_SHOW)

Dim $VarName[100]
Dim $VarDescription[100]
Dim $iniFiles[100]
Dim $VarCount = 0
Dim $FilesCount = 0
Dim $EndIt = 0
Dim $Foundini = 0

$CfgFile = FileOpen($SkinPath & $CmdLine[1] & "\RainConfigure.cfg", 0)
If $CfgFile = -1 Then
	MsgBox(0, "Could not find RainConfigure.cfg", "The program was unable to find RainConfigure.cfg")
	Exit
EndIf
$VariableSection = FileReadLine ($CfgFile)

Do
	$VarCount = $VarCount + 1
	$VarName[$VarCount] = FileReadLine ($CfgFile)
	$VarDescription[$VarCount] = FileReadLine ($CfgFile)
	If $VarName[$VarCount] = "[Files]" Then $EndIt = 1
Until $EndIt = 1

$iniFiles[1] = $SkinPath & $CmdLine[1] & "\UserVariables.inc"
$FilesCount = $FilesCount + 1

While @error <> -1
	$FilesCount = $FilesCount + 1
	$iniFiles[$FilesCount] = FileReadLine($CfgFile)
WEnd

FileClose ($CfgFile)
$VarCount = $VarCount - 1
$FilesCount = $FilesCount - 1

For $ListCount = 1 to $VarCount
GUICtrlSetData($VariableList,$VarName[$ListCount] & "|")
Next

While 1

	$nMsg = GUIGetMsg()

	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			FileClose($CfgFile)
			Exit

		Case $Cancel
			Exit

		Case $VariableList
			$CurrentVarName = GUICtrlRead($VariableList)
			If StringInStr($CurrentVarName, "Password", 2) Then
				GUICtrlDelete($VariableInput)
				$VariableInput = GUICtrlCreateInput("", 0, $Size*1.78, 200, $Size/7.5, BitOR($ES_AUTOHSCROLL, $ES_PASSWORD), 0)
			Else
				GUICtrlDelete($VariableInput)
				$VariableInput = GUICtrlCreateInput("", 0, $Size*1.78, 200, $Size/7.5, -1, 0)
			EndIf
			GUICtrlSetFont(-1, $Size/15, 400, 0, $font)
			GUICtrlSetColor(-1, 0x000000)
			GUICtrlSetBkColor(-1, 0xd2d2d2)
			For $ListCount = 1 to $VarCount
				if $VarName[$ListCount] = $CurrentVarName Then
					$CurrentVarDescription = $VarDescription[$ListCount]
				EndIf
			Next
			ToolTip($CurrentVarDescription)
			For $ListCount = 1 to $FilesCount
				$Temp = IniRead($iniFiles[$ListCount], "Variables", $CurrentVarName,"")
				$ini2Edit = $iniFiles[$ListCount]
				GUICtrlSetData($VariableInput, $Temp)
				ExitLoop
			Next

		Case $Set
			For $ListCount = 1 to $FilesCount
				$Temp = IniRead($iniFiles[$ListCount], "Variables", $CurrentVarName,"")
				ShellExecute("refresh.exe", "/!RainmeterRefresh " & $CmdLine[1])
				IniWrite($iniFiles[$ListCount], "Variables", $CurrentVarName, GUICtrlRead($VariableInput))
			Next

EndSwitch
WEnd