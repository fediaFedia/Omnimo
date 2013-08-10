#include-once

; #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7
; #INDEX# =======================================================================================================================
; Title .........: _Startup
; AutoIt Version : v3.2.12.1 or higher
; Language ......: English
; Description ...: Create startup entries in the startup folder or registry. The registry entries can be Run all the time (Run registry entry) or only once (RunOnce registry entry.)
; Note ..........:
; Author(s) .....: guinness
; Remarks .......: Special thanks to KaFu for EnumRegKeys2Array() which I used as inspiration for enumerating the Registry Keys.
; ===============================================================================================================================

; #INCLUDES# ====================================================================================================================
; None

; #GLOBAL VARIABLES# ============================================================================================================
; None

; #CURRENT# =====================================================================================================================
; _StartupFolder_Install: Creates a shortcut in the 'All Users/Current Users' startup folder.
; _StartupFolder_Uninstall: Deletes the shortcut in the 'All Users/Current Users' startup folder.
; _StartupRegistry_Install: Creates an entry in the 'All Users/Current Users' registry.
; _StartupRegistry_Uninstall: Deletes the entry in the 'All Users/Current Users' registry.
; ===============================================================================================================================

; #INTERNAL_USE_ONLY#============================================================================================================
; None
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name ..........: _StartupFolder_Install
; Description ...: Creates a shortcut in the 'All Users/Current Users' startup folder.
; Syntax ........: _StartupFolder_Install([$sName = @ScriptName[, $sFilePath = @ScriptFullPath[, $sCommandline = ''[,
;                  $fAllUsers = False]]]])
; Parameters ....: $sName               - [optional] Name of the program. Default is @ScriptName.
;                  $sFilePath           - [optional] Location of the program executable. Default is @ScriptFullPath.
;                  $sCommandline        - [optional] Commandline arguments to be passed to the application. Default is ''.
;                  $fAllUsers           - [optional] Add to Current Users (False) or All Users (True) Default is False.
; Return values .: Success - Returns True
;                  Failure - Returns False & sets @error to non-zero
; Author ........: guinness
; Example .......: Yes
; ===============================================================================================================================
Func _StartupFolder_Install($sName = @ScriptName, $sFilePath = @ScriptFullPath, $sCommandline = '', $fAllUsers = False)

	If $sFilePath = Default Then
		$sFilePath = @ScriptFullPath
	EndIf
	If $sName = Default Then
		$sName = @ScriptName
	EndIf
	$sName = StringRegExpReplace($sName, '\.[^\.\\/]*$', '')
	If StringStripWS($sName, 8) = '' Or FileExists($sFilePath) = 0 Then
		Return SetError(1, 0, False)
	EndIf

	_StartupFolder_Uninstall($sName, $sFilePath, $fAllUsers) ; Deletes the shortcut in the 'All Users/Current Users' startup folder.

	Local $sStartup = @StartupDir
	If $fAllUsers Then
		$sStartup = @StartupCommonDir
	EndIf
	Local $iReturn = FileCreateShortcut($sFilePath, $sStartup & '\' & $sName & '.lnk', $sStartup, $sCommandline)
	Return $iReturn > 0
EndFunc   ;==>_StartupFolder_Install

; #FUNCTION# ====================================================================================================================
; Name ..........: _StartupFolder_Uninstall
; Description ...: Deletes the shortcut in the 'All Users/Current Users' startup folder.
; Syntax ........: _StartupFolder_Uninstall([$sName = @ScriptName[, $sFilePath = @ScriptFullPath[, $fAllUsers = 0]]])
; Parameters ....: $sName               - [optional] Name of the program. Default is @ScriptName.
;                  $sFilePath           - [optional] Location of the program executable. Default is @ScriptFullPath.
;                  $fAllUsers           - [optional] Was it added to Current Users (False) or All Users (True) Default is False.
; Return values .: Success - Returns True
;                  Failure - Returns False & sets @error to non-zero
; Author ........: guinness
; Example .......: Yes
; ===============================================================================================================================
Func _StartupFolder_Uninstall($sName = @ScriptName, $sFilePath = @ScriptFullPath, $fAllUsers = False)
	Local $aFileGetShortcut = 0, $sFileName = ''

	If $sFilePath = Default Then
		$sFilePath = @ScriptFullPath
	EndIf
	If $sName = Default Then
		$sName = @ScriptName
	EndIf
	$sName = StringRegExpReplace($sName, '\.[^\.\\/]*$', '')
	If StringStripWS($sName, 8) = '' Or FileExists($sFilePath) = 0 Then
		Return SetError(1, 0, False)
	EndIf

	Local $iStringLen = StringLen($sName), $sStartup = @StartupDir
	If $fAllUsers Then
		$sStartup = @StartupCommonDir
	EndIf

	Local $hSearch = FileFindFirstFile($sStartup & '\' & '*.lnk')
	If $hSearch = -1 Then
		Return SetError(2, 0, False)
	EndIf
	Local $iReturn = 0
	While 1
		$sFileName = FileFindNextFile($hSearch)
		If @error Then
			ExitLoop
		EndIf
		If StringLeft($sFileName, $iStringLen) = $sName Then
			$aFileGetShortcut = FileGetShortcut($sStartup & '\' & $sFileName)
			If @error Then
				ContinueLoop
			EndIf
			If $aFileGetShortcut[0] = $sFilePath Then
				$iReturn += FileDelete($sStartup & '\' & $sFileName)
			EndIf
		EndIf
	WEnd
	FileClose($hSearch)
	Return $iReturn > 0
EndFunc   ;==>_StartupFolder_Uninstall

; #FUNCTION# ====================================================================================================================
; Name ..........: _StartupRegistry_Install
; Description ...: Creates an entry in the 'All Users/Current Users' registry.
; Syntax ........: _StartupRegistry_Install([$sName = @ScriptName[, $sFilePath = @ScriptFullPath[, $sCommandline = ''[,
;                  $fAllUsers = 0[, $iRunOnce = 0]]]]])
; Parameters ....: $sName               - [optional] Name of the program. Default is @ScriptName.
;                  $sFilePath           - [optional] Location of the program executable. Default is @ScriptFullPath.
;                  $sCommandline        - [optional] Commandline arguments to be passed to the application. Default is ''.
;                  $fAllUsers           - [optional] Add to Current Users (False) or All Users (True) Default is False.
;                  $iRunOnce            - [optional] Always run at system startup (0), run only once before explorer is started (1)
;										  or run only once after explorer is started (2). Default is 0.
; Return values .: Success - Returns True
;                  Failure - Returns False & sets @error to non-zero
; Author ........: guinness
; Example .......: Yes
; ===============================================================================================================================
Func _StartupRegistry_Install($sName = @ScriptName, $sFilePath = @ScriptFullPath, $sCommandline = '', $fAllUsers = False, $iRunOnce = 0)

	If $iRunOnce = Default Then
		$iRunOnce = 0
	EndIf
	If $sFilePath = Default Then
		$sFilePath = @ScriptFullPath
	EndIf
	If $sName = Default Then
		$sName = @ScriptName
	EndIf

	_StartupRegistry_Uninstall($sName, $sFilePath, $fAllUsers, $iRunOnce) ; Deletes the entry in the 'All Users/Current Users' registry.

	$sName = StringRegExpReplace($sName, '\.[^\.\\/]*$', '')
	If StringStripWS($sName, 8) = '' Or FileExists($sFilePath) = 0 Then
		Return SetError(1, 0, False)
	EndIf

	Local $i64Bit = '', $sRunOnce = ''
	Switch $iRunOnce
		Case 1
			$sRunOnce = 'Once'
		Case 2
			$sRunOnce = 'OnceEx'
	EndSwitch

	If @OSArch = 'X64' Then
		$i64Bit = '64'
	EndIf
	Local $sRegistryKey = ''
	If $fAllUsers Then
		$sRegistryKey = 'HKEY_LOCAL_MACHINE' & $i64Bit & '\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' & $sRunOnce & '\'
	Else
		$sRegistryKey = 'HKEY_CURRENT_USER' & $i64Bit & '\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' & $sRunOnce & '\'
	EndIf
	Local $iReturn = RegWrite($sRegistryKey, $sName, 'REG_SZ', $sFilePath & ' ' & $sCommandline)
	Return $iReturn > 0
EndFunc   ;==>_StartupRegistry_Install

; #FUNCTION# ====================================================================================================================
; Name ..........: _StartupRegistry_Uninstall
; Description ...: Deletes the entry in the 'All Users/Current Users' registry.
; Syntax ........: _StartupRegistry_Uninstall([$sName = @ScriptName[, $sFilePath = @ScriptFullPath[, $fAllUsers = False[,
;                  $iRunOnce = 0]]]])
; Parameters ....: $sName               - [optional] Name of the program. Default is @ScriptName.
;                  $sFilePath           - [optional] Location of the program executable. Default is @ScriptFullPath.
;                  $fAllUsers           - [optional] Was it added to the current users (0) or all users (1). Default is 0.
;                  $iRunOnce            - [optional] Was it always run at system startup (0), run only once before explorer is started (1)
;										  or run only once after explorer is started (2). Default is 0.
; Return values .: Success - Returns True
;                  Failure - Returns False & sets @error to non-zero
; Author ........: guinness
; Example .......: Yes
; ===============================================================================================================================
Func _StartupRegistry_Uninstall($sName = @ScriptName, $sFilePath = @ScriptFullPath, $fAllUsers = False, $iRunOnce = 0)

	If $iRunOnce = Default Then
		$iRunOnce = 0
	EndIf
	If $sFilePath = Default Then
		$sFilePath = @ScriptFullPath
	EndIf
	If $sName = Default Then
		$sName = @ScriptName
	EndIf
	$sName = StringRegExpReplace($sName, '\.[^\.\\/]*$', '')
	If StringStripWS($sName, 8) = '' Or FileExists($sFilePath) = 0 Then
		Return SetError(1, 0, False)
	EndIf

	Local $iCount = 1, $iReturn = 0, $sRegistryKey = '', $sRegistryName = '', $sRegistryValue = ''
	Local $i64Bit = '', $sRunOnce = ''
	Switch $iRunOnce
		Case 1
			$sRunOnce = 'Once'
		Case 2
			$sRunOnce = 'OnceEx'
	EndSwitch

	If @OSArch = 'X64' Then
		$i64Bit = '64'
	EndIf
	If $fAllUsers Then
		$sRegistryKey = 'HKEY_LOCAL_MACHINE' & $i64Bit & '\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' & $sRunOnce & '\'
	Else
		$sRegistryKey = 'HKEY_CURRENT_USER' & $i64Bit & '\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' & $sRunOnce & '\'
	EndIf

	While 1
		$sRegistryName = RegEnumVal($sRegistryKey, $iCount)
		If @error Then
			ExitLoop
		EndIf

		$sRegistryValue = RegRead($sRegistryKey, $sRegistryName)
		If ($sRegistryName = $sName) And StringInStr($sRegistryValue, $sFilePath, 2) Then
			$iReturn += RegDelete($sRegistryKey, $sName)
		EndIf
		$iCount += 1
	WEnd
	Return $iReturn > 0
EndFunc   ;==>_StartupRegistry_Uninstall