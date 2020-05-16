


#include <WinAPIFiles.au3>
#include "Includes\Common.au3"
#include <MsgBoxConstants.au3>

;	If $cmdline[0] < 3 Then omnimoerror("Can't open", "Too few command line arguments specified.")

; Check arguments
If $CmdLine[0] < 4 Then OmnimoError("Omnimo Panel Config", "Too few command line arguments specified.")



; Set up variables

$dir = @ScriptDir
$dirE = StringReplace($dir, 'WP7\@Resources\Common\Config', '')



Const $skinpath    = $CmdLine[1]



Const $sY   = $CmdLine[2]
Const $sX = $CmdLine[3]
Const $Variant   = $CmdLine[5]
Const $SettingsPath = $CmdLine[4]
;MsgBox($MB_SYSTEMMODAL, "Title", $sX & " " & $sY, 2)


Const $colorvars = $skinpath & "WP7\@Resources\Common\Color\color.inc"
Const $uservars = $skinpath & "WP7\@Resources\Common\Variables\UserVariables.inc"



FileDelete ( "hue.ini" )



Const $CurrentLanguage = IniRead( $skinpath & "WP7\@Resources\Common\Background\Varrar.inc", "Variables", "Language", "English")
Const $LangFile = $skinpath & "WP7\@Resources\Common\Background\Language\" & $CurrentLanguage & ".cfg"




If Not FileExists($LangFile) Then OmnimoError("Error loading language", "Unable to load language file for " & $CurrentLanguage)

; Read language dictionary from file
$Language = ObjCreate("Scripting.Dictionary")
$SectionsE = IniReadSection($LangFile, "Variables")
For $i = 1 To $SectionsE[0][0]
	$Language.Add($SectionsE[$i][0], $SectionsE[$i][1])
 Next



If $Variant = "lock" Then
MsgBox($MB_ICONINFORMATION, "Info", $Language.Item("PanelsLocked"), 2)








		ReadActiveSkinsLock()

ElseIf $Variant = "unlock" Then
   MsgBox($MB_ICONINFORMATION, "Info", $Language.Item("PanelsUnlocked"), 2)

	ReadActiveSkinsLock()



ElseIf $Variant = "darkwithpanels" Then

IniWrite ( $colorvars, "Variables", "colorskin", "30,30,30" )
IniWrite ( $colorvars, "Variables", "colorskin2", "50,50,50" )
IniWrite ( $colorvars, "Variables", "textcolor2", "255,255,255" )
IniWrite ( $uservars, "Variables", "DarkMode", "1" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Dark" )


IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0x000000" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0x323232" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0xE6E6E6" )




	SendBang('[!Refresh *]')


ElseIf $Variant = "lightwithpanels" Then

IniWrite ( $colorvars, "Variables", "colorskin", "230,230,230" )
IniWrite ( $colorvars, "Variables", "colorskin2", "250,250,250" )
IniWrite ( $colorvars, "Variables", "textcolor2", "30,30,30" )
IniWrite ( $uservars, "Variables", "DarkMode", "0" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Light" )

IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0xffffff" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0xd2d2d2" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0x323232" )

	SendBang('[!Refresh *]')

ElseIf $Variant = "dark" Then


IniWrite ( $uservars, "Variables", "DarkMode", "1" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Dark" )


IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0x000000" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0x323232" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0xE6E6E6" )




	SendBang('[!Refresh *]')



ElseIf $Variant = "light" Then


IniWrite ( $uservars, "Variables", "DarkMode", "0" )
IniWrite ( $uservars, "Variables", "ttgallerystyle", "Light" )

IniWrite ( $uservars, "Variables", "ConfigBackgroundColor", "0xffffff" )
IniWrite ( $uservars, "Variables", "ConfigBackgroundColor2", "0xd2d2d2" )
IniWrite ( $uservars, "Variables", "ConfigTextColor", "0x323232" )

	SendBang('[!Refresh *]')


ElseIf $Variant = "missing" Then


IniWrite ( $uservars, "Variables", "MissingComponents", "!DeactivateConfig" )



Else
ReadActiveSkins()
EndIf










Func ReadActiveSkins()
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

Func ReadActiveSkinsLock()
		Const $RainmeterINI = $SettingsPath & "\Rainmeter.ini"
	Const $Sections = IniReadSectionNames($RainmeterINI)
	If @error Then OmnimoError("Individual Panel Color", "Unable to open Rainmeter.ini for reading.")

$iCount = 0


	For $i = 1 To $Sections[0]




		; Only want panels here
	;	If StringRegExp($Sections[$i], '^WP7\\(Installed|Donator)?Panels.*$') Then

	If StringRegExp($Sections[$i], '^WP7\\(Panels|InstalledPanels|DonatorPanels|TextItems).*$') Then
			If IniRead($RainmeterINI, $Sections[$i], "Active", "0") <> "0" And FileExists($SkinPath & $Sections[$i]) Then
				$config = StringReplace($Sections[$i], "WP7\", "WP7\@Resources\Config\") & "\RainConfigure.cfg"
				If IniRead($config, "Options", "Colorizable", "1") == "0" Then ContinueLoop



;MsgBox($MB_SYSTEMMODAL, "Title", $Sections[$i], 1)


If $Variant = "lock" Then

SendBang("!Draggable 0 " & $Sections[$i])


Else

SendBang("!Draggable 1 " & $Sections[$i])
EndIf


	;SendBang("!Move 100 " & "10R" & " " & $Sections[$i])


				;GUICtrlSetData($PanelList, StringRegExpReplace($Sections[$i], "WP7\\(Installed|Donator)?Panels\\", ""))
			;	$Panels[$NumPanels] = $Sections[$i]
				;$NumPanels += 1
			EndIf
		EndIf
	Next
 EndFunc
