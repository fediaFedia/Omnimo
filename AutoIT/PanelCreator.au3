#NoTrayIcon
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=PanelCreator.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\PanelCreator\PanelCreator.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Panel Creator
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 4 -w 6 -w 7
#AutoIt3Wrapper_Run_Tidy=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>
#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WinAPI.au3>

#include "Includes\Common.au3"
#include "Includes\IconImage.au3"
#include "Includes\_Zip.au3"

Opt("ExpandEnvStrings", 1)

Const $SkinPath = $CmdLine[1]
Const $PanelsInc = $SkinPath & "WP7\Gallery\MyPanels\panels.inc"
Const $GDIFont = "Segoe UI"

; Remove a created panel
If $CmdLine[0] > 2 And $CmdLine[2] == "Delete" Then
	$index = $CmdLine[3]
	$path = IniRead($PanelsInc, "Variables", "Path" & $index, "")
	If $path == "" Then Exit
	DirRemove($SkinPath & "WP7\Panels\" & $path, 1)
	IniDelete($PanelsInc, "Variables", "Name" & $index)
	IniDelete($PanelsInc, "Variables", "Path" & $index)
	IniDelete($PanelsInc, "Variables", "Icon" & $index)
	SendBang("!DeactivateConfig WP7\Panels\" & $path)
	SendBang("!Refresh WP7\Gallery\MyPanels")
	Exit
EndIf

; Read GUI colors from Colors.inc
Const $ColorVariables = IniReadSection("Resources\Colors.inc", "Variables")
Const $GuiBG = $ColorVariables[1][1]
Global $PanelBG = AddAlpha($ColorVariables[2][1])
Const $BrowseBG = $ColorVariables[3][1]
Const $CreateBG = $ColorVariables[4][1]
Const $FooterBG = AddAlpha($ColorVariables[5][1])
Const $FieldsBG = AddAlpha($ColorVariables[6][1])
Const $FontColor = AddAlpha($ColorVariables[7][1])

Const $Color1 = $ColorVariables[8][1]
Const $Color2 = $ColorVariables[9][1]
Const $Color3 = $ColorVariables[10][1]
Const $Color4 = $ColorVariables[11][1]
Const $Color5 = $ColorVariables[12][1]
Const $Color6 = $ColorVariables[13][1]

; Initializes the IconImage library and GDI
_IconImage_Startup()

; Create GUI
$Gui = GUICreate("Panel Creator", 390, 255, -1, -1, BitXOR($GUI_SS_DEFAULT_GUI, $WS_MINIMIZEBOX), $WS_EX_ACCEPTFILES)
GUISetBkColor($GuiBG)

; Panel background
Const $drop = GUICtrlCreateGraphic(25, 25, 150, 150)
GUICtrlSetBkColor(-1, $PanelBG)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)

; Browse, select, create and save buttons
Const $browse = GUICtrlCreateGraphic(196, 99, 84, 24)
GUICtrlSetBkColor(-1, $BrowseBG)
Const $select = GUICtrlCreateGraphic(283, 99, 85, 24)
GUICtrlSetBkColor(-1, $BrowseBG)
Const $create = GUICtrlCreateGraphic(197, 132, 146, 43)
GUICtrlSetBkColor(-1, $CreateBG)
Const $save = GUICtrlCreateGraphic(343, 131, 25, 45)
GUICtrlSetBkColor(-1, Darken($CreateBG, 0.66))

; The graphics object needs to be created before the GUI is shown,
; otherwise measurements are way off for some strange reason
Const $hGUIGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
GUISetState()

Const $hSaveImage = _GDIPlus_ImageLoadFromFile("Resources\save.png")
_GDIPlus_GraphicsDrawImage($hGUIGraphic, $hSaveImage, 350, 147)

; Draw footer
Const $hGUIBrush = _GDIPlus_BrushCreateSolid($FooterBG)
_GDIPlus_GraphicsFillRect($hGUIGraphic, 0, 200, 390, 55, $hGUIBrush)

; Draw the input field backgrounds
Const $hGUIPen = _GDIPlus_PenCreate(0xFF747474)
_GDIPlus_BrushSetSolidColor($hGUIBrush, $FieldsBG)
_GDIPlus_GraphicsFillRect($hGUIGraphic, 197, 26, 169, 27, $hGUIBrush)
_GDIPlus_GraphicsFillRect($hGUIGraphic, 197, 62, 169, 27, $hGUIBrush)
_GDIPlus_GraphicsDrawRect($hGUIGraphic, 196, 25, 171, 29, $hGUIPen)
_GDIPlus_GraphicsDrawRect($hGUIGraphic, 196, 61, 171, 29, $hGUIPen)
_GDIPlus_GraphicsDrawRect($hGUIGraphic, 196, 131, 172, 44, $hGUIPen)

; Create edgeless input fields
Const $name = GUICtrlCreateInput("Name", 206, 34, 150, 15, -1, $WS_EX_WINDOWEDGE)
Const $action = GUICtrlCreateInput("Action", 206, 70, 150, 15, -1, $WS_EX_WINDOWEDGE)

; Create a double buffer to avoid flickering
Const $hGraphic = _GDIPlus_GraphicsCreateFromHWND(ControlGetHandle($Gui, "", $drop))
Const $hBitmap = _GDIPlus_BitmapCreateFromGraphics(150, 150, $hGraphic)
Const $hBackbuffer = _GDIPlus_ImageGetGraphicsContext($hBitmap)
_GDIPlus_GraphicsSetSmoothingMode($hBackbuffer, 2)

; Declare a few variables
Global $oldname = "", $tmpname, $hImage, $oldimg, $imagew, $imageh

Const $hBrush = _GDIPlus_BrushCreateSolid($FontColor)
Const $hFamily = _GDIPlus_FontFamilyCreate($GDIFont)
Const $hFont = _GDIPlus_FontCreate($hFamily, 9)
Const $tLayout = _GDIPlus_RectFCreate(10, 125)
Const $hFormat = _GDIPlus_StringFormatCreate()
Const $BrowseFont = _GDIPlus_FontCreate($hFamily, 8)

; Draw button strings
_GDIPlus_GraphicsDrawStringEx($hGUIGraphic, "Browse for file", $BrowseFont, _GDIPlus_RectFCreate(200, 103), $hFormat, $hBrush)
_GDIPlus_GraphicsDrawStringEx($hGUIGraphic, "Select folder", $BrowseFont, _GDIPlus_RectFCreate(290, 103), $hFormat, $hBrush)
_GDIPlus_GraphicsDrawStringEx($hGUIGraphic, "Create panel", _GDIPlus_FontCreate($hFamily, 14), _GDIPlus_RectFCreate(208, 141), $hFormat, $hBrush)

; Draw color selection rectangles
$CG1 = DrawColorBox($Color1, 27, 217)
$CG2 = DrawColorBox($Color2, 52, 217)
$CG3 = DrawColorBox($Color3, 77, 217)
$CG4 = DrawColorBox($Color4, 102, 217)
$CG5 = DrawColorBox($Color5, 127, 217)
$CG6 = DrawColorBox($Color6, 152, 217)

DrawPanelImage("Resources\droptext.png")

While 1
	Sleep(50)

	; Draw panel title only if it has been changed
	$tmpname = GUICtrlRead($name)
	If $tmpname <> $oldname Then
		DrawPanelImage($oldimg)
		$oldname = $tmpname
	EndIf

	$nMsg = GUIGetMsg()
	Switch $nMsg

		Case $GUI_EVENT_CLOSE
			_Exit()

		Case $GUI_EVENT_DROPPED
			$filen = @GUI_DragFile

			Global $szDrive, $szDir, $szFName, $szExt
			$path = _PathSplit($filen, $szDrive, $szDir, $szFName, $szExt)
			$ext = StringLower($path[4]) ; Dragged file's extension
			$IcoToFile = True

			Switch $ext

				Case '.lnk'
					$aDetails = FileGetShortcut($filen)

					If @error = 1 Then
						MsgBox(16, "Error", "Unable to load shortcut.")
						ContinueCase
					EndIf

					$target = $aDetails[0]
					If FileExists($target) = 0 Then $target = StringReplace($target, "Program Files (x86)", "Program Files")

					GUICtrlSetData($name, $szFName)
					GUICtrlSetData($action, $target)

					If $aDetails[4] <> "" And StringRight($aDetails[4], 3) <> "dll" Then
						; if icon filename is specified and it's not a dll file, use it as an icon
						$icon = $aDetails[4]
					Else
						; otherwise use the target path, correcting the path for some shortcuts on x64 systems
						$icon = $aDetails[0]
						If FileExists($icon) = 0 Then $icon = StringReplace($icon, "Program Files (x86)", "Program Files")
					EndIf

					$IconImage = _IconImage_FromPath($icon, 256)

				Case '.ico'
					$IconImage = _IconImage_FromIcoFile($filen, 256)

				Case '.exe'
					GUICtrlSetData($name, $szFName)
					GUICtrlSetData($action, $filen)
					$IconImage = _IconImage_FromPEEx($filen, 256)

				Case Else
					$IcoToFile = False

			EndSwitch

			If $IcoToFile Then
				$filen = _TempFile(Default, Default, ".panelc")
				_IconImage_ToImageFile($IconImage, $filen, "PNG")
				_GDIPlus_ImageDispose($hImage)
			EndIf

			DrawPanelImage($filen)

		Case $browse
			$file = FileOpenDialog("Choose a file", @UserProfileDir, "All (*.*)", 1)
			If Not @error Then GUICtrlSetData($action, $file)
			FileChangeDir(@ScriptDir)

		Case $select
			$folder = FileSelectFolder("Choose a folder", "", 1 + 2 + 4, @UserProfileDir)
			If Not @error Then GUICtrlSetData($action, $folder)
			FileChangeDir(@ScriptDir)

		Case $create
			$title = GUICtrlRead($name)
			$foldername = StringRegExpReplace($title, '[\s\\/\*\?\:<>|\"]', "")

			CreatePanel($title, $foldername, $SkinPath & 'WP7\Panels\' & $foldername)

			; Write panel info to panels.inc
			For $i = 1 To 40
				$iname = IniRead($PanelsInc, "Variables", "Name" & $i, "")
				If $iname = "" Or $iname = $title Then ExitLoop
			Next

			If $i = 41 Then
				$answer = MsgBox(52, "Omnimo Panel Creator", "The My Panels gallery is full. Would you like to overwrite the last panel?")
				If $answer = 6 Then $i -= 1
			EndIf

			IniWrite($PanelsInc, "Variables", "Name" & $i, $title)
			IniWrite($PanelsInc, "Variables", "Path" & $i, $foldername)
			IniWrite($PanelsInc, "Variables", "Icon" & $i, $foldername & '.png')

			; Activate panel
			SendBang("!RefreshApp")
			SendBang("!ActivateConfig WP7\Panels\" & $foldername & " default.ini")

		Case $save
			Do
				$title = GUICtrlRead($name)
				$foldername = StringRegExpReplace($title, '[\s\\/\*\?\:<>|\"]', "")

				$dest = FileSaveDialog("Destination", @DesktopDir, "Rmskin files (*.rmskin)", 16, $foldername & ".rmskin")
				If @error Then ExitLoop
				FileChangeDir(@ScriptDir)

				$author = InputBox("Author", "Author name displayed in rmskin", @UserName, Default, 120, 125)
				If @error Then ExitLoop

				If DirCreate("RmskinTemp") = 0 Then OmnimoError("Error", "Unable to create temporary .rmskin directory")
				FileCopy("Resources\RMSKIN.inc", "RmskinTemp\RMSKIN.ini", 1)
				IniWrite("RmskinTemp\RMSKIN.ini", "rmskin", "Name", $title & " Panel")
				IniWrite("RmskinTemp\RMSKIN.ini", "rmskin", "Author", $author)
				IniWrite("RmskinTemp\RMSKIN.ini", "rmskin", "Load", "WP7\Panels\" & $foldername & "\default.ini")

				CreatePanel($title, $foldername, @ScriptDir & "\RmskinTemp\Skins\WP7\Panels\" & $foldername)

				; Rmskins are just zip files, so create one
				_Zip_Create("RmskinTemp\Temp.zip", 1) ; Filename needs to end in .zip for some reason
				_Zip_AddItem(@ScriptDir & "\RmskinTemp\Temp.zip", @ScriptDir & "\RmskinTemp\RMSKIN.ini")
				_Zip_AddItem(@ScriptDir & "\RmskinTemp\Temp.zip", @ScriptDir & "\RmskinTemp\Skins")
				If @error Then OmnimoError("Error", "Unable to create a temporary zip file")

				If FileMove("RmskinTemp\Temp.zip", $dest, 1) = 0 Then OmnimoError("Error", "Unable to create .rmskin")
				If DirRemove("RmskinTemp", 1) = 0 Then OmnimoError("Error", "Unable to remove temporary directory")

				; Rmskin files end with the following 16-byte struct
				; struct PackageFooter
				; {
				; 	  __int64 size;
				; 	  BYTE flags;
				; 	  char key[7];
				; };

				$struct = DllStructCreate("int64 size;byte flags;char key[7]")
				DllStructSetData($struct, "size", FileGetSize($dest))
				DllStructSetData($struct, "flags", 0)
				DllStructSetData($struct, "key", "RMSKIN")

				Global $nBytes
				$hFile = _WinAPI_CreateFile($dest, 2) ; Open the rmskin for reading
				_WinAPI_SetFilePointer($hFile, 0, 2) ; Skip to the end of the file
				_WinAPI_WriteFile($hFile, DllStructGetPtr($struct), 16, $nBytes) ; Write the struct
				_WinAPI_CloseHandle($hFile)

				; Save preview to a file
				$preview = StringReplace($dest, ".rmskin", "") & "_preview.png"
				_GDIPlus_ImageSaveToFile($hBitmap, $preview)

				MsgBox(64, "Success", "Successfully created " & $dest & @CRLF & "Preview generated in " & $preview)
				ExitLoop
			Until 1

		Case $CG1
			$PanelBG = AddAlpha($Color1)
			DrawPanelImage($oldimg)

		Case $CG2
			$PanelBG = AddAlpha($Color2)
			DrawPanelImage($oldimg)

		Case $CG3
			$PanelBG = AddAlpha($Color3)
			DrawPanelImage($oldimg)

		Case $CG4
			$PanelBG = AddAlpha($Color4)
			DrawPanelImage($oldimg)

		Case $CG5
			$PanelBG = AddAlpha($Color5)
			DrawPanelImage($oldimg)

		Case $CG6
			$PanelBG = AddAlpha($Color6)
			DrawPanelImage($oldimg)

	EndSwitch
WEnd

Func _Exit()
	FileDelete(@TempDir & '\*.panelc')
	Exit
EndFunc   ;==>_Exit

Func DrawPanelImage($img)
	; Clear back buffer
	_GDIPlus_GraphicsClear($hBackbuffer, $PanelBG)

	; Load image only if needed
	If $img <> $oldimg Then
		$oldimg = $img
		$hImage = _GDIPlus_ImageLoadFromFile($img)
		$imagew = _GDIPlus_ImageGetWidth($hImage)
		$imageh = _GDIPlus_ImageGetHeight($hImage)
	EndIf

	If $imagew > $imageh Then
		$imageh = 100 * $imageh / $imagew
		$imagew = 100
	Else
		$imagew = 100 * $imagew / $imageh
		$imageh = 100
	EndIf

	$imagex = 74 - ($imagew / 2)
	$imagey = 71 - ($imageh / 2)

	_GDIPlus_GraphicsDrawImageRect($hBackbuffer, $hImage, $imagex, $imagey, $imagew, $imageh)

	; Draw title string and panel image
	_GDIPlus_GraphicsDrawStringEx($hBackbuffer, $tmpname, $hFont, $tLayout, $hFormat, $hBrush)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hBitmap, 0, 0, 150, 150)
EndFunc   ;==>DrawPanelImage

Func CreatePanel($title, $foldername, $folderpath)
	Local $execute = GUICtrlRead($action)

	; Check if panel already exists
	If FileExists($folderpath) Then
		Local $answer = MsgBox(52, "PanelCreator", "A panel with the selected name already exists. Overwrite?")
		If $answer = 7 Then Return
	EndIf

	; Create panel directory
	If DirCopy("Templates", $folderpath, 1) = 0 Then
		MsgBox(16, "Unable to create panel", "The program was unable to create a panel with the selected name.")
		Return
	EndIf

	; Copy image to panel directory
	FileCopy($oldimg, $folderpath & '\' & $foldername & '.png', 1 + 8)

	IniWrite($folderpath & '\UserVariables.inc', 'Variables', 'PanelName', $title)
	IniWrite($folderpath & '\UserVariables.inc', 'Variables', 'PanelAction', $execute)
	IniWrite($folderpath & '\UserVariables.inc', 'Variables', 'IconLocation', $foldername & '.png')

	; Write panel color to all inis
	Local $FileList = _FileListToArray($folderpath, "*.ini")
	Local $ColorSkin = HexToRGB(BitAND($PanelBG, 0x00FFFFFF))
	For $i = 1 To $FileList[0]
		IniWrite($folderpath & '\' & $FileList[$i], 'Variables', 'ColorSkin', $ColorSkin)
	Next
EndFunc   ;==>CreatePanel

Func Darken($Color, $factor)
	$Blue = Int(BitAND($Color, 0xFF) * $factor)
	$Green = Int(BitAND(BitShift($Color, 8), 0xFF) * $factor)
	$Red = Int(BitAND(BitShift($Color, 16), 0xFF) * $factor)
	Return RGBToHex($Red & ',' & $Green & ',' & $Blue)
EndFunc   ;==>Darken

Func DrawColorBox($Color, $x, $y)
	GUICtrlCreateGraphic($x, $y, 22, 22)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$C = GUICtrlCreateGraphic($x + 1, $y + 1, 20, 20)
	GUICtrlSetBkColor(-1, $Color)
	Return $C - 1
EndFunc   ;==>DrawColorBox

Func AddAlpha($hex)
	If StringLen($hex) <> 8 Then Return $hex
	Return BitOR(0xFF000000, $hex)
EndFunc   ;==>AddAlpha
