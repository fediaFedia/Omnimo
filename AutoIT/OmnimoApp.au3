#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_outfile=..\WP7\Common\OmnimoApp.exe
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2011
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <WinAPI.au3>
#include <GDIPlus.au3>
#include <Constants.au3>
#include <ScreenCapture.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <File.au3>

; Hide Tray Icon
Opt("TrayIconHide", 1)

; �Torrent
; Command line arguments:
; [2]: username
; [3]: password
; [4]: action
; [5]: hash
If $CmdLine[1] == 'uTorrent' Then
	InetRead('http://' & $CmdLine[2] & ':' & $CmdLine[3] & '@127.0.0.1:8080/gui/?action=' & $CmdLine[4] & '&hash=' & $CmdLine[5], 1 + 16)

	
; Power Plan
; Command line arguments:
; [2] Power mode
ElseIf $CmdLine[1] == 'PowerPlan' Then
	If $CmdLine[2] == 'HighPerformance' Then
		Run('powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c', "", @SW_HIDE)
	ElseIf $CmdLine[2] == 'Balanced' Then
		Run('powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e', "", @SW_HIDE)
	ElseIf $CmdLine[2] == 'PowerSaver' Then
		Run('powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a ', "", @SW_HIDE)
	EndIf

	
; Set display brightness
; http://www.autoitscript.com/forum/topic/127668-tinybrightnesscontroler-v-1002/
; Command line arguments:
; [2] Brightness level
ElseIf $CmdLine[1] == 'SetBrightness' Then
	$tagDISPLAY_BRIGHTNESS = "ubyte ucDisplayPolicy;ubyte ucACBrightness;ubyte ucDCBrightness"
	Global Const $IOCTL_VIDEO_QUERY_DISPLAY_BRIGHTNESS = Int(0x00230498)
	Global Const $IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS = Int(0x0023049C)
	Global Const $IOCTL_VIDEO_QUERY_SUPPORTED_BRIGHTNESS = Int(0x00230494)
	Global Const $hLCD = _WinAPI_CreateFile("\\.\LCD", 3, 2, 7)
	; Second argument is 100 to set the display brightness only for battery power
	_SetDisplayBrightness($CmdLine[2], 100)

	
; Change skin
; Command line arguments:
; [2] Skin
; [3] Skin path
; [4] Program path
ElseIf $CmdLine[1] == 'Skin' Then
	FileCopy($CmdLine[3] & '\WP7\Common\Color\' & $CmdLine[2] & '.inc', $CmdLine[3] & '\WP7\Common\Color\color.inc', 1)
	ShellExecute($CmdLine[4] & "Rainmeter.exe", "!RainmeterRefresh *")

	
; Change language
; Command line arguments:
; [2] Language
; [3] Skin path
ElseIf $CmdLine[1] == 'Lang' Then
	FileCopy($CmdLine[3] & '\WP7\Common\Variables\Languages\' & $CmdLine[2] & '.inc', $CmdLine[3] & '\WP7\Common\Variables\Languages\lang.inc', 1)

	
; Change wallpaper
; Command line arguments:
; [2] Wallpaper
ElseIf $CmdLine[1] == 'Wall' Then
	_SetWallpaper($CmdLine[2])

	
; Change tray icon
; Command line arguments:
; [2] Tray icon
; [3] Program path
; [4] Settings path
; [5] Skins path
ElseIf $CmdLine[1] == 'Tray' Then
	; Delete previous entry from rainmeter.ini
	IniDelete($CmdLine[4] & '\Rainmeter.ini', 'TrayMeasure')
	$TrayFile = FileOpen($CmdLine[5] & '\WP7\Gallery\Tray\' & $CmdLine[2] & '.txt')
	$Lines = FileRead($TrayFile)
	FileClose($TrayFile)
	$RainmeterINI = FileOpen($CmdLine[4] & 'Rainmeter.ini', 1)
	FileWrite($RainmeterINI, $Lines)
	FileClose($RainmeterINI)
	; Restart Rainmeter
	ShellExecute($CmdLine[3] & "Rainmeter.exe", "!RainmeterQuit")
	ProcessWaitClose("Rainmeter.exe")
	ShellExecute($CmdLine[3] & "Rainmeter.exe")

	
; Change theme
; Command line arguments:
; [2] Theme
; [3] Program path
; [4] Settings path
; [5] Skins path
ElseIf $CmdLine[1] == 'Themes' Then
	; Close Rainmeter
	ShellExecute($CmdLine[3] & "Rainmeter.exe", "!RainmeterQuit")
	ProcessWaitClose("Rainmeter.exe")
	; Replace Rainmeter.ini with new theme
	FileCopy($CmdLine[5] & '\WP7\Gallery\Themes\' & $CmdLine[2] & '.thm', $CmdLine[4] & '\Rainmeter.ini', 1)
	ShellExecute($CmdLine[3] & "Rainmeter.exe")

	
; Put stuff to clipboard
; Command line arguments:
; [2] Text
ElseIf $CmdLine[1] == 'Clipboard' Then
	ClipPut($CmdLine[2])

	
; Toggle desktop icons
ElseIf $CmdLine[1] == 'ToggleIcons' Then
	$hParent = WinGetHandle("Program Manager")
	$hListView = ControlGetHandle($hParent, "", "SysListView321")
	$state = WinGetState($hListView)
	; If state is 7 then desktop icons are shown
	If $state == '7' Then
		WinSetState($hListView, '', @SW_HIDE)
	; If state is 5 then desktop icons are hidden
	ElseIf $state == '5' Then
		WinSetState($hListView, '', @SW_SHOW)
	EndIf
	
	; HACK!!! The numbers aren't always 5 and 7 on some systems so this might be buggy

	
; Set variable in color.inc
; Command line arguments:
; [2] Variable
; [3] Color
; [4] Skins path
; [5] Program path
ElseIf $CmdLine[1] == 'SetColor' Then
	$nColor = $CmdLine[3]
	; Convert HEX to RGB
	$Blue = BitAND($nColor, 0xFF)
	$Green = BitAND(BitShift($nColor, 8), 0xFF)
	$Red = BitAND(BitShift($nColor, 16), 0xFF)
	IniWrite($CmdLine[4] & '\WP7\Common\Color\Color.inc', 'Variables', $CmdLine[2], $Red & ',' & $Green & ',' & $Blue)
	ShellExecute($CmdLine[5] & "Rainmeter.exe", "!RainmeterRefresh *")

	
; VLC radio
; Command line arguments:
; [2] VLC path
; [3] Channel
ElseIf $CmdLine[1] == 'Radio' Then
	; Restart VLC with the new channel
	ProcessClose("vlc.exe")
	ProcessWaitClose("vlc.exe")
	ShellExecute($CmdLine[2], '-I=dummy ' & '"' & $CmdLine[3] & '"')

	
; Power buttons
; Command line arguments:
; [2] Command
; [3] Time to sleep
; [4] Program path
ElseIf $CmdLine[1] == 'Power' Then
	; Shutdown
	If $CmdLine[2] == 'Shutdown' Then
		Sleep(Int($CmdLine[3]) * 1000)
		ShellExecute($CmdLine[4] & "Rainmeter.exe", "!RainmeterDeactivateConfig WP7\TextItems\Extra\PowerButtons\Dialogue")
		Run('shutdown.exe /s /t 00', "", @SW_HIDE)
	; Restart
	ElseIf $CmdLine[2] == 'Restart' Then
		Sleep(Int($CmdLine[3]) * 1000)
		ShellExecute($CmdLine[4] & "Rainmeter.exe", "!RainmeterDeactivateConfig WP7\TextItems\Extra\PowerButtons\Dialogue")
		Run('shutdown.exe /r /t 00', "", @SW_HIDE)
	; Log off
	ElseIf $CmdLine[2] == 'Logoff' Then
		Sleep(Int($CmdLine[3]) * 1000)
		ShellExecute($CmdLine[4] & "Rainmeter.exe", "!RainmeterDeactivateConfig WP7\TextItems\Extra\PowerButtons\Dialogue")
		Run('shutdown.exe /l', "", @SW_HIDE)
	; Sleep
	ElseIf $CmdLine[2] == 'Sleep' Then
		Sleep(Int($CmdLine[3]) * 1000)
		ShellExecute($CmdLine[4] & "Rainmeter.exe", "!RainmeterDeactivateConfig WP7\TextItems\Extra\PowerButtons\Dialogue")
		Run('rundll32.exe powrprof.dll,SetSuspendState 0,1,0', "", @SW_HIDE)
	; Hibernate
	ElseIf $CmdLine[2] == 'Hibernate' Then
		Sleep(Int($CmdLine[3]) * 1000)
		ShellExecute($CmdLine[4] & "Rainmeter.exe", "!RainmeterDeactivateConfig WP7\TextItems\Extra\PowerButtons\Dialogue")
		Run('rundll32.exe PowrProf.dll,SetSuspendState', "", @SW_HIDE)
	EndIf

	
; Windows Update
; Command line arguments:
; [2] Program path
; [3] Skins path
ElseIf $CmdLine[1] == 'Update' Then
	; Hideous hack to run the Windows Update wbs file to actually check for updates...
	$path = $CmdLine[3] & "\WP7\InstalledPanels\WindowsUpdate\"
	RunWait(@ComSpec & " /c " & "cscript " & $path & "wupdate.vbs > " & $path & "output.txt", "", @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	$file = FileOpen($path & "output.txt", 0)
	$line = FileReadLine($file, -1)
	If $line = '' Or $line = '\n' Then
		$line = FileReadLine($file, -2)
	EndIf
	FileClose($file)
	
	; Refresh panel
	ShellExecute($CmdLine[2] & "\Rainmeter.exe", "!RainmeterSetVariable Updates " & $line & " WP7\InstalledPanels\WindowsUpdate")
	ShellExecute($CmdLine[2] & "\Rainmeter.exe", "!RainmeterUpdate WP7\InstalledPanels\WindowsUpdate")

	
; Take a screenshot
; Command line arguments:
; [2] Skins path
ElseIf $CmdLine[1] == 'Screenshot' Then
	$config = $CmdLine[2] & '\WP7\Panels\Camera\UserVariables.inc'
	
	; Read variables
	$Delay = IniRead($config, 'Variables', 'Delay', '0')
	$CaptureCursor = IniRead($config, 'Variables', 'CaptureCursor', 'False')
	$FileFormat = IniRead($config, 'Variables', 'FileFormat', 'jpg')
	$OpenImageAfter = IniRead($config, 'Variables', 'OpenImageAfter', 'True')
	$SaveTo = IniRead($config, 'Variables', 'SaveTo', @UserProfileDir & '\Pictures')
	$SaveTo = StringReplace($SaveTo, '%USERPROFILE%', @UserProfileDir)
	Sleep(Int($Delay) * 1000)
	
	If $CaptureCursor == 'False' Then
		_ScreenCapture_Capture($SaveTo & '\' & @MDAY & '-' & @MON & '-' & @YEAR & '_' & @HOUR & '-' & @MIN & '.' & $FileFormat, Default, Default, @DesktopWidth, @DesktopHeight, False)
	Else
		_ScreenCapture_Capture($SaveTo & '\' & @MDAY & '-' & @MON & '-' & @YEAR & '_' & @HOUR & '-' & @MIN & '.' & $FileFormat, Default, Default, @DesktopWidth, @DesktopHeight, True)
	EndIf
	If $OpenImageAfter == 'True' Then
		ShellExecute($SaveTo & '\' & @MDAY & '-' & @MON & '-' & @YEAR & '_' & @HOUR & '-' & @MIN & '.' & $FileFormat)
	EndIf

	
; File / Folder selector
; Command line arguments:
; [2] Image / Folder / App
; [3] Variable to write
; [4] Panel path
; [5] Program path
ElseIf $CmdLine[1] == 'Select' Then
	; Open an image select dialog
	If $CmdLine[2] == 'Image' Then
		$file = FileOpenDialog("Choose an image", @UserProfileDir & '\Pictures', "Images (*.png;*.jpg;*.jpeg;*.bmp)", 1)
		If @error Then ; Something awful just happened
			Exit
		EndIf
		IniWrite($CmdLine[4] & "\UserVariables.inc", "Variables", $CmdLine[3], $file)
		ShellExecute($CmdLine[5] & "Rainmeter.exe", "!RainmeterRefresh " & $CmdLine[6])

	; Open a folder select dialog
	ElseIf $CmdLine[2] == 'Folder' Then
		$folder = FileSelectFolder("Choose a folder", "", 1)
		If @error Then ; Something awful just happened
			Exit
		EndIf
		$split = StringSplit($folder, "\")
		$FolderName = UBound($split) - 1
		IniWrite($CmdLine[4] & "\UserVariables.inc", "Variables", $CmdLine[3], $folder)
		IniWrite($CmdLine[4] & "\UserVariables.inc", "Variables", "FolderName", $split[$FolderName])
		ShellExecute($CmdLine[5] & "Rainmeter.exe", "!RainmeterRefresh " & $CmdLine[6])

	; Open an app select dialog
	ElseIf $CmdLine[2] == 'App' Then
		$file = FileOpenDialog("Choose an application", @DesktopDir, "Apps (*.exe;*.lnk)", 1)
		If @error Then ; Something awful just happened
			Exit
		EndIf
		
		; Get file extension, amazingly bullet-proof method
		$ext = StringRight($file, 3)
		If $ext = 'exe' Then
			$info = FileGetVersion($file, "ProductName")  ; Get program's name
			$path = $file
		ElseIf $ext = 'lnk' Then
			Dim $szDrive, $szDir, $szFName, $szExt
			$TestPath = _PathSplit($file, $szDrive, $szDir, $szFName, $szExt)
			$Shortcut = FileGetShortcut($file)
			$path = $Shortcut[0]
			$info = $TestPath[3]
		EndIf
		IniWrite($CmdLine[7] & "\UserVariables.inc", "Variables", $CmdLine[3], $path)
		IniWrite($CmdLine[7] & "\UserVariables.inc", "Variables", $CmdLine[4], $info)
		
		; Open an icon select dialog
		$icon = FileOpenDialog("Choose an icon", $CmdLine[6] & '\WP7\Panels\Launcher\Icons', "Images (*.png;*.jpg;*.jpeg;*.bmp)", 1)
		
		If @error Then ; Something awful just happened
			Exit
		EndIf
		
		IniWrite($CmdLine[7] & "\UserVariables.inc", "Variables", $CmdLine[5], $icon)
		ShellExecute($CmdLine[9] & "Rainmeter.exe", "!RainmeterRefresh " & $CmdLine[8])
	EndIf

	
; Panel Combos config tool
; Command line arguments:
; [2] Skins path
ElseIf $CmdLine[1] == 'PanelCombos' Then
	; Create GUI
	$Form1_1 = GUICreate("", 208, 316, -1, -1, BitOR($WS_VISIBLE, $WS_SYSMENU), $WS_EX_TOOLWINDOW)
	GUISetBkColor(0xE1E1E1)

	; Options
	$Checkbox1 = GUICtrlCreateCheckbox("Bing", 8, 8, 73, 17)
	$Checkbox2 = GUICtrlCreateCheckbox("Reader", 8, 32, 73, 17)
	$Checkbox3 = GUICtrlCreateCheckbox("Reader2", 8, 56, 81, 17)
	$Checkbox4 = GUICtrlCreateCheckbox("Reader3", 8, 80, 73, 17)
	$Checkbox5 = GUICtrlCreateCheckbox("Launcher", 8, 104, 73, 17)
	$Checkbox6 = GUICtrlCreateCheckbox("Notes", 8, 128, 65, 17)
	$Checkbox7 = GUICtrlCreateCheckbox("Todolist", 8, 152, 89, 17)
	$Checkbox8 = GUICtrlCreateCheckbox("Facebook", 8, 176, 89, 17)
	$Checkbox9 = GUICtrlCreateCheckbox("Sys monitor", 8, 200, 97, 17)
	$Checkbox10 = GUICtrlCreateCheckbox("Gmail", 8, 224, 57, 17)
	$Checkbox11 = GUICtrlCreateCheckbox("Deviantart", 105, 8, 89, 17)
	$Checkbox12 = GUICtrlCreateCheckbox("System info", 105, 32, 89, 17)
	$Checkbox13 = GUICtrlCreateCheckbox("�Torrent", 105, 56, 89, 17)
	$Checkbox14 = GUICtrlCreateCheckbox("Weather", 105, 80, 89, 17)
	$Checkbox15 = GUICtrlCreateCheckbox("Movies", 105, 104, 65, 17)
	$Checkbox16 = GUICtrlCreateCheckbox("NowPlaying", 105, 128, 89, 17)
	$Checkbox17 = GUICtrlCreateCheckbox("World Clock", 105, 152, 89, 17)
	$Checkbox18 = GUICtrlCreateCheckbox("Websites", 105, 176, 81, 17)
	$Checkbox19 = GUICtrlCreateCheckbox("Youtube", 105, 200, 81, 17)
	$Checkbox20 = GUICtrlCreateCheckbox("Flickr", 105, 224, 57, 17)
	$Button1 = GUICtrlCreateButton("OK", 8, 250, 186, 33)

	$config = $CmdLine[2] & '\WP7\TextItems\'
	GUISetState(@SW_SHOW)

	;I'm an expert on for loops
	For $k = 1 To 7
		Assign("toggle" & $k, IniRead($config & 'UserVariables.inc', 'Variables', 'Toggle' & $k, ''), 2)
		Check_Enabled(Eval("toggle" & $k))
	Next
	Check_Disable()

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			;Seriously, someone shoot this guy
			Case $Checkbox1
				Check_Disable()
			Case $Checkbox2
				Check_Disable()
			Case $Checkbox3
				Check_Disable()
			Case $Checkbox4
				Check_Disable()
			Case $Checkbox5
				Check_Disable()
			Case $Checkbox6
				Check_Disable()
			Case $Checkbox7
				Check_Disable()
			Case $Checkbox8
				Check_Disable()
			Case $Checkbox9
				Check_Disable()
			Case $Checkbox10
				Check_Disable()
			Case $Checkbox11
				Check_Disable()
			Case $Checkbox12
				Check_Disable()
			Case $Checkbox13
				Check_Disable()
			Case $Checkbox14
				Check_Disable()
			Case $Checkbox15
				Check_Disable()
			Case $Checkbox16
				Check_Disable()
			Case $Checkbox17
				Check_Disable()
			Case $Checkbox18
				Check_Disable()
			Case $Checkbox19
				Check_Disable()
			Case $Checkbox20
				Check_Disable()
			Case $Button1
				$count = 0
				;Oh god, please make it stop
				If GUICtrlRead($Checkbox1) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Bing")
				EndIf
				If GUICtrlRead($Checkbox2) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Reader")
				EndIf
				If GUICtrlRead($Checkbox3) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Reader2")
				EndIf
				If GUICtrlRead($Checkbox4) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Reader3")
				EndIf
				If GUICtrlRead($Checkbox5) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Launcher")
				EndIf
				If GUICtrlRead($Checkbox6) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Notes")
				EndIf
				If GUICtrlRead($Checkbox7) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Todolist")
				EndIf
				If GUICtrlRead($Checkbox8) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Facebook")
				EndIf
				If GUICtrlRead($Checkbox9) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "System")
				EndIf
				If GUICtrlRead($Checkbox10) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Gmail")
				EndIf
				If GUICtrlRead($Checkbox11) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Deviantart")
				EndIf
				If GUICtrlRead($Checkbox12) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "SystemInfo")
				EndIf
				If GUICtrlRead($Checkbox13) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "uTorrent")
				EndIf
				If GUICtrlRead($Checkbox14) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Weather")
				EndIf
				If GUICtrlRead($Checkbox15) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Movies")
				EndIf
				If GUICtrlRead($Checkbox16) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "NowPlaying")
				EndIf
				If GUICtrlRead($Checkbox17) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "WorldClock")
				EndIf
				If GUICtrlRead($Checkbox18) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Websites")
				EndIf
				If GUICtrlRead($Checkbox19) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Youtube")
				EndIf
				If GUICtrlRead($Checkbox20) = 1 Then
					$count = $count + 1
					IniWrite($config & 'UserVariables.inc', 'Variables', 'Toggle' & $count, "Flickr")
				EndIf
				ShellExecute($CmdLine[3] & "Rainmeter.exe", "!RainmeterRefresh WP7\TextItems")
				Exit
		EndSwitch

	WEnd
EndIf

Func Check_Enabled($Toggle)
	Switch $Toggle
		Case "Bing"
			GUICtrlSetState($Checkbox1, $GUI_CHECKED)
		Case "Reader"
			GUICtrlSetState($Checkbox2, $GUI_CHECKED)
		Case "Reader2"
			GUICtrlSetState($Checkbox3, $GUI_CHECKED)
		Case "Reader3"
			GUICtrlSetState($Checkbox4, $GUI_CHECKED)
		Case "Launcher"
			GUICtrlSetState($Checkbox5, $GUI_CHECKED)
		Case "Notes"
			GUICtrlSetState($Checkbox6, $GUI_CHECKED)
		Case "Todolist"
			GUICtrlSetState($Checkbox7, $GUI_CHECKED)
		Case "Facebook"
			GUICtrlSetState($Checkbox8, $GUI_CHECKED)
		Case "System"
			GUICtrlSetState($Checkbox9, $GUI_CHECKED)
		Case "Gmail"
			GUICtrlSetState($Checkbox10, $GUI_CHECKED)
		Case "Deviantart"
			GUICtrlSetState($Checkbox11, $GUI_CHECKED)
		Case "SystemInfo"
			GUICtrlSetState($Checkbox12, $GUI_CHECKED)
		Case "uTorrent"
			GUICtrlSetState($Checkbox13, $GUI_CHECKED)
		Case "Weather"
			GUICtrlSetState($Checkbox14, $GUI_CHECKED)
		Case "Movies"
			GUICtrlSetState($Checkbox15, $GUI_CHECKED)
		Case "NowPlaying"
			GUICtrlSetState($Checkbox16, $GUI_CHECKED)
		Case "WorldClock"
			GUICtrlSetState($Checkbox17, $GUI_CHECKED)
		Case "Websites"
			GUICtrlSetState($Checkbox18, $GUI_CHECKED)
		Case "Youtube"
			GUICtrlSetState($Checkbox19, $GUI_CHECKED)
		Case "Flickr"
			GUICtrlSetState($Checkbox20, $GUI_CHECKED)
	EndSwitch
EndFunc   ;==>Check_Enabled

Func Check_Disable()
	$count = 0
	; Such beautiful code
	For $m = 1 To 20
		If GUICtrlRead(Eval("Checkbox" & $m)) = 1 Then
			$count = $count + 1
		EndIf
	Next
	If $count > 6 Then
		; Yeah, I'm gonna go stab myself in the eye with a fork now
		For $i = 1 To 20
			If GUICtrlRead(Eval("Checkbox" & $i)) <> 1 Then
				GUICtrlSetState(Eval("Checkbox" & $i), $GUI_DISABLE)
			EndIf
		Next
	Else
		; Don't look at me I'm dead
		For $j = 1 To 20
			GUICtrlSetState(Eval("Checkbox" & $j), $GUI_ENABLE)
		Next
	EndIf

EndFunc   ;==>Check_Disable

Func _SetDisplayBrightness($ac = -1, $dc = -1)
	$DISPLAY_BRIGHTNESS = DllStructCreate($tagDISPLAY_BRIGHTNESS)
	Local $policy = 0
	If $ac > -1 Then
		$policy += 1
		DllStructSetData($DISPLAY_BRIGHTNESS, "ucACBrightness", $ac)
	EndIf
	If $dc > -1 Then
		$policy += 2
		DllStructSetData($DISPLAY_BRIGHTNESS, "ucDCBrightness", $dc)
	EndIf
	DllStructSetData($DISPLAY_BRIGHTNESS, "ucDisplayPolicy", $policy)
	$ret = DllCall( _
			"kernel32.dll", "int", _
			"DeviceIoControl", _
			"hwnd", $hLCD, _
			"int", $IOCTL_VIDEO_SET_DISPLAY_BRIGHTNESS, _
			"ptr", DllStructGetPtr($DISPLAY_BRIGHTNESS), _
			"int", DllStructGetSize($DISPLAY_BRIGHTNESS), _
			"ptr", 0, _
			"int", 0, _
			"int*", 0, _
			"ptr", 0)
	Return SetError(@error, 0, $ret[0])
EndFunc   ;==>_SetDisplayBrightness

Func _SetWallpaper($CurrentFile)
	_GDIPlus_Startup()
	$hImage = _GDIPlus_ImageLoadFromFile($CurrentFile)
	$sCLSID = _GDIPlus_EncodersGetCLSID("BMP")
	_GDIPlus_ImageSaveToFileEx($hImage, @TempDir & "\999.bmp", $sCLSID)
	_GDIPlus_Shutdown()
	$CurrentFile = @TempDir & "\999.bmp"
	RegWrite('HKCU\Control Panel\Desktop', 'Wallpaper', 'reg_sz', $CurrentFile)
	DllCall("user32", "int", "SystemParametersInfo", "int", 20, "int", 0, "str", $CurrentFile, "int", 0)
EndFunc   ;==>_SetWallpaper

Func _ImageResize($sInImage, $sOutImage, $iW, $iH)
	Local $hWnd, $hDC, $hBMP, $hImage1, $hImage2, $hGraphic, $CLSID, $i = 0
	$hWnd = _WinAPI_GetDesktopWindow()
	$hDC = _WinAPI_GetDC($hWnd)
	$hBMP = _WinAPI_CreateCompatibleBitmap($hDC, $iW, $iH)
	_WinAPI_ReleaseDC($hWnd, $hDC)
	_GDIPlus_Startup()
	$hImage1 = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)
	$hImage2 = _GDIPlus_ImageLoadFromFile($sInImage)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 0, 0, $iW, $iH)
	$CLSID = _GDIPlus_EncodersGetCLSID("PNG")
	_GDIPlus_ImageSaveToFileEx($hImage1, $sOutImage, $CLSID)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMP)
	_GDIPlus_Shutdown()
EndFunc   ;==>_ImageResize