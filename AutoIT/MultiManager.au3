#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=..\WP7\@Resources\Common\MultiManager\MultiManager.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Omnimo MultiManager
#AutoIt3Wrapper_Res_Fileversion=6.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Xyrfo 2013
#AutoIt3Wrapper_AU3Check_Parameters=-q -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 -w 7 -w 8
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GDIPlus.au3>
#include <ScreenCapture.au3>

#include "Includes\Common.au3"

; Check arguments
If $CmdLine[0] < 4 Then OmnimoError("Omnimo MultiManager", "Too few command line arguments specified.")

Const $settings = $CmdLine[1]
Const $skins    = $CmdLine[2]
Const $command  = $CmdLine[3]
Const $index    = $CmdLine[4]
Const $saved    = $skins & "WP7\TextItems\MultiManager\Saved\"

Switch $command
	Case "Save"
		If FileExists($saved & $index) = 0 Then DirCreate($saved & $index)
		$imagePath = $saved & $index & "\screenshot.png"
		_GDIPlus_Startup()
		$hBitmap = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
		_SavehBitmapEx($hBitmap, $imagePath, 177, 177 / (@DesktopWidth / @DesktopHeight))
		FileCopy($settings & "Rainmeter.ini", $saved & $index & "\Rainmeter.ini", 1)
		SendBang("!Refresh WP7\TextItems\MultiManager")

	Case "Load"
		; Load saved layout by creating a temporary Rainmeter layout and then loading it
		If DirCreate($settings & "Layouts\MultiManagerTemp") = 0 Then
			MsgBox(0, "Debug", "Creating directory failed")
			Exit
		EndIf
		If FileCopy($saved & $index & "\Rainmeter.ini", $settings & "Layouts\MultiManagerTemp\Rainmeter.ini", 1) = 0 Then
			MsgBox(0, "Debug", "Copying file failed")
			Exit
		EndIf
		SendBang("!LoadLayout MultiManagerTemp")
		Sleep(5000)
		DirRemove($settings & "Layouts\MultiManagerTemp", 1)

	Case "Delete"
		FileDelete($saved & $index & "\Rainmeter.ini")
		FileCopy($skins & "WP7\TextItems\MultiManager\screenshot.png", $saved & $index & "\screenshot.png", 1)
		SendBang("!Refresh WP7\TextItems\MultiManager")
EndSwitch

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