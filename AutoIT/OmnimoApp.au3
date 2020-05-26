#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icons\OmnimoApp.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\OmnimoApp.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <File.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
#include <IE.au3>


Switch $CmdLine[1]

; Open Start Menu

Case 'Layouts'

Const $settings = $CmdLine[5]
Const $skins    = $CmdLine[6]
Const $command  = $CmdLine[2]
Const $index    = $CmdLine[3]
Const $wallpaper    = $CmdLine[7]
Const $saved    = $skins & "WP7\Gallery\MultiManager\Saved\"


Switch $command
		Case 'Save0'


				If FileExists($saved & $index) = 0 Then DirCreate($saved & $index)
		$imagePath = $saved & $index & "\screenshot.png"
		_GDIPlus_Startup()
		$hBitmap = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
		_SavehBitmapEx($hBitmap, $imagePath, 400, 400 / (@DesktopWidth / @DesktopHeight))
		FileCopy($settings & "Rainmeter.ini", $saved & $index & "\Rainmeter.ini", 1)

		FileCopy($skins & "WP7\@Resources\Common\Color\color.inc", $saved & $index & "\color.inc", 1)


	 IniWrite($saved & $index & "\Rainmeter.ini", "WP7\TextItems\Extra\Missing", "Active", "1")

		 IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager", "Active", "0")

    IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "SkinPath")
	    IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "ConfigEditor")
	   IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "TrayExecuteR")
	      IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "Language")



		SendBang("!Refresh WP7\Gallery\MultiManager")




		Case 'Save1'




					If FileExists($saved & $index) = 0 Then DirCreate($saved & $index)
		$imagePath = $saved & $index & "\screenshot.png"
		_GDIPlus_Startup()
		$hBitmap = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
		_SavehBitmapEx($hBitmap, $imagePath, 400, 400 / (@DesktopWidth / @DesktopHeight))
		FileCopy($settings & "Rainmeter.ini", $saved & $index & "\Rainmeter.ini", 1)
		FileCopy($wallpaper, $saved & $index & "\Wallpaper.bmp", 1)

		FileCopy($skins & "WP7\@Resources\Common\Color\color.inc", $saved & $index & "\color.inc", 1)


		 IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager", "Active", "0")
		 	 IniWrite($saved & $index & "\Rainmeter.ini", "WP7\TextItems\Extra\Missing", "Active", "1")



    IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "SkinPath")
	    IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "ConfigEditor")
	   IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "TrayExecuteR")
	      IniDelete($saved & $index & "\Rainmeter.ini", "Rainmeter", "Language")

		SendBang("!Refresh WP7\Gallery\MultiManager")




		Case 'Load0'



$shortcutYes = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "Active", "0")

		If $shortcutYes = 1 Then
		   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "Active", "1")
$shortcutX = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "WindowX", "0")
$shortcutY = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "WindowY", "0")
   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "WindowX", $shortcutX)
   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "WindowY", $shortcutY)
Else
      IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\1", "Active", "0")
		 EndIf


$shortcut2Yes = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "Active", "0")

		If $shortcut2Yes = 1 Then
		   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "Active", "1")
$shortcut2X = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "WindowX", "0")
$shortcut2Y = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "WindowY", "0")
   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "WindowX", $shortcut2X)
   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "WindowY", $shortcut2Y)

Else
      IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\2", "Active", "0")
		 EndIf

$shortcut3Yes = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "Active", "0")

		If $shortcut3Yes = 1 Then
		   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "Active", "1")
$shortcut3X = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "WindowX", "0")
$shortcut3Y = IniRead($settings & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "WindowY", "0")
   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "WindowX", $shortcut3X)
   IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "WindowY", $shortcut3Y)

Else
      IniWrite($saved & $index & "\Rainmeter.ini", "WP7\Gallery\MultiManager\Shortcuts\3", "Active", "0")
   EndIf



		If DirCreate($settings & "Layouts\MultiManagerTemp") = 0 Then
			MsgBox(0, "Debug", "Creating directory failed")
			Exit
		EndIf
		If FileCopy($saved & $index & "\Rainmeter.ini", $settings & "Layouts\MultiManagerTemp\Rainmeter.ini", 1) = 0 Then
			MsgBox(0, "Debug", "Copying Rainmeter.ini file failed")
			Exit
		 EndIf

		If FileCopy($saved & $index & "\color.inc", $skins & "WP7\@Resources\Common\Color\color.inc", 1) = 0 Then
			MsgBox(0, "Debug", "Copying color.inc file failed")
			Exit
		EndIf

		SendBang("!LoadLayout MultiManagerTemp")
		Sleep(5000)
		DirRemove($settings & "Layouts\MultiManagerTemp", 1)



				Case 'Load1'
		; Load saved layout by creating a temporary Rainmeter layout and then loading it
		If DirCreate($settings & "Layouts\MultiManagerTemp") = 0 Then
			MsgBox(0, "Debug", "Creating directory failed")
			Exit
		EndIf
		If FileCopy($saved & $index & "\Rainmeter.ini", $settings & "Layouts\MultiManagerTemp\Rainmeter.ini", 1) = 0 Then
			MsgBox(0, "Debug", "Copying Rainmeter.ini file failed")
			Exit
		 EndIf


		If FileCopy($saved & $index & "\color.inc", $skins & "WP7\@Resources\Common\Color\color.inc", 1) = 0 Then
			MsgBox(0, "Debug", "Copying color.inc file failed")
			Exit
		EndIf


		SendBang("!LoadLayout MultiManagerTemp")
		Sleep(5000)
		DirRemove($settings & "Layouts\MultiManagerTemp", 1)

	 Case 'Delete'

		  DirRemove($saved & $index, $DIR_REMOVE)



FileCopy($skins & "WP7\Gallery\MultiManager\screenshot.png", $saved & $index & "\screenshot.png", 8)
		SendBang("!Refresh WP7\Gallery\MultiManager")


	EndSwitch



Case 'StartMenu'
	Send("{LWIN}")


; µTorrent
; Command line arguments:
; [2]: username
; [3]: password
; [4]: action
; [5]: hash

Case 'PowerPlan'
	If $CmdLine[0] < 2 Then OmnimoError("Error", "Too few command line arguments specified.")
	If $CmdLine[2] == 'HighPerformance' Then
        RunWait('powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c', "", @SW_HIDE)
    ElseIf $CmdLine[2] == 'Balanced' Then
        RunWait('powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e', "", @SW_HIDE)
    ElseIf $CmdLine[2] == 'PowerSaver' Then
        RunWait('powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a ', "", @SW_HIDE)
    EndIf
	SendBang("!Refresh WP7\Panels\PowerPlan")


; Set display brightness
; http://www.autoitscript.com/forum/topic/127668-tinybrightnesscontroler-v-1002/
; Command line arguments:
; [2] Brightness level
Case 'Skin'
	If $CmdLine[0] < 3 Then OmnimoError("Error", "Too few command line arguments specified.")
    FileCopy($CmdLine[3] & '\WP7\@Resources\Common\Color\' & $CmdLine[2] & '.inc', $CmdLine[3] & '\WP7\@Resources\Common\Color\color.inc', 1)
	SendBang("!Refresh *")



; Change tray icon
; Command line arguments:
; [2] Tray icon
; [3] Program path
; [4] Settings path
; [5] Skins path
Case 'Tray'
	If $CmdLine[0] < 5 Then OmnimoError("Error", "Too few command line arguments specified.")
	Const $TraySection = IniReadSection($CmdLine[5] & "\WP7\@Resources\Common\Gallery\Tray\" & $CmdLine[2] & ".txt", "TrayMeasure")
	IniWriteSection($CmdLine[4] & "Rainmeter.ini", "TrayMeasure", $TraySection)
	SendBangTray("!Quit")
    ProcessWaitClose("Rainmeter.exe")
    ShellExecute($CmdLine[3] & "Rainmeter.exe")



Case 'Eject'
	$drive = DriveGetDrive("CDROM")
	If @error Then OmnimoError("Error", "Unable to find an optical disc drive.")
	For $i = 1 To $drive[0]
		CDTray($drive[$i], "open")
	Next


; Turn monitor off
Case 'Monitor'
	Monitor("off")


; Alignment Tool Stuff

Case 'LockUnlockPanels'
	LockUnlockPanels()

Case 'DarkWithPanels'
	DarkWithPanels()


Case 'LightWithPanels'
	LightWithPanels()

Case 'Dark'
	Dark()

Case 'Light'
	Light()

Case 'Missing'
	Missing()

Case 'Align'
	Align()



; Toggle desktop icons
; Command line arguments:
; [2] Show / Hide (optional)
Case 'ToggleIcons'
	If $CmdLine[0] < 2 Then OmnimoError("Error", "Too few command line arguments specified.")
    $hParent = WinGetHandle("Program Manager")
    $hListView = ControlGetHandle($hParent, "", "SysListView321")

    ; State == 7 => desktop icons are shown
    ; State == 5 => desktop icons are hidden
    $state = WinGetState($hListView)

	Switch $CmdLine[2]
		Case 'Show'
			WinSetState($hListView, '', @SW_SHOW)
		Case 'Hide'
			WinSetState($hListView, '', @SW_HIDE)
		Case 'Toggle'
			If $state = '7' Then
				WinSetState($hListView, '', @SW_HIDE)
						SendBangMulti("[!Show *][!Show WP7\Panels\ShowDesktop]")
			ElseIf $state = '5' Then
				WinSetState($hListView, '', @SW_SHOW)
					SendBangMulti("[!Hide *][!Show WP7\Panels\ShowDesktop]")

		 EndIf

		 		Case 'ToggleFade'
			If $state = '7' Then
				WinSetState($hListView, '', @SW_HIDE)
						SendBangMulti("[!ShowFade *][!Show WP7\Panels\ShowDesktop]")
			ElseIf $state = '5' Then
				WinSetState($hListView, '', @SW_SHOW)
					SendBangMulti("[!HideFade *][!Show WP7\Panels\ShowDesktop]")


			EndIf
	EndSwitch



Case 'Power'
	If $CmdLine[0] < 3 Then OmnimoError("Error", "Too few command line arguments specified.")

	Sleep(Int($CmdLine[3]) * 1000)
	SendBang("!DeactivateConfig WP7\TextItems\Extra\PowerButtons\Dialogue")

	Switch $CmdLine[2]
		Case 'Shutdown'
			Run('shutdown.exe /s /t 00', "", @SW_HIDE)
		Case 'Restart'
			Run('shutdown.exe /r /t 00', "", @SW_HIDE)
		Case 'Logoff'
			Run('shutdown.exe /l', "", @SW_HIDE)
		Case 'Sleep'
			Run('rundll32.exe powrprof.dll,SetSuspendState 0,1,0', "", @SW_HIDE)
		Case 'Hibernate'
			Run('rundll32.exe PowrProf.dll,SetSuspendState', "", @SW_HIDE)
		Case 'Lock'
			Run('rundll32.exe user32.dll,LockWorkStation', "", @SW_HIDE)
	EndSwitch



Case 'Screenshot'
	If $CmdLine[0] < 2 Then OmnimoError("Error", "Too few command line arguments specified.")
    $config = $CmdLine[2] & '\WP7\@Resources\Config\Panels\Camera\UserVariables.inc'

    ; Read variables
    $Delay = IniRead($config, 'Variables', 'Delay', '0')
    $CaptureCursor = IniRead($config, 'Variables', 'CaptureCursor', 'False')
    $FileFormat = IniRead($config, 'Variables', 'FileFormat', 'jpg')
    $OpenImageAfter = IniRead($config, 'Variables', 'OpenImageAfter', 'True')
    $SaveTo = IniRead($config, 'Variables', 'SaveTo', @UserProfileDir & '\Pictures')
    $SaveTo = StringReplace($SaveTo, '%USERPROFILE%', @UserProfileDir)
    Sleep(Int($Delay) * 1000)

	_ScreenCapture_Capture($SaveTo & '\' & @MDAY & '-' & @MON & '-' & @YEAR & '_' & @HOUR & '-' & @MIN & '.' & $FileFormat, Default, Default, @DesktopWidth, @DesktopHeight, $CaptureCursor <> "False")

    If $OpenImageAfter = 'True' Then
        ShellExecute($SaveTo & '\' & @MDAY & '-' & @MON & '-' & @YEAR & '_' & @HOUR & '-' & @MIN & '.' & $FileFormat)
    EndIf


; Create an extra
; Command line arguments:
; [2] Name
; [3] Path to Extra Builder


Case 'Browser'

   $scaledpi = $CmdLine[3]


	$GUI = GUICreate("Omnimo", 535 * $scaledpi, 535 * $scaledpi, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX, $WS_SIZEBOX, $WS_CLIPCHILDREN))
	GUISetBkColor(0x7A7A7A)

	_IEErrorHandlerRegister()
	$oIE = _IECreateEmbedded()
	$obj = GUICtrlCreateObj($oIE, 0, 0, 535 * $scaledpi, 535 * $scaledpi)
	GUICtrlSetResizing(-1, $GUI_DOCKBORDERS)

	_IENavigate($oIE, $CmdLine[2])
	GUISetState()

	While 1
		$msg = GUIGetMsg()
		Switch $msg

			Case $GUI_EVENT_CLOSE
				Exit
		EndSwitch
	WEnd



; Windows Update

Case 'Create'
	If $CmdLine[0] < 3 Then OmnimoError("Error", "Too few command line arguments specified.")

	Const $EscapedName = StringRegExpReplace($CmdLine[2], '[\s\\/\*\?\:<>|\"]', "")
	Const $CreatedDir = $CmdLine[3] & "\Created\" & $EscapedName
	If FileExists($CreatedDir) Then
		$answer = MsgBox(52, "Extra Builder", "An extra with the selected name already exists. Overwrite?")
		If $answer = 7 Then Exit
	EndIf

	DirCopy($CmdLine[3] & "\Template", $CreatedDir, 1)
	FileCopy(IniRead($CmdLine[3] & "\Template\UserVariables.inc", "Variables", "ItemImage", ""), $CreatedDir & "\Item.png", 1)

	SendBang("!RefreshApp")

	SendBang("!ActivateConfig WP7\TextItems\Extra\ExtraBuilder\Created\" & $EscapedName)

; File / Folder selector
; Command line arguments:
; [2] Image / File / Folder / App
; [3] Variable to write
; [4] Panel path


Case 'CreatePanel'


      Const $skinpath    = $CmdLine[5]
Const $PanelsInc = $skinpath & "WP7\Gallery\panels.inc"
	If $CmdLine[0] < 3 Then OmnimoError("Error", "Too few command line arguments specified.")

	Const $EscapedName = StringRegExpReplace($CmdLine[2], '[\s\\/\*\?\:<>|\"]', "")
	Const $CreatedDir = $skinpath & "WP7\Panels\#CustomPanels\" & $EscapedName
	If FileExists($CreatedDir) Then
		$answer = MsgBox(52, "Extra Builder", "An extra with the selected name already exists. Overwrite?")
		If $answer = 7 Then Exit
	EndIf

	DirCopy($CmdLine[3] & "\PanelTemplate", $CreatedDir, 1)
	FileCopy(IniRead($CmdLine[3] & "\PanelTemplate\UserVariables.inc", "Variables", "IconLocation", ""), $CreatedDir & "\Item.png", 1)



	; Write panel info to panels.inc
			For $i = 1 To 32
				$iname = IniRead($PanelsInc, "Variables", "Name" & $i, "")
				If $iname = "" Or $iname = $EscapedName Then ExitLoop
			Next



			If $i = 33 Then
				$answer = MsgBox(52, "Omnimo Panel Creator", "The Custom Panels gallery is full. Would you like to overwrite the last panel?")
				If $answer = 6 Then $i -= 1
			EndIf

IniWrite($CreatedDir & "\UserVariables.inc", "Variables", "IconLocation", "Item.png")

			IniWrite($PanelsInc, "Variables", "Name" & $i, $EscapedName)
			IniWrite($PanelsInc, "Variables", "Path" & $i, $EscapedName)
			IniWrite($PanelsInc, "Variables", "Icon" & $i, $CreatedDir & "\Item.png")





	SendBang("!RefreshApp")

	SendBang("!ActivateConfig WP7\Panels\#CustomPanels\" & $EscapedName)

	Exit
; File / Folder selector
; Command line arguments:
; [2] Image / File / Folder / App
; [3] Variable to write
; [4] Panel path


Case 'CreatePanelDelete'

      Const $skinpath    = $CmdLine[5]
Const $PanelsInc = $skinpath & "WP7\Gallery\panels.inc"

$index = $CmdLine[2]
	$path = IniRead($PanelsInc, "Variables", "Path" & $index, "")
	If $path == "" Then Exit
	DirRemove($SkinPath & "WP7\Panels\#CustomPanels\" & $path, 1)
	IniDelete($PanelsInc, "Variables", "Name" & $index)
	IniDelete($PanelsInc, "Variables", "Path" & $index)
	IniDelete($PanelsInc, "Variables", "Icon" & $index)
	SendBang("!DeactivateConfig WP7\Panels\#CustomPanels\" & $path)
	SendBang("!Refresh WP7\Gallery")
	Exit


Case 'Select'
    Switch $CmdLine[2]
		Case 'File'
			If $CmdLine[0] > 5 Then
				$StartingDir = $CmdLine[6]
			Else
				$StartingDir = @UserProfileDir
			EndIf
			$file = FileOpenDialog("Choose a file", $StartingDir, "All files (*.*)", 1)
			If @error Then Exit
			IniWrite($CmdLine[4], "Variables", $CmdLine[3], $file)

		Case 'FileFolder'
			If $CmdLine[0] > 5 Then
				$StartingDir = $CmdLine[6]
			Else
				$StartingDir = @UserProfileDir
			EndIf
			$folder = FileSelectFolder("Choose a folder", "", 1)
			If @error Then Exit
			IniWrite($CmdLine[4], "Variables", $CmdLine[3], $folder)


		Case 'Image'
			If $CmdLine[0] > 5 Then
				$StartingDir = $CmdLine[6]
			Else
				$StartingDir = @UserProfileDir & "\Pictures"
			EndIf
			$file = FileOpenDialog("Choose an image", $StartingDir, "Images (*.png;*.jpg;*.jpeg;*.bmp)", 1)
			If @error Then Exit
			IniWrite($CmdLine[4], "Variables", $CmdLine[3], $file)
			SendBangLonger("!Refresh " & $CmdLine[5])

		Case 'Folder'
			$folder = FileSelectFolder("Choose a folder", "", 1)
			If @error Then Exit
			$split = StringSplit($folder, "\")
			$FolderName = UBound($split) - 1
			$ConfigPath = StringReplace("WP7\", "WP7\@Resources\Config\", $CmdLine[4]) & "\UserVariables.inc"
			IniWrite($ConfigPath, "Variables", $CmdLine[3], $folder)
			IniWrite($ConfigPath, "Variables", "FolderName", $split[$FolderName])
			SendBangLonger("!Refresh " & $CmdLine[5])

		Case 'App'
			$file = FileOpenDialog("Choose an application", @DesktopDir, "Apps (*.exe;*.lnk)", 1)
			If @error Then Exit
			; Get file extension, amazingly bullet-proof method
			$ext = StringRight($file, 3)
			If $ext = 'exe' Then
				$info = FileGetVersion($file, "ProductName")  ; Get program's name
				$path = $file
			ElseIf $ext = 'lnk' Then
				Global $szDrive, $szDir, $szFName, $szExt
				$TestPath = _PathSplit($file, $szDrive, $szDir, $szFName, $szExt)
				$Shortcut = FileGetShortcut($file)
				$path = $Shortcut[0]
				$info = $TestPath[3]
			EndIf

			$ConfigPath = StringReplace("WP7\", "WP7\@Resources\Config\", $CmdLine[7]) & "\UserVariables.inc"
			IniWrite($ConfigPath, "Variables", $CmdLine[3], $path)
			IniWrite($ConfigPath, "Variables", $CmdLine[4], $info)

			; Open an icon select dialog
			$icon = FileOpenDialog("Choose an icon", $CmdLine[6] & '\WP7\@Resources\Graphics\Panels\Launcher\Icons', "Images (*.png;*.jpg;*.jpeg;*.bmp)", 1)
			If @error Then Exit

			IniWrite($ConfigPath, "Variables", $CmdLine[5], $icon)
			SendBangLonger("!Refresh " & $CmdLine[8])
    EndSwitch
EndSwitch






Func Monitor($io_control = "on")
    Local $WM_SYSCommand = 274
    Local $SC_MonitorPower = 61808
    Local $HWND = WinGetHandle('[CLASS:Progman]')
    Switch StringUpper($io_control)
        Case "OFF"
            DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND, "int", $WM_SYSCommand, "int", $SC_MonitorPower, "int", 2)
        Case "ON"
            DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND, "int", $WM_SYSCommand, "int", $SC_MonitorPower, "int", -1)
        Case Else
            MsgBox(32, @ScriptName, "Command usage: on/off")
    EndSwitch
EndFunc

Func _WU_ErrorHandler()
	; Do something more clever here?
	Exit
 EndFunc ;==>_WU_ErrorHandler





 Func HexToRGB($Color)
	$Blue = BitAND($Color, 0xFF)
	$Green = BitAND(BitShift($Color, 8), 0xFF)
	$Red = BitAND(BitShift($Color, 16), 0xFF)
	Return $Red & ',' & $Green & ',' & $Blue
 EndFunc



Func OmnimoError($title, $msg)
	MsgBox(16, $title, $msg & @CRLF & @CRLF & 'Please send an e-mail to omnimosupport@gmail.com or' & @CRLF & 'file an issue at github with the following information:' & @CRLF & @CRLF & '- This error message' & @CRLF & '- Steps to reproduce the issue' & @CRLF & '- Your version of Rainmeter and Windows')
	Exit
 EndFunc



Func SendBang($szBang)

Run('"' & $CmdLine[4] & 'Rainmeter.exe" [' & $szBang & ']')

EndFunc

Func SendBangMulti($szBang)

Run('"' & $CmdLine[4] & 'Rainmeter.exe" ' & $szBang & '')

EndFunc


Func SendBangLonger($szBang)

Run('"' & $CmdLine[7] & 'Rainmeter.exe" [' & $szBang & ']')

EndFunc



Func SendBangTray($szBang)

Run('"' & $CmdLine[3] & 'Rainmeter.exe" [' & $szBang & ']')

EndFunc



Func LockUnlockPanels()


Const $skinpath    = $CmdLine[3]
Const $SettingsPath    = $CmdLine[2]
Const $Variant    = $CmdLine[5]
Const $CurrentLanguage = IniRead( $skinpath & "WP7\@Resources\Common\Background\Varrar.inc", "Variables", "Language", "English")
Const $LangFile = $skinpath & "WP7\@Resources\Common\Background\Language\" & $CurrentLanguage & ".cfg"




If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$SectionsE = IniReadSection($LangFile, "Variables")
For $i = 1 To $SectionsE[0][0]
	$Language.Add($SectionsE[$i][0], $SectionsE[$i][1])
 Next



Const $RainmeterINI = $SettingsPath & "\Rainmeter.ini"
Const $Sections = IniReadSectionNames($RainmeterINI)
If @error Then OmnimoError("Error", "Unable to open Rainmeter.ini for reading.")





  For $i = 1 To $Sections[0]


If $Variant = "lock" Then

SendBang("!Draggable 0 " & $Sections[$i])


Else

SendBang("!Draggable 1 " & $Sections[$i])
EndIf




   Next



If $Variant = "lock" Then

MsgBox($MB_ICONINFORMATION, "Info", $Language.Item("PanelsLocked"), 2)


Else

MsgBox($MB_ICONINFORMATION, "Info", $Language.Item("PanelsUnlocked"), 2)
EndIf



EndFunc




Func Align()

   Const $skinpath    = $CmdLine[3]
Const $SettingsPath    = $CmdLine[2]
Const $Variant    = $CmdLine[5]
Const $sY   = $CmdLine[6]
Const $sX = $CmdLine[7]

		Const $RainmeterINI = $SettingsPath & "\Rainmeter.ini"
	Const $Sections = IniReadSectionNames($RainmeterINI)
	If @error Then OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")



Const $scaledpi = IniRead($skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc", "Variables", "ScaleDpi", "1")
$iCount = 0

Global $movebyX = 160 * $scaledpi
Global $movebyY = 160 * $scaledpi
Global $initialX = 45 + $sX
Global $initialY = 45 + $sY

$row1 = 0
$row2 = 0
$row3 = 0
$row4 = 0
$row5 = 0
$row6 = 0
$row7 = 0
$row8 = 0

	$NumPanels = 0
	;GUICtrlSetData($PanelList, "")




	For $i = 1 To $Sections[0]




		; Only want panels here
		If StringRegExp($Sections[$i], '^WP7\\(Installed|Donator)?Panels.*$') Then
			If IniRead($RainmeterINI, $Sections[$i], "Active", "0") <> "0" And FileExists($SkinPath & $Sections[$i]) Then
				$config = StringReplace($Sections[$i], "WP7\", "WP7\@Resources\Config\") & "\RainConfigure.cfg"
				If IniRead($config, "Options", "Colorizable", "1") == "0" Then ContinueLoop



;MsgBox($MB_SYSTEMMODAL, "Title", $Sections[$i], 1)
IniWrite ( 'hue.ini', "Variables", "Panel" & $iCount, $Sections[$i] )



;Local $iCountLines = _FileCountLines("hue.ini")
;MsgBox($MB_SYSTEMMODAL, "", "There are " & $iCountLines & " lines in this file.")




$iCount += 1

If $Variant = "4x4" Then

If $iCount < 5 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 4 AND 8 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 8 AND 12 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 12 AND 16 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 16 AND 20 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row4 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 20 AND 24 >= $iCount  Then
$row5 += 1
SendBang("!Move " & $initialX + $movebyX * $row5 - $movebyX & " " & $initialY + $movebyY * 6 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 24 AND 28 >= $iCount  Then
$row6 += 1
SendBang("!Move " & $initialX + $movebyX * $row6 - $movebyX & " " & $initialY + $movebyY * 7 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 28 AND 32 >= $iCount  Then
$row7 += 1
SendBang("!Move " & $initialX + $movebyX * $row7 - $movebyX & " " & $initialY + $movebyY * 8 - $movebyY & " " & $Sections[$i])
Else
EndIf

Else
EndIf

If $Variant = "3x3" Then

If $iCount < 4 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 3 AND 6 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 6 AND 9 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 9 AND 12 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 12 AND 15 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row4 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 15 AND 18 >= $iCount  Then
$row5 += 1
SendBang("!Move " & $initialX + $movebyX * $row5 - $movebyX & " " & $initialY + $movebyY * 6 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 18 AND 21 >= $iCount  Then
$row6 += 1
SendBang("!Move " & $initialX + $movebyX * $row6 - $movebyX & " " & $initialY + $movebyY * 7 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 21 AND 24 >= $iCount  Then
$row7 += 1
SendBang("!Move " & $initialX + $movebyX * $row7 - $movebyX & " " & $initialY + $movebyY * 8 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 27 AND 30 >= $iCount  Then
$row8 += 1
SendBang("!Move " & $initialX + $movebyX * $row8 - $movebyX & " " & $initialY + $movebyY * 9 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 30 AND 33 >= $iCount  Then
$row9 += 1
SendBang("!Move " & $initialX + $movebyX * $row9 - $movebyX & " " & $initialY + $movebyY * 10 - $movebyY & " " & $Sections[$i])
Else
EndIf

Else
EndIf

If $Variant = "5x5" Then

If $iCount < 6 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 5 AND 10 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 10 AND 15 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 15 AND 20 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 20 AND 25 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row4 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 25 AND 30 >= $iCount  Then
$row5 += 1
SendBang("!Move " & $initialX + $movebyX * $row5 - $movebyX & " " & $initialY + $movebyY * 6 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 25 AND 30 >= $iCount  Then
$row6 += 1
SendBang("!Move " & $initialX + $movebyX * $row6 - $movebyX & " " & $initialY + $movebyY * 7 - $movebyY & " " & $Sections[$i])
Else
EndIf

Else
EndIf


If $Variant = "6x6" Then

If $iCount < 7 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 6 AND 12 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 12 AND 18 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 18 AND 24 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 24 AND 30 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 30 AND 36 >= $iCount  Then
$row5 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 6 - $movebyY & " " & $Sections[$i])

Else
EndIf

Else
EndIf

If $Variant = "7x7" Then

If $iCount < 8 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 7 AND 14 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 14 AND 21 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 21 AND 28 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 28 AND 35 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])

Else
EndIf

Else
EndIf

If $Variant = "8x8" Then

If $iCount < 9 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 8 AND 16 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 16 AND 24 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 24 AND 32 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 32 AND 40 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])

Else
EndIf

Else
EndIf

If $Variant = "9x9" Then

If $iCount < 10 Then
SendBang("!Move " & $initialX + $movebyX * $iCount - $movebyX & " " & $initialY + $movebyY - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 9 AND 18 >= $iCount  Then
$row1 += 1
SendBang("!Move " & $initialX + $movebyX * $row1 - $movebyX & " " & $initialY + $movebyY * 2 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 18 AND 27 >= $iCount  Then
$row2 += 1
SendBang("!Move " & $initialX + $movebyX * $row2 - $movebyX & " " & $initialY + $movebyY * 3 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 27 AND 36 >= $iCount  Then
$row3 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 4 - $movebyY & " " & $Sections[$i])
ElseIf $iCount >= 36 AND 45 >= $iCount  Then
$row4 += 1
SendBang("!Move " & $initialX + $movebyX * $row3 - $movebyX & " " & $initialY + $movebyY * 5 - $movebyY & " " & $Sections[$i])

Else
EndIf

Else
EndIf



 ; MsgBox($MB_SYSTEMMODAL, "Title", $iCount & " " & $Sections[$i], 1)

	;SendBang("!Move 100 " & "10R" & " " & $Sections[$i])


				;GUICtrlSetData($PanelList, StringRegExpReplace($Sections[$i], "WP7\\(Installed|Donator)?Panels\\", ""))
			;	$Panels[$NumPanels] = $Sections[$i]
				;$NumPanels += 1
			EndIf
		EndIf
	Next
 EndFunc


Func Missing()

   Const $skinpath    = $CmdLine[2]
   Const $uservars = $skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc"


IniWrite ( $uservars, "Variables", "MissingComponents", "!DeactivateConfig" )
IniWrite ( $uservars, "Variables", "EditManually", "0" )
 EndFunc





Func DarkWithPanels()
   Const $skinpath    = $CmdLine[2]
 Const $uservars = $skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc"
 Const $colorvars = $skinpath & "WP7\@Resources\Common\Color\color.inc"

IniWrite ( $colorvars, "Variables", "colorskin", "30,30,30" )
IniWrite ( $colorvars, "Variables", "colorskin2", "50,50,50" )
IniWrite ( $colorvars, "Variables", "textcolor2", "255,255,255" )
IniWrite ( $uservars, "Variables", "DarkMode", "1" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Dark" )


IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0x000000" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0x323232" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0xE6E6E6" )

Run('"' & $CmdLine[3] & 'Rainmeter.exe" [!Refresh *]')


 EndFunc

 Func LightWithPanels()

   Const $skinpath    = $CmdLine[2]
 Const $uservars = $skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc"
 Const $colorvars = $skinpath & "WP7\@Resources\Common\Color\color.inc"

IniWrite ( $colorvars, "Variables", "colorskin", "230,230,230" )
IniWrite ( $colorvars, "Variables", "colorskin2", "250,250,250" )
IniWrite ( $colorvars, "Variables", "textcolor2", "30,30,30" )
IniWrite ( $uservars, "Variables", "DarkMode", "0" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Light" )

IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0xffffff" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0xd2d2d2" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0x323232" )

Run('"' & $CmdLine[3] & 'Rainmeter.exe" [!Refresh *]')


 EndFunc


Func Dark()
   Const $skinpath    = $CmdLine[2]
 Const $uservars = $skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc"


IniWrite ( $uservars, "Variables", "DarkMode", "1" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Dark" )


IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0x000000" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0x323232" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0xE6E6E6" )


Run('"' & $CmdLine[3] & 'Rainmeter.exe" [!Refresh *]')



 EndFunc

 Func Light()

   Const $skinpath    = $CmdLine[2]
 Const $uservars = $skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc"



IniWrite ( $uservars, "Variables", "DarkMode", "0" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Light" )

IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0xffffff" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0xd2d2d2" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0x323232" )

Run('"' & $CmdLine[3] & 'Rainmeter.exe" [!Refresh *]')



 EndFunc




Func _SavehBitmapEx($hBitmap, $sFileName, $iWidth, $iHeight)
	$bitmap = _GDIPlus_BitmapCreateFromHBITMAP($hbitmap)
	$graphics = _GDIPlus_ImageGetGraphicsContext($bitmap)
	$resizedbitmap = _GDIPlus_BitmapCreateFromGraphics($iWidth ,$iHeight, $graphics)
	$graphics2 = _GDIPlus_ImageGetGraphicsContext($resizedbitmap)
	_GDIPlus_GraphicsDrawImageRect($graphics2, $bitmap, 0, 0, $iWidth, $iHeight)
	_GDIPlus_ImageSaveToFile($resizedbitmap, $sFileName)
	_GDIPlus_GraphicsDispose($graphics)
	_GDIPlus_GraphicsDispose($graphics2)
	_GDIPlus_BitmapDispose($bitmap)
	_GDIPlus_BitmapDispose($resizedbitmap)
	_WinAPI_DeleteObject($hBitmap)
 EndFunc


