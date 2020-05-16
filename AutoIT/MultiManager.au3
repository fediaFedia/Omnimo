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
#include "Includes\_Zip.au3"

; Check arguments
If $CmdLine[0] < 4 Then OmnimoError("Omnimo MultiManager", "Too few command line arguments specified.")


Const $CurrentLanguage = IniRead("..\Background\Varrar.inc", "Variables", "Language", "English")
Const $LangFile = "..\Background\Language\" & $CurrentLanguage & ".cfg"

If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$Sections = IniReadSection($LangFile, "Variables")
For $i = 1 To $Sections[0][0]
	$Language.Add($Sections[$i][0], $Sections[$i][1])
 Next


Const $settings = $CmdLine[1]
Const $skins    = $CmdLine[2]
Const $command  = $CmdLine[3]
Const $index    = $CmdLine[4]
Const $wallpaper    = $CmdLine[5]
Const $saved    = $skins & "WP7\Gallery\MultiManager\Saved\"

Switch $command

 Case "Zip"

_GDIPlus_Startup()
$hImage = _GDIPlus_ImageLoadFromFile($saved & $index & "\screenshot.png")
$sCLSID = _GDIPlus_EncodersGetCLSID("BMP")
_GDIPlus_ImageSaveToFileEx($hImage, $saved & $index & "\Rainstaller.bmp", $sCLSID)
_GDIPlus_ShutDown()


FileCopy($saved & $index & "\Rainmeter.ini", $saved & $index & "\Themes\Omnimo\Rainmeter.thm", 8)
FileCopy($saved & $index & "\color.inc", $saved & $index & "\Skins\WP7\@Resources\Common\Color\color.inc", 8)
FileCopy($saved & "Item.ini", $saved & $index & "\Skins\WP7\TextItems\Extra\Missing\Item.ini", 8)




$dir = $saved & $index & "\Themes\"
$dir2 = $saved & $index & "\Skins\"
$dir3 = $saved & $index & "\Rainstaller.bmp"
$dir4 = $saved & "Rainstaller.cfg"



; create the ZIP
$file = _Zip_Create(@TempDir & "\test.zip", 1)



_Zip_AddItem($file, $dir)
_Zip_AddItem($file, $dir2)
_Zip_AddItem($file, $dir3)
_Zip_AddItem($file, $dir4)



 FileMove(@TempDir & "\test.zip", @DesktopDir & "\Theme" & $index & "_by_" & @UserName & ".rmskin", $FC_OVERWRITE + $FC_CREATEPATH)
	MsgBox($MB_ICONINFORMATION, $Language.Item("ThemePackager"), $Language.Item("CreatedRmskin"))
Run("Explorer.exe " & @DesktopDir)



	Case "Save0"


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




	Case "Save1"


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



	Case "Load0"
		; Load saved layout by creating a temporary Rainmeter layout and then loading it



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

			;	MsgBox(0, "Load 0", "text")

	Case "Load1"
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

		;	MsgBox(0, "Load 1", "text")

	Case "Delete"


			  DirRemove($saved & $index, $DIR_REMOVE)



FileCopy($skins & "WP7\Gallery\MultiManager\screenshot.png", $saved & $index & "\screenshot.png", 8)
		SendBang("!Refresh WP7\Gallery\MultiManager")




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



