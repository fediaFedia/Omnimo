#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icons\Omnimo.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\Settings\Omnimo.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Toggler
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7 -w 8
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Date.au3>
#include <Constants.au3>
#include <Inet.au3>
#include <String.au3>
#include <Misc.au3>
#Include <WinAPI.au3>
#include <File.au3>
#include <IE.au3>
#include <GUIConstants.au3>
#Include <WindowsConstants.au3>

#include "Includes\Common.au3"
#include "Includes\_Startup.au3"

; Restrict to single instance only
_Singleton("Omnimo")

Opt("TrayOnEventMode", 1)
Opt("TrayMenuMode", 3)

$Hidden = False
Const $SettingsVariables = @ScriptDir  & "\UserVariables.inc"
Const $CurrentLanguage = IniRead($SettingsVariables, "Variables", "Language", "English")
Const $HideIcons = Int(IniRead($SettingsVariables, "Variables", "Icons", "0"))
Const $Hotkey = IniRead($SettingsVariables, "Variables", "Hotkey", "F8")
Const $UpdateURL = IniRead($SettingsVariables, "Variables", "UpdateURL", "http://fediafedia.com/update.dt")
Const $RainmeterPath = IniRead($SettingsVariables, "Variables", "RainmeterPath", "") & "\Rainmeter.exe"
Const $OmnimoTray = Int(IniRead($SettingsVariables, "Variables", "OmnimoTray", "0"))
Const $LangFile = @ScriptDir & "\Language\" & $CurrentLanguage & ".cfg"

If $CmdLine[0] > 0 And $CmdLine[1] = "-firstrun" Then
	Const $OmnimoFolder = @StartMenuDir & "\Programs\Omnimo UI"
	If DirCreate($OmnimoFolder) = 0 Then
		OmnimoError("Error", "Unable to create programs folder for Omnimo")
	EndIf

	FileCreateShortcut(@ScriptDir & "\omnimo.exe", $OmnimoFolder & "\Launch Omnimo.lnk", Default, Default, "Launch Omnimo", @ScriptDir & "\Icons\Omnimo.ico")
	FileCreateShortcut("http://omnimo.info", $OmnimoFolder & "\Official Website.lnk", Default, Default, "Official Omnimo Website", @ScriptDir & "\Icons\favicon.ico")
	FileCreateShortcut(@ScriptDir & "\..\..\..\readme.txt", $OmnimoFolder & "\Readme.lnk", Default, Default, "Omnimo ReadMe", @ScriptDir & "\Icons\readme.ico")
	FileCreateShortcut(@ScriptDir & "\settings.exe", $OmnimoFolder & "\Settings.lnk", Default, Default, "Omnimo Settings", @ScriptDir & "\Icons\Settings.ico")
	FileCreateShortcut(@ScriptDir & "\omnimo.exe", $OmnimoFolder & "\Uninstall.lnk", Default, "-uninstall", "Uninstall Omnimo", @ScriptDir & "\Icons\uninstall.ico")

	Hub()
EndIf

If $CmdLine[0] > 0 And $CmdLine[1] = "-uninstall" Then
	If MsgBox(52, "Uninstall Omnimo UI", "Are you sure you want to remove Omnimo UI?") = 7 Then Exit
	DirRemove(@StartMenuDir & "\Programs\Omnimo UI", 1)
	Const $Uninstaller = @TempDir & "\~OmnimoUninstallTmp.exe"
	FileCopy(@ScriptDir & "\uninstall.exe", $Uninstaller, 1)
	ShellExecute($Uninstaller, '"' & _PathFull(@ScriptDir & "\..\..\..\") & '"')
	Exit
EndIf

; Launch Rainmeter if it's not running
If Not ProcessExists("rainmeter.exe") And FileExists($RainmeterPath) Then
	Run($RainmeterPath)
EndIf

If Not $OmnimoTray Then Exit
If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

If $Hotkey <> "None" Then HotKeySet("{" & $Hotkey & "}", "ToggleOmnimo")
If $HideIcons Then ShowIcons(False)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$Sections = IniReadSection($LangFile, "Variables")
For $i = 1 To $Sections[0][0]
	$Language.Add($Sections[$i][0], $Sections[$i][1])
Next

;
; Tray context menu
;

Const $Shortcuts = TrayCreateMenu($Language.Item("Shortcuts"))
Const $System = TrayCreateMenu($Language.Item("System"))
Const $Info = TrayCreateMenu($Language.Item("Information"))
Const $Shutdown = TrayCreateMenu($Language.Item("ShutDown"))
Const $Omnimo = TrayCreateMenu("Omnimo")

; Shortcuts menu

TrayCreateItem($Language.Item("Computer"), $Shortcuts)
TrayItemSetOnEvent(-1, "MyComputer")
TrayCreateItem($Language.Item("User"), $Shortcuts)
TrayItemSetOnEvent(-1, "User")
TrayCreateItem($Language.Item("Desktop"), $Shortcuts)
TrayItemSetOnEvent(-1, "Desktop")
TrayCreateItem($Language.Item("Documents"), $Shortcuts)
TrayItemSetOnEvent(-1, "Documents")
TrayCreateItem($Language.Item("Pictures"), $Shortcuts)
TrayItemSetOnEvent(-1, "Pictures")
TrayCreateItem($Language.Item("Downloads"), $Shortcuts)
TrayItemSetOnEvent(-1, "Downloads")

; System menu

TrayCreateItem($Language.Item("ControlPanel"), $System)
TrayItemSetOnEvent(-1, "ControlPanel")
TrayCreateItem($Language.Item("TaskManager"), $System)
TrayItemSetOnEvent(-1, "TaskManager")
TrayCreateItem($Language.Item("CommandPrompt"), $System)
TrayItemSetOnEvent(-1, "CMD")
TrayCreateItem($Language.Item("ClearClipboard"), $System)
TrayItemSetOnEvent(-1, "ClearClipboard")
TrayCreateItem($Language.Item("EmptyBin"), $System)
TrayItemSetOnEvent(-1, "EmptyRecycleBin")
TrayCreateItem($Language.Item("PingGoogle"), $System)
TrayItemSetOnEvent(-1, "PingGoogle")
TrayCreateItem($Language.Item("MonitorOff"), $System)
TrayItemSetOnEvent(-1, "MonitorOff")
TrayCreateItem($Language.Item("Screensaver"), $System)
TrayItemSetOnEvent(-1, "Screensaver")
TrayCreateItem($Language.Item("Eject"), $System)
TrayItemSetOnEvent(-1, "Eject")

; Information menu

TrayCreateItem($Language.Item("OSInfo"), $Info)
TrayItemSetOnEvent(-1, "OSInfo")
TrayCreateItem($Language.Item("Memory"), $Info)
TrayItemSetOnEvent(-1, "MemoryStats")
TrayCreateItem($Language.Item("DiskSpace"), $Info)
TrayItemSetOnEvent(-1, "DiskSpace")
TrayCreateItem($Language.Item("Uptime"), $Info)
TrayItemSetOnEvent(-1, "Uptime")
TrayCreateItem($Language.Item("Resolution"), $Info)
TrayItemSetOnEvent(-1, "Resolution")
TrayCreateItem($Language.Item("ExternalIP"), $Info)
TrayItemSetOnEvent(-1, "ExternalIP")

; Show Who am I? and Meaning of life only when language is English
If IniRead($SettingsVariables, "Variables", "Language", "English") = "English" Then
	TrayCreateItem("Who am I?", $Info)
	TrayItemSetOnEvent(-1, "WhoAmI")
	TrayCreateItem("Meaning of life", $Info)
	TrayItemSetOnEvent(-1, "MeaningOfLife")
EndIf

; Shut down menu

TrayCreateItem($Language.Item("Lock"), $Shutdown)
TrayItemSetOnEvent(-1, "Lock")
TrayCreateItem($Language.Item("Sleep"), $Shutdown)
TrayItemSetOnEvent(-1, "SleepF")
TrayCreateItem($Language.Item("LogOff"), $Shutdown)
TrayItemSetOnEvent(-1, "LogOff")
TrayCreateItem($Language.Item("Restart"), $Shutdown)
TrayItemSetOnEvent(-1, "Restart")
TrayCreateItem($Language.Item("ShutDown10"), $Shutdown)
TrayItemSetOnEvent(-1, "ShutdownTimer")
TrayCreateItem($Language.Item("ShutDown"), $Shutdown)
TrayItemSetOnEvent(-1, "ShutdownF")

; Omnimo menu

TrayCreateItem($Language.Item("AddPanels"), $Omnimo)
TrayItemSetOnEvent(-1, "AddPanels")
TrayCreateItem($Language.Item("ChangeStyles"), $Omnimo)
TrayItemSetOnEvent(-1, "ChangeStyles")
TrayCreateItem($Language.Item("ShowToggler"), $Omnimo)
TrayItemSetOnEvent(-1, "ShowToggler")
TrayCreateItem("Omnimo Hub", $Omnimo)
TrayItemSetOnEvent(-1, "Hub")
TrayCreateItem($Language.Item("CheckUpdates"), $Omnimo)
TrayItemSetOnEvent(-1, "CheckForUpdates")
TrayCreateItem($Language.Item("AboutTitle"), $Omnimo)
TrayItemSetOnEvent(-1, "About")

; Main menu

TrayCreateItem($Language.Item("Rainmeter"))
TrayItemSetOnEvent(-1, "RainmeterMenu")
TrayCreateItem($Language.Item("Settings"))
TrayItemSetOnEvent(-1, "OpenSettings")
TrayCreateItem($Language.Item("Exit"))
TrayItemSetOnEvent(-1, "ExitScript")

TraySetToolTip("Omnimo UI")
TraySetOnEvent($TRAY_EVENT_PRIMARYUP, "ToggleOmnimo") ; Toggle omnimo on left-click
TraySetClick(16) ; Show tray menu only on right-click
TraySetState()

While 1
	Sleep(2500)
	If Not ProcessExists("rainmeter.exe") And Not ProcessExists("SkinInstaller.exe") Then
		If $HideIcons Then ShowIcons(True)
		Exit
	EndIf
WEnd

Func ToggleOmnimo()
	$Hidden = Not $Hidden
	If $HideIcons Then ShowIcons($Hidden)
	SendBang("!Toggle *")
	SendBang("!Show WP7 Toggler.ini")
EndFunc

;
; Shortcut functions
;

Func MyComputer()
	Run("explorer.exe /e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}")
EndFunc

Func User()
	Run("explorer.exe " & @UserProfileDir)
EndFunc

Func Desktop()
	Run("explorer.exe " & @DesktopDir)
EndFunc

Func Documents()
	Run("explorer.exe " & @UserProfileDir & "\Documents")
EndFunc

Func Pictures()
	Run("explorer.exe " & @UserProfileDir & "\Pictures")
EndFunc

Func Downloads()
	Run("explorer.exe " & @UserProfileDir & "\Downloads")
EndFunc

;
; System functions
;

Func ControlPanel()
	Run("control panel")
EndFunc

Func TaskManager()
	Run("taskmgr.exe")
EndFunc

Func CMD()
	Run("cmd.exe")
EndFunc

Func ClearClipboard()
	ClipPut("")
	TrayTip($Language.Item("ClipboardTitle"), $Language.Item("ClipboardText"), Default, 1)
EndFunc

Func EmptyRecycleBin()
	FileRecycleEmpty()
	TrayTip($Language.Item("RecycleBinTitle"), $Language.Item("RecycleBinText"), Default, 1)
EndFunc

Func PingGoogle()
	Const $time = Ping("www.google.com")
	If $time Then
		TrayTip($time & " ms", $Language.Item("PingGoogleText"), Default, 1)
	Else
		TrayTip($Language.Item("PingGoogleError"), $Language.Item("PingGoogleErrorText"), Default, 2)
	EndIf
EndFunc

Func MonitorOff()
	Local $WM_SYSCommand = 274
    Local $SC_MonitorPower = 61808
    Local $HWND = WinGetHandle('[CLASS:Progman]')
	DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND, "int", $WM_SYSCommand, "int", $SC_MonitorPower, "int", 2)
EndFunc

Func Eject()
	$drive = DriveGetDrive("CDROM")
	For $i = 1 To $drive[0]
		CDTray($drive[$i], "open")
	Next
	TrayTip($Language.Item("EjectTitle"), $Language.Item("EjectText"), Default, 1)
EndFunc

Func Screensaver()
	Local Const $SPI_GETSCREENSAVEACTIVE = 16
	Local Const $SC_SCREENSAVE = 0xF140

	$Ret = DllCall('user32.dll', 'int', 'SystemParametersInfo', 'uint', $SPI_GETSCREENSAVEACTIVE, 'uint', 0, 'int*', 0, 'uint', 0)
	If $Ret[3] Then
		_SendMessage(_WinAPI_GetDesktopWindow(), $WM_SYSCOMMAND, $SC_SCREENSAVE, 0)
	EndIf
EndFunc

;
; Information functions
;

Func OSInfo()
	TrayTip(@OSVersion & " " & @OSArch, @OSServicePack & ", build " & @OSBuild, Default, 1)
EndFunc

Func MemoryStats()
	Local $mem = MemGetStats()
	TrayTip($mem[0] & "% " & $Language.Item("MemoryTitle"), Int($mem[1] / 1024) & " MB " & $Language.Item("MemoryText"), Default, 1)
EndFunc

Func DiskSpace()
	TrayTip(@HomeDrive, Int(DriveSpaceFree(@HomeDrive & "\") / 1024) & "GB " & $Language.Item("DiskSpaceText"), Default, 1)
EndFunc

Func Uptime()
	$aTSB = DllCall("kernel32.dll", "long", "GetTickCount")
	$ticksSinceBoot = $aTSB[0]
	Local $iHours, $iMins, $iSecs
	_TicksToTime($ticksSinceBoot, $iHours, $iMins, $iSecs)
	$iDays = Int($iHours / 24)
	$iHours = $iHours - ($iDays * 24)
	TrayTip($Language.Item("Uptime"), $iDays & " day(s), " & $iHours & " hour(s), " & $iMins & " minute(s)", Default, 1)
EndFunc

Func Resolution()
	TrayTip(@DesktopWidth & "x" & @DesktopHeight, $Language.Item("ResolutionText"), Default, 1)
EndFunc

Func ExternalIP()
	Const $IP = _GetIP()
	TrayTip($IP, $Language.Item("ExternalIPText"), Default, 1)
	ClipPut($IP)
EndFunc

Func MeaningOfLife()
	Local Const $Answers[25] = [ _
	"42", _
	".*", _
	"ICE CREAM!!!", _
	"to see how Breaking Bad ends", _
	"a 1983 comedy film by Monty Python", _
	"to think about questions like this", _
	"not known for me, but I think there's an app for that", _
	"to find the meaning of life", _
	"to wait for the next version of Omnimo", _
	"to find out whether aliens really are green", _
	"to solve the Riemann hypothesis, so get on it!", _
	"to find out if 'I can't believe it's not butter' really isn't butter", _
	"to find my goddamn pants", _
	"Wait, how am I supposed to know?", _
	"shower beer", _
	"to find out if it's inappropriate to shake your head at a Parkinson's joke", _
	"bears, beets and Battlestar Galactica", _
	"whatever you make of it", _
	"to stop sniffing glue", _
	"to see Justin Bieber live", _
	"Frankly, my dear, I don't give a damn", _
	"to live the wayat?*?????¯??g???e¯?s ?a¸??r?????e re`???a?l~?? IS?^??????_", _
	"to find out what's in the safe", _
	"to figure out whether zebras are white with black stripes or black with white stripes", _
	"Click here to buy a premium membership to see this answer" _
	]

	TrayTip("The meaning of life is...", $Answers[Random(0, 24, 1)], Default, 1)
EndFunc

Func WhoAmI()
	Local Const $Comments[34] = [ _
	"I think you might be my long-lost cousin", _
	"How about I call you Johnny instead?", _
	"I'm pretty sure that rhymes with virtbgnjrveqanzr", _
	"Were you named after the capital of Tanzania?", _
	"Wait, if that's you then who am I?", _
	"I used to play board games with a bucket called " & @UserName, _
	"I swear I saw that name in a list of diseases", _
	"Have some more consonants: l t h r p s x", _
	"What do you call a person with a weird name? See above", _
	"Were you named after an arthropod?", _
	"If you want to know more, try phoning NSA", _
	"Is that some kind of a sick joke?", _
	"Is that pronounced with a z or a double x?", _
	"Are you sure you're not Welsh?", _
	"At least that's what they told me", _
	"That's funny, my dog's cat's zebra is also called " & @UserName, _
	"Why can't all people called " & @UserName & " be special like you?", _
	"That's a type of cheese, right?", _
	"Are you a tree? Because I'm not", _
	"Now, SAY MY NAME", _
	"Do you mind looking up so I can see you better?", _
	"You can call me 00100000 01001001", _
	"That's, like, " & StringLen(@UserName) & " characters long", _
	"How about adding some X's: " & @UserName & "XXX", _
	"http://bit.ly/16eMT1k", _
	"That's the kind of name a Greek god wouldn't have", _
	"How could you not know that?", _
	"Next time I'll teach you how to use the big boy cutlery", _
	"Don't worry, I've heard about better people with worse names", _
	"Fact: people called " & @UserName & " have 700 fewer friends per square metre than normal people", _
	"HEY! That's MY name!", _
	"I'm so sorry.", _
	"That's " & _StringReverse(@UserName) & " backwards!", _
	"I can see why you were called " & @UserName _
	]

	TrayTip(@UserName, $Comments[Random(0, 33, 1)], Default, 1)
EndFunc

;
; Shut down functions
;

Func SleepF()
	Run('rundll32.exe powrprof.dll,SetSuspendState 0,1,0', "", @SW_HIDE)
EndFunc

Func ShutdownF()
	Run('shutdown.exe /s /t 00', "", @SW_HIDE)
EndFunc

Func ShutdownTimer()
	Run('shutdown.exe /s /t 600', "", @SW_HIDE)
EndFunc

Func Restart()
	Run('shutdown.exe /r /t 00', "", @SW_HIDE)
EndFunc

Func LogOff()
	Run('shutdown.exe /l', "", @SW_HIDE)
EndFunc

Func Lock()
	Run('rundll32.exe user32.dll,LockWorkStation', "", @SW_HIDE)
EndFunc

;
; Omnimo functions
;

Func AddPanels()
	SendBang("!ActivateConfig WP7\Gallery gallery.ini")
EndFunc

Func ChangeStyles()
	SendBang("!ActivateConfig WP7\Gallery\Color color.ini")
EndFunc

Func ShowToggler()
	SendBang("!ActivateConfig WP7 Toggler.ini")
	SendBang("!Show WP7 Toggler.ini")
EndFunc

Func CheckForUpdates()
	$sData = BinaryToString(InetRead($UpdateURL, 1))
	If @error Then
		TrayTip("Connection error", "Unable to download update file", Default, 3)
		Return
	EndIf

	$Matches = StringRegExp($sData, "(?s).*<update>(\d)</update>\s<version>(\d\d?\.\d\d?)</version>.*<link>(.*)</link>", 1)
	Const $UpdateAvailable = Int($Matches[0])
	Const $NewVersion = $Matches[1]
	Const $Link = $Matches[2]

	If $UpdateAvailable Then
		Const $UpdateText = StringReplace(StringReplace($Language.Item("UpdateText"), "%s", $NewVersion), "\n", @CRLF)
		$Button = MsgBox(4 + 64, $Language.Item("UpdateTitle"), $UpdateText)
		If $Button = 6 Then ShellExecute($Link)
	Else
		TrayTip($Language.Item("NoUpdateTitle"), $Language.Item("NoUpdateText"), Default, 1)
	EndIf
EndFunc

Func Hub()
	Const $HubURL = IniRead($SettingsVariables, "Variables", "HubURL", "")
	Const $Version = IniRead($SettingsVariables, "Variables", "Version", "6.0")

	$Gui = GUICreate("Omnimo Information Hub (Version " & $Version & ")", 535, 470, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_MAXIMIZEBOX, $WS_SIZEBOX, $WS_CLIPCHILDREN))
	GUISetBkColor(0x7A7A7A)

	_IEErrorHandlerRegister()
	$oIE = _IECreateEmbedded()
	GUICtrlCreateObj($oIE, 0, 25, 535, 445)
	GUICtrlSetResizing(-1, $GUI_DOCKBORDERS)
	$back = GUICtrlCreateButton("< Back", 3, 3, 60, 20, 0)

	_IENavigate($oIE, $HubURL)
	GUISetState()

	While 1
	  $msg = GUIGetMsg()
	  Switch $msg
		Case $back
		  _IEAction($oIE, "back")
		Case $GUI_EVENT_CLOSE
		  GUIDelete($Gui)
		  Return
	  EndSwitch
	WEnd
EndFunc

Func About()
	TrayTip($Language.Item("AboutTitle"), StringReplace($Language.Item("AboutText"), "\n", @CRLF), Default, 1)
EndFunc

;
; Main functions
;

Func RainmeterMenu()
	SendBang("!TrayMenu")
EndFunc

Func OpenSettings()
	ShellExecute(@ScriptDir & "\settings.exe")
EndFunc

Func ExitScript()
	If $HideIcons Then ShowIcons(True)

	If IniRead($SettingsVariables, "Variables", "FirstRun", "1") == "1" Then
		IniWrite($SettingsVariables, "Variables", "FirstRun", "0")
		Local $iMsgBoxAnswer = MsgBox(36, $Language.Item("StartupTitle"), StringReplace($Language.Item("StartupText"), "\n", @CRLF))
		Select
			Case $iMsgBoxAnswer = 6 ; Yes
				If _StartupFolder_Install("Omnimo", @ScriptDir & "\Omnimo.exe") Then
					IniWrite($SettingsVariables, "Variables", "Startup", "1")
				EndIf
			Case $iMsgBoxAnswer = 7 ; No
				If _StartupFolder_Uninstall("Omnimo", @ScriptDir & "\Omnimo.exe") Then
					IniWrite($SettingsVariables, "Variables", "Startup", "0")
				EndIf
		EndSelect
	EndIf

	SendBang("!Quit")
	Exit
EndFunc