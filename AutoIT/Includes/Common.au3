#include-once
#include <SendMessage.au3>

Func OmnimoError($title, $msg)
	MsgBox(16, $title, $msg & @CRLF & @CRLF & 'Please send an e-mail to omnimosupport@gmail.com or' & @CRLF & 'file an issue at github with the following information:' & @CRLF & @CRLF & '- This error message' & @CRLF & '- Steps to reproduce the issue' & @CRLF & '- Your version of Rainmeter and Windows')
	Exit
EndFunc

Func GetSkinWindow($szConfigName)
	Local Const $hWnd = WinGetHandle("[CLASS:RainmeterTrayClass]")
	If $hWnd <> 0 Then
		Local Const $iSize = StringLen($szConfigName) + 1

		Local Const $pMem = DllStructCreate("wchar[" & $iSize & "]")
		DllStructSetData($pMem, 1, $szConfigName)

		Local Const $pCds = DllStructCreate("dword;dword;ptr")
		DllStructSetData($pCds, 1, 5101)
		DllStructSetData($pCds, 2, ($iSize * 2))
		DllStructSetData($pCds, 3, DllStructGetPtr($pMem))

		Local Const $WM_COPYDATA = 0x004A
		Return _SendMessage($hWnd, $WM_COPYDATA, 0, DllStructGetPtr($pCds))
	EndIf

	Return 0
EndFunc

Func SendBang($szBang)
	Local Const $hWnd = WinGetHandle("[CLASS:RainmeterMeterWindow]")
	If $hWnd <> 0 Then
		Local Const $iSize = StringLen($szBang) + 1

		Local Const $pMem = DllStructCreate("wchar[" & $iSize & "]")
		DllStructSetData($pMem, 1, $szBang)

		Local Const $pCds = DllStructCreate("dword;dword;ptr")
		DllStructSetData($pCds, 1, 1)
		DllStructSetData($pCds, 2, ($iSize * 2))
		DllStructSetData($pCds, 3, DllStructGetPtr($pMem))

		Local Const $WM_COPYDATA = 0x004A
		_SendMessage($hWnd, $WM_COPYDATA, 0, DllStructGetPtr($pCds))
	EndIf
EndFunc

; Convert Hex to RGB
Func HexToRGB($Color)
	$Blue = BitAND($Color, 0xFF)
	$Green = BitAND(BitShift($Color, 8), 0xFF)
	$Red = BitAND(BitShift($Color, 16), 0xFF)
	Return $Red & ',' & $Green & ',' & $Blue
EndFunc

; Convert RGB to Hex
Func RGBToHex($Color)
	$split = StringSplit($Color, ',')
	Return '0x' & Hex($split[1], 2) & Hex($split[2], 2) & Hex($split[3], 2)
EndFunc