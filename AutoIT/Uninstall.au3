#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Icons\Omnimo.ico
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\Settings\uninstall.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo Uninstaller
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7 -w 8
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

If $CmdLine[0] <> 1 Then Exit

If ProcessExists("rainmeter.exe") Or ProcessExists("omnimo.exe") Then
	$iMsgBoxAnswer = MsgBox(49, "Uninstall Omnimo UI", "Both Omnimo and Rainmeter need to be closed before uninstallation. Would you like to close them now?")
	Select
		Case $iMsgBoxAnswer = 1 ; OK
			ProcessClose("rainmeter.exe")
			ProcessClose("omnimo.exe")
			ProcessWaitClose("rainmeter.exe")
			ProcessWaitClose("omnimo.exe")
		Case $iMsgBoxAnswer = 2 ; Cancel
			Exit
	EndSelect
EndIf

If FileExists(@AppDataDir & "\Rainmeter\Rainmeter.ini") Then
	IniWrite(@AppDataDir & "\Rainmeter\Rainmeter.ini", "Rainmeter", "TrayIcon", "1")
EndIf

RemoveOmnimoFolder()
MsgBox(64, "Uninstall Omnimo UI", "Omnimo UI was successfully removed from your computer.")
_SelfDelete()

Func RemoveOmnimoFolder()
	If DirRemove($CmdLine[1], 1) = 0 Then
		$iMsgBoxAnswer = MsgBox(21, "Uninstall Omnimo UI", "Unable to delete folder:" & @CRLF & $CmdLine[1])
		Select
			Case $iMsgBoxAnswer = 4 ; Retry
				RemoveOmnimoFolder()
			Case $iMsgBoxAnswer = 2 ; Cancel
				Exit
		EndSelect
	EndIf
EndFunc

Func _SelfDelete($iDelay = 0)
	Local $sCmdFile
	FileDelete(@TempDir & "\scratch.bat")
	$sCmdFile = 'ping -n ' & $iDelay & ' 127.0.0.1 > nul' & @CRLF _
			 & ':loop' & @CRLF _
			 & 'del "' & @ScriptFullPath & '"' & @CRLF _
			 & 'if exist "' & @ScriptFullPath & '" goto loop' & @CRLF _
			 & 'del %0'
	FileWrite(@TempDir & "\scratch.bat", $sCmdFile)
	Run(@TempDir & "\scratch.bat", @TempDir, @SW_HIDE)
EndFunc;==>_SelfDelete