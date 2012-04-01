#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=PanelCreator.ico
#AutoIt3Wrapper_outfile=..\WP7\Common\PanelCreator\PanelCreator.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Panel Creator
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2012
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 4 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
#include <SendMessage.au3>
#include <String.au3>
#include <File.au3>

#include "IconImage.au3"

$AppDataDir = EnvGet("APPDATA")
$SystemDrive = EnvGet("SYSTEMDRIVE")

; Locate Rainmeter.ini
If FileFindFirstFile($AppDataDir & "\Rainmeter\Rainmeter.ini") <> -1 Then
	$DataFolder = $AppDataDir & "\Rainmeter\"
ElseIf FileFindFirstFile($SystemDrive & "\Program Files\Rainmeter\Rainmeter.ini") <> -1 Then
	$DataFolder = $SystemDrive & "\Program Files\Rainmeter\"
ElseIf FileFindFirstFile("..\..\..\..\Rainmeter.ini") <> -1 Then
	$DataFolder = "..\..\..\..\"
Else
	MsgBox(16, "Error", "Could not locate Rainmeter.ini")
	Exit
EndIf

Const $SkinPath = IniRead($DataFolder & "Rainmeter.ini", "Rainmeter", "SkinPath", @UserProfileDir & '\Documents\Rainmeter\Skins\')
Const $ColorInc = $SkinPath & "WP7\Common\color\color.inc"
Const $PanelsInc = $SkinPath & "WP7\Gallery\MyPanels\panels.inc"

If $CmdLine[0] > 1 And $CmdLine[1] = "Delete" Then
	$path = IniRead($PanelsInc, "Variables", "Path" & $CmdLine[2], "Name")
	DirRemove($SkinPath & "WP7\Panels\" & $path, 1)
	IniDelete($PanelsInc, "Variables", "Name" & $CmdLine[2])
	IniDelete($PanelsInc, "Variables", "Path" & $CmdLine[2])
	IniDelete($PanelsInc, "Variables", "Icon" & $CmdLine[2])
	SendBang("!DeactivateConfig WP7\Panels\" & $path)
	SendBang("!Refresh WP7\Gallery\MyPanels")
	Exit
EndIf

; Load variables from color.inc
Const $yposition = IniRead($ColorInc, "Variables", "yposition", "1.2")
Const $fonttype = IniRead($ColorInc, "Variables", "FontType", "Segoe UI Semibold")
Const $fonttypewp = IniRead($ColorInc, "Variables", "FontTypeWP", "Segoe WP")
Const $fontfaceui = IniRead($ColorInc, "Variables", "FontFaceUI", "Segoe UI")
Const $fontfacel = IniRead($ColorInc, "Variables", "FontFaceLight", "Segoe UI Light")
Const $deffsize = Int(Execute(StringReplace(IniRead($ColorInc, "Variables", "DefaultFontSize", "12"), "#height#", "150", 0, 2)))

; Read templates into an array
Global $templates[3]
_FileReadToArray("templates.txt", $templates)

If $templates[0] <> 3 Then
	MsgBox(16, "Error", "Invalid templates file")
	Exit
EndIf

; Create GUI
$Gui = GUICreate("Panel Creator", 470, 285, -1, -1, BitOR($WS_BORDER, $WS_POPUP), BitOR($WS_EX_ACCEPTFILES, $WS_EX_TOOLWINDOW))

; Moar noise
$bg = GUICtrlCreatePic("Resources\bg.jpg", 0, 0)
GUICtrlSetState(-1, $GUI_DISABLE)

; Panel background
$drop = GUICtrlCreateGraphic(25, 82, 150, 150)
GUICtrlSetBkColor(-1, 0xFF1BA0E1)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)

; Footer
$footer = GUICtrlCreateGraphic(0, 258, 470, 27)
GUICtrlSetBkColor(-1, 0x787878)
GUICtrlSetState(-1, $GUI_DISABLE)

; Title, help and close images
$title = GUICtrlCreatePic("Resources\title.jpg", 18, 19, 350, 45, Default, $GUI_WS_EX_PARENTDRAG)
$help = GUICtrlCreatePic("Resources\help.jpg", 400, 17, 15, 20)
$close = GUICtrlCreatePic("Resources\close.jpg", 437, 17, 20, 20)

; Name and action input fields
GUICtrlCreatePic("Resources\fields.jpg", 196, 84, 171, 68)
GUICtrlSetState(-1, $GUI_DISABLE)
$name = GUICtrlCreateInput("Name", 206, 91, 150, 15, -1, $WS_EX_WINDOWEDGE)
$action = GUICtrlCreateInput("Action", 206, 130, 150, 15, -1, $WS_EX_WINDOWEDGE)

; Browse, select and create panel buttons
$browse = GUICtrlCreatePic("Resources\browse.jpg", 196, 156, 84, 24)
$select = GUICtrlCreatePic("Resources\select.jpg", 283, 156, 84, 24)
$create = GUICtrlCreatePic("Resources\create.jpg", 196, 188, 172, 44)

; Highlight current template
$highlight = GUICtrlCreatePic("Resources\highlight.jpg", 396, 80, 44, 44)
GUICtrlSetState(-1, $GUI_DISABLE)

; Template buttons
$template1 = GUICtrlCreatePic("Templates\" & $templates[1] & '.jpg', 402, 86, 32, 32)
$template2 = GUICtrlCreatePic("Templates\" & $templates[2] & '.jpg', 402, 141, 32, 32)
$template3 = GUICtrlCreatePic("Templates\" & $templates[3] & '.jpg', 402, 195, 32, 32)

; Get more icons link
$moaricons = GUICtrlCreateLabel("Get more icons", 25, 265, 100, 20)
GUICtrlSetColor(-1, 0xdddddd)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

; Author information
$copyright = GUICtrlCreateLabel("Created by Xyrfo Systems Incorporated", 274, 265)
GUICtrlSetColor(-1, 0xdddddd)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

; Separator between help and close
$separator = GUICtrlCreateGraphic(427, 0, 1, 45)
GUICtrlSetBkColor(-1, 0xe2e2e2)
GUICtrlSetState(-1, $GUI_DISABLE)

GUISetBkColor(0xf0f0f0)
GUISetState()

_IconImage_Startup()

; Create a double buffer to avoid flickering
Global $hGraphic = _GDIPlus_GraphicsCreateFromHWND(ControlGetHandle($Gui, "", $drop))
Global $hBitmap = _GDIPlus_BitmapCreateFromGraphics(150, 150, $hGraphic)
Global $hBackbuffer = _GDIPlus_ImageGetGraphicsContext($hBitmap)
_GDIPlus_GraphicsSetSmoothingMode($hBackbuffer, 2)

; Declare a few variables
Global $oldname, $tmpname, $template, $hImage, $oldimg, $imagex, $imagey, $imagew, $imageh
Global $hBrush, $hFormat, $hFamily, $hFont, $tLayout, $aInfo
Global $fixeds, $split, $textx, $texty, $font, $fsize, $iconx, $icony, $iconw, $iconh
$oldname = ""

; Load first template
_LoadTemplate("Templates\" & $templates[1] & ".ini")
_DrawPanelImage("Resources\droptext.jpg")

While 1
	Sleep(50)

	; Draw panel title only if it has been changed
	$tmpname = GUICtrlRead($name)
	If $tmpname <> $oldname Then
		_DrawPanelImage($oldimg)
		$oldname = $tmpname
	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE, $close
			_Exit()

		Case $help
			ShellExecute("http://omnimo.info/CustomizationGuide/PanelCreator.html")

		Case $moaricons
			ShellExecute("http://browse.deviantart.com/customization/icons/dock/?order=9")

		Case $copyright
			ShellExecute("http://www.xyrfo.com")

		Case $GUI_EVENT_DROPPED
			$filen = @GUI_DragFile

			Global $szDrive, $szDir, $szFName, $szExt
			$path = _PathSplit($filen, $szDrive, $szDir, $szFName, $szExt)
			$ext = $path[4] ; Dragged file's extension

			Switch $ext

				Case '.lnk'
					$aDetails = FileGetShortcut($filen) ; Load shortcut info

					If @error = 1 Then
						MsgBox(16, "Error", "Unable to load shortcut.")
						ContinueCase
					EndIf

					GUICtrlSetData($name, $szFName)
					GUICtrlSetData($action, $aDetails[0])
					$IconImage = _IconImage_FromPath($aDetails[0], 256) ; Get icon from target
					$filen = _TempFile(Default, Default, ".panelc") ; Create a temp file
					_IconImage_ToImageFile($IconImage, $filen, "PNG") ; Convert ico to png
					_GDIPlus_ImageDispose($hImage) ; Dispose of previous image

				Case '.ico'
					$IconImage = _IconImage_FromIcoFile($filen, 256) ; Get icon from ico file
					$filen = _TempFile(Default, Default, ".panelc") ; Create temp file
					_IconImage_ToImageFile($IconImage, $filen, "PNG") ; Convert ico to png
					_GDIPlus_ImageDispose($hImage) ; Dispose of previous image

				Case '.exe'
					GUICtrlSetData($name, $szFName)
					GUICtrlSetData($action, $filen)
					$IconImage = _IconImage_FromPEEx($filen, 256) ; Get icon from exe file
					$filen = _TempFile(Default, Default, ".panelc") ; Create temp file
					_IconImage_ToImageFile($IconImage, $filen, "PNG") ; Convert ico to png
					_GDIPlus_ImageDispose($hImage) ; Dispose of previous image

				Case '.contact'
					$infile = FileOpen($filen)
					If $infile = -1 Then
						MsgBox(16, "Error", "Unable to open contact file.")
						ContinueCase
					EndIf

					; Read file's contents into a string
					$string = FileRead($infile)
					FileClose($infile)

					$contactimg = _StringBetween($string, '<c:Url>', '</c:Url>') ; Get image path
					$fullname = _StringBetween($string, '<c:FormattedName>', '</c:FormattedName>') ; Get full name

					If $contactimg = 0 Or $fullname = 0 Then
						MsgBox(16, "Error", "Invalid contact file")
						ContinueCase
					EndIf

					GUICtrlSetData($name, $fullname[0])
					GUICtrlSetData($action, $filen)
					$filen = $contactimg[0]

			EndSwitch

			_DrawPanelImage($filen)

		Case $browse
			$file = FileOpenDialog("Choose a file", @UserProfileDir, "All (*.*)", 1)
			GUICtrlSetData($action, $file)

		Case $select
			$folder = FileSelectFolder("Choose a folder", @UserProfileDir, 1 + 2 + 4)
			GUICtrlSetData($action, $folder)

		Case $template1
			GUICtrlSetPos($highlight, 396, 80)
			_LoadTemplate("Templates\" & $templates[1] & '.ini')
			_DrawPanelImage($oldimg)

		Case $template2
			GUICtrlSetPos($highlight, 396, 135)
			_LoadTemplate("Templates\" & $templates[2] & '.ini')
			_DrawPanelImage($oldimg)

		Case $template3
			GUICtrlSetPos($highlight, 396, 189)
			_LoadTemplate("Templates\" & $templates[3] & '.ini')
			_DrawPanelImage($oldimg)

		Case $create
			_CreatePanel()

	EndSwitch
WEnd

Func _Exit()
	; Clean up resources
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_ImageDispose($hImage)
	_IconImage_Shutdown()

	; Clean up temporary files
	FileDelete(@TempDir & '\*.panelc')
	Sleep(100)

	; That's all folks
	Exit
EndFunc   ;==>_Exit

Func _LoadTemplate($filen)
	If $oldimg = "Resources\droptext.jpg" Then _DrawPanelImage("")

	; Read Panel Creator options from template
	$fixeds = Int(IniRead($filen, "Variables", "FixedIconSize", "0"))
	$split = Int(IniRead($filen, "Variables", "SplitString", "0"))

	; Read title position from template
	$textx = StringReplace(IniRead($filen, "text", "X", "0"), "#Height#", "150", 0, 2)
	$textx = Int(Execute(StringReplace($textx, "#xposition#", 15, 0, 2)))
	$texty = StringReplace(IniRead($filen, "text", "Y", "0"), "#Height#", "150", 0, 2)
	$texty = Int(Execute(StringReplace($texty, "#yposition#", $yposition, 0, 2)))

	; Read font from template
	$font = IniRead($filen, "text", "FontFace", "Segoe UI")
	$font = StringReplace($font, "#fonttype#", $fonttype, 0, 2)
	$font = StringReplace($font, "#fonttypewp#", $fonttypewp, 0, 2)
	$font = StringReplace($font, "#fontfaceui#", $fontfaceui, 0, 2)
	$font = StringReplace($font, "#fontfacelight#", $fontfacel, 0, 2)

	; Read font size from template
	$fsize = IniRead($filen, "text", "FontSize", "12")
	$fsize = StringReplace($fsize, "#Height#", "150", 0, 2)
	$fsize = Int(Execute(StringReplace($fsize, "#defaultfontsize#", $deffsize, 0, 2)))

	; Read icon dimensions from template
	$iconx = Int(Execute(StringReplace(IniRead($filen, "icon", "X", "0"), "#Height#", "150", 0, 2)))
	$icony = Int(Execute(StringReplace(IniRead($filen, "icon", "Y", "0"), "#Height#", "150", 0, 2)))
	$iconw = Int(Execute(StringReplace(IniRead($filen, "icon", "W", "0"), "#Height#", "150", 0, 2)))
	$iconh = Int(Execute(StringReplace(IniRead($filen, "icon", "H", "0"), "#Height#", "150", 0, 2)))

	; Create font
	$hBrush = _GDIPlus_BrushCreateSolid(0xFFFFFFFF)
	$hFamily = _GDIPlus_FontFamilyCreate($font)
	$hFont = _GDIPlus_FontCreate($hFamily, $fsize)
	$tLayout = _GDIPlus_RectFCreate($textx - 5, $texty - 5)
	$hFormat = _GDIPlus_StringFormatCreate()

	$template = $filen
EndFunc   ;==>_LoadTemplate

Func _DrawPanelImage($img)
	; Clear back buffer
	_GDIPlus_GraphicsClear($hBackbuffer, 0xFF1BA0E1)

	; Load image only if needed
	If $img <> $oldimg Then
		$oldimg = $img
		$hImage = _GDIPlus_ImageLoadFromFile($img)
		$imagew = _GDIPlus_ImageGetWidth($hImage)
		$imageh = _GDIPlus_ImageGetHeight($hImage)
	EndIf

	; Don't calculate image dimensions if FixedIconSize is set
	If $fixeds = 1 Then
		_GDIPlus_GraphicsDrawImageRect($hBackbuffer, $hImage, $iconx - 5, $icony - 5, $iconw, $iconh)
	Else
		$ratio = $imagew / $imageh

		; Science, bitches!
		If $imagew > 106 Or $imageh > 106 Then
			If $imagew >= $imageh Then
				$imagew = 106
				$imageh = 106 / $ratio
			Else
				$imageh = 106
				$imagew = 106 * $ratio
			EndIf
		EndIf

		$imagex = 74 - ($imagew / 2)
		$imagey = 71 - ($imageh / 2)

		_GDIPlus_GraphicsDrawImageRect($hBackbuffer, $hImage, $imagex, $imagey, $imagew, $imageh)
	EndIf

	; Replace first space with line break if SplitString is set
	If $split Then
		$tmpname = StringReplace($tmpname, " ", @CRLF, 1)
	EndIf

	; Draw title string and panel image
	_GDIPlus_GraphicsDrawStringEx($hBackbuffer, $tmpname, $hFont, $tLayout, $hFormat, $hBrush)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hBitmap, 0, 0, 150, 150)
EndFunc   ;==>_DrawPanelImage

Func _CreatePanel()
	$title = GUICtrlRead($name)
	$execute = GUICtrlRead($action)

	; Remove illegal characters from panel name
	$foldername = StringRegExpReplace($title, '[\s\\/\*\?\:<>|\"]', "")
	$folderpath = $SkinPath & 'WP7\Panels\' & $foldername
	$inipath = $folderpath & '\' & $foldername & '.ini'

	; Check if panel already exists
	Local $exists = 0
	If FileExists($folderpath) Then
		$exists = 1
		Local $answer = MsgBox(52, "PanelCreator", "Panel with the selected name already exists. Overwrite?")
		If $answer = 7 Then Return
	EndIf

	; Create panel directory
	If DirCreate($folderpath) = 0 Then
		MsgBox(16, "Unable to create panel", "The program was unable to create a panel with the selected name.")
	EndIf

	Local $drive, $dir, $fname, $ext
	Local $imgPath = _PathSplit($oldimg, $drive, $dir, $fname, $ext)

	; Copy template to panel directory
	FileCopy(@ScriptDir & '\' & $template, $inipath, 1 + 8)

	; Copy image to panel directory
	If $ext = '.panelc' Then
		$imgfilen = $foldername & '.png'
	Else
		$imgfilen = $fname & $ext
	EndIf
	FileCopy($oldimg, $folderpath & '\' & $imgfilen, 1 + 8)
	IniWrite($inipath, 'Variables', 'Image', $imgfilen)

	; Write name and action to the panel
	If $split Then
		IniWrite($inipath, 'Variables', 'Name', StringReplace($title, " ", "#CRLF#", 1))
	Else
		IniWrite($inipath, 'Variables', 'Name', $title)
	EndIf
	IniWrite($inipath, 'Variables', 'Action', $execute)

	; Calculate resizable widths for the icon if FixedIconSize is not set
	If Not $fixeds Then
		IniWrite($inipath, 'icon', 'x', '(#height#/(150/' & $imagex & ')+5)')
		IniWrite($inipath, 'icon', 'y', '(#height#/(150/' & $imagey & ')+5)')
		IniWrite($inipath, 'icon', 'w', '(#height#/(150/' & $imagew & '))')
		IniWrite($inipath, 'icon', 'h', '(#height#/(150/' & $imageh & '))')
	EndIf

	; Delete useless variables
	IniDelete($inipath, 'Variables', 'FixedIconSize')
	IniDelete($inipath, 'Variables', 'StringSplit')

	; Create size.inc
	IniWrite($folderpath & '\' & 'size.inc', 'Variables', 'Height', '150')

	; Write panel info to panels.inc
	For $i = 1 To 40
		If IniRead($PanelsInc, "Variables", "Name" & $i, "-1") = "-1" Then ExitLoop
	Next

	If $i = 41 Then
		Local $answer = MsgBox(52, "Omnimo Panel Creator", "The My Panels gallery is full. Would you like to overwrite the last panel?")
		If $answer = 6 Then $i -= 1
	EndIf

	IniWrite($PanelsInc, "Variables", "Name" & $i, $title)
	IniWrite($PanelsInc, "Variables", "Path" & $i, $foldername)
	IniWrite($PanelsInc, "Variables", "Icon" & $i, $imgfilen)

	; Activate panel
	If Not $exists Then
		SendBang("!RefreshApp")
		SendBang("!ActivateConfig WP7\Panels\" & $foldername & " " & $foldername & ".ini")
	Else
		If GetSkinWindow("WP7\Panels\" & $foldername) Then
			SendBang("!Refresh WP7\Panels\" & $foldername)
		Else
			SendBang("!ActivateConfig WP7\Panels\" & $foldername & ' ' & $foldername & '.ini')
		EndIf
		SendBang("!Refresh WP7\Gallery\MyPanels")
	EndIf
EndFunc   ;==>_CreatePanel

Func GetSkinWindow($szConfigName)
	Local Const $hWnd = WinGetHandle("[CLASS:RainmeterTrayClass]")
	If $hWnd <> 0 Then
		Local Const $iSize = StringLen($szConfigName) + 1

		Local Const $pMem = DllStructCreate("wchar[" & $iSize & "]")
		DllStructSetData($pMem, 1, $szConfigName)

		Local Const $pCds = DllStructCreate("dword;dword;ptr")
		DllStructSetData($pCds, 1, 5101)
		DllStructSetData($pCds, 2, ($iSize * 2))
		DllStructSetData($pCds, 3, DllStructGetPtr($pMem))

		Local Const $WM_COPYDATA = 0x004A
		Return _SendMessage($hWnd, $WM_COPYDATA, 0, DllStructGetPtr($pCds))
	EndIf

	Return 0
EndFunc   ;==>GetSkinWindow

Func SendBang($szBang)
	Local Const $hWnd = WinGetHandle("[CLASS:RainmeterMeterWindow]")
	If $hWnd <> 0 Then
		Local Const $iSize = StringLen($szBang) + 1

		Local Const $pMem = DllStructCreate("wchar[" & $iSize & "]")
		DllStructSetData($pMem, 1, $szBang)

		Local Const $pCds = DllStructCreate("dword;dword;ptr")
		DllStructSetData($pCds, 1, 1)
		DllStructSetData($pCds, 2, ($iSize * 2))
		DllStructSetData($pCds, 3, DllStructGetPtr($pMem))

		Local Const $WM_COPYDATA = 0x004A
		_SendMessage($hWnd, $WM_COPYDATA, 0, DllStructGetPtr($pCds))
	EndIf
EndFunc   ;==>SendBang