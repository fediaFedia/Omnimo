#NoTrayIcon
#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icons\PanelCreator.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\PanelCreator\PanelCreator.exe
#AutoIt3Wrapper_UseUpx=n
	#AutoIt3Wrapper_Res_HiDpi=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Panel Creator
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 4 -w 6 -w 7
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>
#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WinAPI.au3>

#include "Includes\Common.au3"
#include "Includes\IconImage.au3"
#include "Includes\_Zip.au3"

Opt("ExpandEnvStrings", 1)




Const $CurrentLanguage = IniRead("..\Background\Varrar.inc", "Variables", "Language", "English")
Const $LangFile = "..\Background\Language\" & $CurrentLanguage & ".cfg"

If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$Sections = IniReadSection($LangFile, "Variables")
For $i = 1 To $Sections[0][0]
	$Language.Add($Sections[$i][0], $Sections[$i][1])
 Next



Const $SkinPath = $CmdLine[1]
Const $PanelsInc = $SkinPath & "WP7\Gallery\panels.inc"
Const $GDIFont = "Segoe UI"
Const $scaledpi = IniRead($skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc", "Variables", "ScaleDpi", "1")

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
	SendBang("!Refresh WP7\Gallery")
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
$Gui = GUICreate("Panel Creator", 230* $scaledpi, 420* $scaledpi, -1, -1, BitXOR($GUI_SS_DEFAULT_GUI, $WS_MINIMIZEBOX), $WS_EX_ACCEPTFILES)
GUISetBkColor($GuiBG)

 
 
; Panel background
Const $drop = GUICtrlCreateGraphic(40* $scaledpi, 40 * $scaledpi, 150 * $scaledpi, 150 * $scaledpi)
GUICtrlSetBkColor(-1, $PanelBG)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)

; Browse, select, create and save buttons
Const $loadE = GUICtrlCreateLabel(".....", 110* $scaledpi, 322* $scaledpi, 70* $scaledpi) ; first cell 70 width
  GUICtrlSetBkColor($loadE, $PanelBG)
   GUICtrlSetColor($loadE, $CreateBG)
   	   GUICtrlSetState ( $loadE,   $GUI_HIDE   )
	   

Const $save = GUICtrlCreateGraphic(40* $scaledpi, 355* $scaledpi, 150* $scaledpi, 20* $scaledpi)
GUICtrlSetBkColor(-1, $PanelBG)

; The graphics object needs to be created before the GUI is shown,
; otherwise measurements are way off for some strange reason
Const $hGUIGraphic = _GDIPlus_GraphicsCreateFromHWND($Gui)
GUISetState()
; Draw footer
Const $hGUIBrush = _GDIPlus_BrushCreateSolid($FooterBG)
_GDIPlus_GraphicsFillRect($hGUIGraphic, 0, 205* $scaledpi, 230* $scaledpi, 500* $scaledpi, $hGUIBrush)
Const $hSaveImage = _GDIPlus_ImageLoadFromFile("Resources\save.png")
_GDIPlus_GraphicsDrawImage($hGUIGraphic, $hSaveImage, 350, 147)

Const $create = GUICtrlCreateGraphic(40* $scaledpi, 310* $scaledpi, 150* $scaledpi, 45* $scaledpi)
GUICtrlSetBkColor(-1, $CreateBG)

; Draw the input field backgrounds
Const $hGUIPen = _GDIPlus_PenCreate(0xFF747474)
_GDIPlus_BrushSetSolidColor($hGUIBrush, $FieldsBG)
_GDIPlus_GraphicsFillRect($hGUIGraphic, 40* $scaledpi, 215* $scaledpi, 150* $scaledpi, 30* $scaledpi, $hGUIBrush)
_GDIPlus_GraphicsFillRect($hGUIGraphic, 40* $scaledpi, 255* $scaledpi, 150* $scaledpi, 30* $scaledpi, $hGUIBrush)





Const $browse = GUICtrlCreateGraphic(145* $scaledpi, 262* $scaledpi, 17* $scaledpi, 17* $scaledpi)
 GUICtrlSetBkColor($browse, "0xFFFFFF")

Const $select = GUICtrlCreateGraphic(165* $scaledpi, 262* $scaledpi, 17* $scaledpi, 17* $scaledpi)
 GUICtrlSetBkColor($select, "0xFFFFFF")
 
Const $browseE = _GDIPlus_ImageLoadFromFile("Resources\file.png")
_GDIPlus_GraphicsDrawImage($hGUIGraphic, $browseE, 145* $scaledpi, 260* $scaledpi)

 
Const $selectE = _GDIPlus_ImageLoadFromFile("Resources\folder.png")
_GDIPlus_GraphicsDrawImage($hGUIGraphic, $selectE, 165* $scaledpi, 260* $scaledpi)


 

; Create edgeless input fields
Const $name = GUICtrlCreateInput($Language.Item("Name"), 50* $scaledpi, 223* $scaledpi, 130* $scaledpi, 15* $scaledpi, -1, $WS_EX_WINDOWEDGE)
Const $action = GUICtrlCreateInput($Language.Item("Action"), 50* $scaledpi, 263* $scaledpi, 65* $scaledpi, 15* $scaledpi, -1, $WS_EX_WINDOWEDGE)

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

_GDIPlus_StringFormatSetAlign($hFormat, 1)
_GDIPlus_GraphicsDrawStringEx($hGUIGraphic, $Language.Item("ExportRmskin"), $BrowseFont, _GDIPlus_RectFCreate(115* $scaledpi,360* $scaledpi), $hFormat, $hBrush)


_GDIPlus_GraphicsDrawStringEx($hGUIGraphic, $Language.Item("CreatePanel"), _GDIPlus_FontCreate($hFamily, 14), _GDIPlus_RectFCreate(115* $scaledpi, 320* $scaledpi), $hFormat, $hBrush)

_GDIPlus_StringFormatSetAlign($hFormat, 0)


; Draw color selection rectangles
;$CG1 = DrawColorBox($Color1, 39, 189)
;$CG2 = DrawColorBox($Color2, 65, 189)
;$CG3 = DrawColorBox($Color3, 91, 189)
;$CG4 = DrawColorBox($Color4, 116, 189)
;$CG5 = DrawColorBox($Color5, 142, 189)
;$CG6 = DrawColorBox($Color6, 168, 189)

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
		   
		 		   GUICtrlSetState ( $create,   $GUI_HIDE   )
	   GUICtrlSetState ( $loadE,   $GUI_SHOW   )



			$title = GUICtrlRead($name)
			$foldername = StringRegExpReplace($title, '[\s\\/\*\?\:<>|\"]', "")

			CreatePanel($title, $foldername, $SkinPath & 'WP7\Panels\' & $foldername)

			; Write panel info to panels.inc
			For $i = 1 To 32
				$iname = IniRead($PanelsInc, "Variables", "Name" & $i, "")
				If $iname = "" Or $iname = $title Then ExitLoop
			Next



			If $i = 33 Then
				$answer = MsgBox(52, "Omnimo Panel Creator", "The Custom Panels gallery is full. Would you like to overwrite the last panel?")
				If $answer = 6 Then $i -= 1
			EndIf

			IniWrite($PanelsInc, "Variables", "Name" & $i, $title)
			IniWrite($PanelsInc, "Variables", "Path" & $i, $foldername)
			IniWrite($PanelsInc, "Variables", "Icon" & $i, $foldername & '.png')


			; Activate panel
			SendBang("!RefreshApp")
			SendBang("!ActivateConfig WP7\Panels\" & $foldername & " default.ini")

		   		   GUICtrlSetState ( $create,   $GUI_SHOW  )
				   	   GUICtrlSetState ( $loadE,   $GUI_HIDE   )
				   _GDIPlus_StringFormatSetAlign($hFormat, 1)
				   _GDIPlus_GraphicsDrawStringEx($hGUIGraphic, $Language.Item("CreatePanel"), _GDIPlus_FontCreate($hFamily, 14), _GDIPlus_RectFCreate(115* $scaledpi, 320* $scaledpi), $hFormat, $hBrush)
_GDIPlus_StringFormatSetAlign($hFormat, 0)

		      



		Case $save
			Do
				$title = GUICtrlRead($name)
				$foldername = StringRegExpReplace($title, '[\s\\/\*\?\:<>|\"]', "")

				$dest = FileSaveDialog("Destination", @DesktopDir, "Rmskin files (*.rmskin)", 16, $foldername & ".rmskin")
				If @error Then ExitLoop
				FileChangeDir(@ScriptDir)

				$author = InputBox("Author", $Language.Item("AuthorName"), @UserName, Default, 120, 125)
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

				MsgBox(64, $Language.Item("Success"), $Language.Item("SuccessfullyCreated") & $dest & @CRLF & $Language.Item("PreviewGeneratedIn") & $preview)
				ExitLoop
			Until 1

	;	Case $CG1
	;		$PanelBG = AddAlpha($Color1)
	;		DrawPanelImage($oldimg)
;
	;	Case $CG2
	;		$PanelBG = AddAlpha($Color2)
	;		DrawPanelImage($oldimg)
;
	;	Case $CG3
	;		$PanelBG = AddAlpha($Color3)
	;		DrawPanelImage($oldimg)
;
	;	Case $CG4
	;		$PanelBG = AddAlpha($Color4)
	;		DrawPanelImage($oldimg)
;
	;	Case $CG5
	;		$PanelBG = AddAlpha($Color5)
	;		DrawPanelImage($oldimg)
;
	;	Case $CG6
	;		$PanelBG = AddAlpha($Color6)
	;		DrawPanelImage($oldimg)

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
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hBitmap, 0, 0, 150*$scaledpi, 150*$scaledpi)
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

;Func DrawColorBox($Color, $x, $y)
;
;	$C = GUICtrlCreateGraphic($x + 1, $y + 1, 20, 20)
;	GUICtrlSetBkColor(-1, $Color)
;	Return $C - 1
;EndFunc   ;==>DrawColorBox

Func AddAlpha($hex)
	If StringLen($hex) <> 8 Then Return $hex
	Return BitOR(0xFF000000, $hex)
 EndFunc   ;==>AddAlpha
 
 
 