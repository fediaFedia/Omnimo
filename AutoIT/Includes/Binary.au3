; =============================================================================
;  AutoIt Binary UDF (2011.9.15)
;  Purpose: Functions About Binary Type Variable Management
;  Author: Ward
; =============================================================================

; =============================================================================
;  Functions List
;   _BinaryPeek($Binary, $Start, $Type = "byte")
;   _BinaryPoke($Binary, $Start, $Value, $Type = "byte")
;   _BinaryAnd($Binary1, $Binary2)
;   _BinaryOR($Binary1, $Binary2)
;   _BinaryXOR($Binary1, $Binary2)
;   _BinaryNot($Binary)
;   _BinaryShift($Binary, $Shift)
;   _BinaryRotate($Binary, $Shift)
;   _BinaryReverse($Binary)
;   _BinaryInBin($Binary, $Search, $Occur = 1, $Start = 1)
;   _BinaryReplace($Binary, $Search, $Replace, $Occur = 0)
;   _BinarySplit($Binary, $Search)
;   _BinaryRandom($Length, $Start = 0, $To = 255)
;   _BinaryRight($Binary, $Count)
;   _BinaryLeft($Binary, $Count)
;   _BinaryTrimLeft($Binary, $Count)
;   _BinaryTrimRight($Binary, $Count)
;	_BinaryToInt16($Binary)
;	_BinaryFromInt16($Value)
;   _BinaryToInt32($Binary)
;   _BinaryFromInt32($Value)
;   _BinaryToInt64($Binary)
;   _BinaryFromInt64($Value)
;   _BinaryToDouble($Binary)
;   _BinaryFromDouble($Value)
;	_BinaryToMemory($Binary, $Ptr)
;	_BinaryFromMemory($Ptr, $Size)
;	_BinaryToDLLStruct($Binary)
;	_BinaryFromDLLStruct(ByRef $DLLStruct)
;	_BinaryFillDLLStruct($Binary, ByRef $DLLStruct)
;   _BitShift64($Value, $Shift)
;   _BitRotate64($Value, $Shift)
;   _BitNOT64($Value)
;   _BitOR64($Value1, $Value2, [$Value3, ...])
;   _BitAND64($Value1, $Value2, [$Value3, ...])
;   _BitXOR64($Value1, $Value2, [$Value3, ...])
;   _Hex64($Value, $Length = 16)
;   _Dec64($HexString)
; =============================================================================


#Include-once
#Include <Memory.au3>

Global $__Binary_Kernel32Dll = DllOpen("kernel32.dll")
Global $__Binary_User32Dll = DllOpen("user32.dll")
Global $__Binary_MsvcrtDll = DllOpen("msvcrt.dll")

Func __Binary_lstrlenA($Ptr)
	Local $Ret = DllCall($__Binary_Kernel32Dll, "int", "lstrlenA", "ptr", $Ptr)
	If @Error Then Return SetError(@Error, @Extended, 0)
	Return $Ret[0]
EndFunc

Func __Binary_lstrlenW($Ptr)
	Local $Ret = DllCall($__Binary_Kernel32Dll, "int", "lstrlenW", "ptr", $Ptr)
	If @Error Then Return SetError(@Error, @Extended, 0)
	Return $Ret[0]
EndFunc

Func __Binary_Realloc($Ptr, $Size)
	Local $Ret = DllCall($__Binary_MsvcrtDll, "ptr:cdecl", "realloc", "ptr", $Ptr, "ulong_ptr", $Size)
	If @Error Then Return SetError(@Error, @Extended, 0)
	If $Ret[0] = 0 Then Exit MsgBox(16, "AutoIt Binary UDF Error", "Out of memory !!")
	Return $Ret[0]
EndFunc

Func __Binary_Free($Ptr)
	DllCall($__Binary_MsvcrtDll, "ptr:cdecl", "free", "ptr", $Ptr)
	If @Error Then Return SetError(@Error, @Extended, 0)
EndFunc

Func __BinaryCodeBufferAlloc($Code)
	Local $Ptr = _MemVirtualAlloc(0, BinaryLen($Code), $MEM_COMMIT, $PAGE_EXECUTE_READWRITE)
	If $Ptr = 0 Then Exit MsgBox(16, "AutoIt Binary UDF Error", "Out of memory !!")
	Local $Buffer = DllStructCreate("byte[" & BinaryLen($Code) & "]", $Ptr)
	DllStructSetData($Buffer, 1, $Code)
	Return $Ptr
EndFunc

Func _BinaryPeek($Binary, $Start, $Type = "byte")
	$Binary = Binary($Binary)
	If $Start > BinaryLen($Binary) Or $Start = 0 Then Return SetError(1, 0, "")

	Local $Buffer = DllStructCreate("byte[" & (BinaryLen($Binary) + 8) & "]")
	DllStructSetData($Buffer, 1, $Binary)

	Local $Ptr = DllStructGetPtr($Buffer) + $Start - 1, $Len = -1
	If $Type = "str" Then
		$Len = __Binary_lstrlenA($Ptr)
		$Type = "char[" & $Len & "]"
	ElseIf $Type = "wstr" Then
		$Len = __Binary_lstrlenW($Ptr)
		$Type = "wchar[" & $Len & "]"
	EndIf
	If $Len = 0 Then Return ""

	Local $Target = DllStructCreate($Type, $Ptr)
	If DllStructGetSize($Target) = 0 Or DllStructGetSize($Target) > BinaryLen($Binary) - $Start + 1 Then Return SetError(1, 0, "")
	Return DllStructGetData($Target, 1)
EndFunc

Func _BinaryPoke($Binary, $Start, $Value, $Type = "byte")
	$Binary = Binary($Binary)
	If $Start > BinaryLen($Binary) Or $Start = 0 Then Return SetError(1, 0, "")

	Local $Buffer = DllStructCreate("byte[" & (BinaryLen($Binary)) & "]")
	DllStructSetData($Buffer, 1, $Binary)

	Local $Ptr = DllStructGetPtr($Buffer) + $Start - 1
	If $Type = "str" Then
		$Value = String($Value)
		$Type = "char[" & (StringLen($Value) + 1) & "]"
	ElseIf $Type = "wstr" Then
		$Value = String($Value)
		$Type = "wchar[" & (StringLen($Value) + 1) & "]"
	EndIf

	Local $Target = DllStructCreate($Type, $Ptr)
	If DllStructGetSize($Target) = 0 Or DllStructGetSize($Target) > BinaryLen($Binary) - $Start + 1 Then Return SetError(1, 0, "")
	DllStructSetData(DllStructCreate($Type, $Ptr), 1, $Value)
	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryAnd($Binary1, $Binary2)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4989CA4863CA31D289C8FFC841F7F14863D2418A04104120440AFFE2E9C3")
		Else
			$Code = Binary("0x5589E556578B7D088B75108B4D0C31D289C848F775148A041620440FFFE2EF5F5E5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary1 = Binary($Binary1)
	$Binary2 = Binary($Binary2)

	Local $Len1 = BinaryLen($Binary1)
	Local $Buffer1 = DllStructCreate("byte[" & $Len1 & "]")
	DllStructSetData($Buffer1, 1, $Binary1)

	Local $Len2 = BinaryLen($Binary2)
	Local $Buffer2 = DllStructCreate("byte[" & $Len2 & "]")
	DllStructSetData($Buffer2, 1, $Binary2)

	If $Len1 And $Len2 Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer1), _
																"uint", $Len1, _
																"ptr", DllStructGetPtr($Buffer2), _
																"uint", $Len2)
	EndIf
	Return DllStructGetData($Buffer1, 1)
EndFunc

Func _BinaryOR($Binary1, $Binary2)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4989CA4863CA31D289C8FFC841F7F14863D2418A04104108440AFFE2E9C3")
		Else
			$Code = Binary("0x5589E556578B7D088B75108B4D0C31D289C848F775148A041608440FFFE2EF5F5E5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary1 = Binary($Binary1)
	$Binary2 = Binary($Binary2)

	Local $Len1 = BinaryLen($Binary1)
	Local $Buffer1 = DllStructCreate("byte[" & $Len1 & "]")
	DllStructSetData($Buffer1, 1, $Binary1)

	Local $Len2 = BinaryLen($Binary2)
	Local $Buffer2 = DllStructCreate("byte[" & $Len2 & "]")
	DllStructSetData($Buffer2, 1, $Binary2)

	If $Len1 And $Len2 Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer1), _
																"uint", $Len1, _
																"ptr", DllStructGetPtr($Buffer2), _
																"uint", $Len2)
	EndIf

	Return DllStructGetData($Buffer1, 1)
EndFunc

Func _BinaryXOR($Binary1, $Binary2)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4989CA4863CA31D289C8FFC841F7F14863D2418A04104130440AFFE2E9C3")
		Else
			$Code = Binary("0x5589E556578B7D088B75108B4D0C31D289C848F775148A041630440FFFE2EF5F5E5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary1 = Binary($Binary1)
	$Binary2 = Binary($Binary2)

	Local $Len1 = BinaryLen($Binary1)
	Local $Buffer1 = DllStructCreate("byte[" & $Len1 & "]")
	DllStructSetData($Buffer1, 1, $Binary1)

	Local $Len2 = BinaryLen($Binary2)
	Local $Buffer2 = DllStructCreate("byte[" & $Len2 & "]")
	DllStructSetData($Buffer2, 1, $Binary2)

	If $Len1 And $Len2 Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer1), _
																"uint", $Len1, _
																"ptr", DllStructGetPtr($Buffer2), _
																"uint", $Len2)
	EndIf

	If $Len1 = 0 Then Return Binary("")
	Return DllStructGetData($Buffer1, 1)
EndFunc

Func _BinaryNot($Binary)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4887CAF6540AFFE2FAC3")
		Else
			$Code = Binary("0x5589E58B45088B4D0CF65408FFE2FA5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary = Binary($Binary)

	Local $Len = BinaryLen($Binary)
	Local $Buffer = DllStructCreate("byte[" & $Len & "]")
	DllStructSetData($Buffer, 1, $Binary)

	If $Len Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer), _
																"uint", $Len, _
																"int", 0, _
																"int", 0)
	EndIf

	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryShift($Binary, $Shift)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4989CA4C63CA4983F90074434183F800743D7F1F41F7D84C89C94C89D2F8D0129F48FFC9740648FFC29EEBF241FFC875E6EB1C4C89C9498D540AFFF8D01A9F48FFC9740648FFCA9EEBF241FFC875E4C3")
		Else
			$Code = Binary("0x5589E55657538B7D088B5D0C8B751083FB00743183FE00742C7F16F7DE89D989FAF8D0129F497404429EEBF64E75EEEB1489D98D540FFFF8D01A9F4974044A9EEBF64E75EC5B5F5E5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary = Binary($Binary)

	Local $Len = BinaryLen($Binary)
	Local $Buffer = DllStructCreate("byte[" & $Len & "]")
	DllStructSetData($Buffer, 1, $Binary)

	If $Len Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer), _
																"uint", $Len, _
																"int", $Shift, _
																"int", 0)
	EndIf

	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryRotate($Binary, $Shift)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4989CA4C63CA4983F90074554183F800744F7F2941F7D84C89C9498D540AFF410FB602660FBAE000D01A9F48FFC9740648FFCA9EEBF241FFC875DCEB244C89C94C89D2430FB6440AFF660FBAE007D0129F48FFC9740648FFC29EEBF241FFC875DCC3")
		Else
			$Code = Binary("0x5589E55657538B7D088B5D0C8B751083FB00744183FE00743C7F1FF7DE89D98D540FFF0FB607660FBAE000D01A9F4974044A9EEBF64E75E5EB1B89D989FA0FB6441FFF660FBAE007D0129F497404429EEBF64E75E55B5F5E5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary = Binary($Binary)

	Local $Len = BinaryLen($Binary)
	Local $Buffer = DllStructCreate("byte[" & $Len & "]")
	DllStructSetData($Buffer, 1, $Binary)

	If $Len Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer), _
																"uint", $Len, _
																"int", $Shift, _
																"int", 0)
	EndIf

	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryReverse($Binary)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x4889C84863D2488D5410FFEB128A0A32088808320A880A300848FFCA48FFC04839D072E9C3")
		Else
			$Code = Binary("0x8B4424048B5424088D5410FFEB0E8A0A32088808320A880A30084A4039D072EEC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary = Binary($Binary)

	Local $Len = BinaryLen($Binary)
	Local $Buffer = DllStructCreate("byte[" & $Len & "]")
	DllStructSetData($Buffer, 1, $Binary)

	If $Len Then
		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodeBufferPtr, _
																"ptr", DllStructGetPtr($Buffer), _
																"uint", $Len, _
																"int", 0, _
																"int", 0)
	EndIf

	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryInBin($Binary, $Search, $Occur = 1, $Start = 1)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x555756534883EC08448B51188B5120448B491C4C8B59108B4108488B294585D274504183F9007E5585D24989E8BB01000000741083EA0139D076374189D029D04D8D04284139C277294489D24863DBEB034901D84839D24C89C64C89DF4889D1F3A675064183E901741A83E8014139C276DF4883C40831C05B5E5F5DC375154989E8EBC04883C4084129E85B5E5F418D40015DC34189C041F7D9BBFFFFFFFF4529D04D8D0428EB9C")
		Else
			$Code = Binary("0x5589E583EC24895DF48B4D088975F8897DFC8B398B59088B51108B7104897DF08B45F0895DE88B590C8945E031C085DB8955E48B51148975EC743A837DE4007E51C745DC0100000085D27538395DEC7222FC8B75E039DB89D98B7DE8F3A67505FF4DE47455FF4DEC8B55DC0155E0395DEC73DF31C08B5DF48B75F88B7DFC89EC5DC210004A3B55EC73EB0155E02955ECEBBA7DDFF75DE48B45ECC745DCFFFFFFFF29D80145E085D274A24A31C03B55EC73C32955E02955ECEB928B4DF0294DE08B45E040EBAF")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary = Binary($Binary)
	$Search = Binary($Search)

	Local $Len1 = BinaryLen($Binary)
	Local $Buffer1 = DllStructCreate("byte[" & $Len1 & "]")
	DllStructSetData($Buffer1, 1, $Binary)

	Local $Len2 = BinaryLen($Search)
	Local $Buffer2 = DllStructCreate("byte[" & $Len2 & "]")
	DllStructSetData($Buffer2, 1, $Search)

	Local $Var = DllStructCreate("ptr bin1; uint len1; ptr bin2; uint len2;int occur; uint start")
	DllStructSetData($Var, "bin1", DllStructGetPtr($Buffer1))
	DllStructSetData($Var, "bin2", DllStructGetPtr($Buffer2))
	DllStructSetData($Var, "len1", $Len1)
	DllStructSetData($Var, "len2", $Len2)
	DllStructSetData($Var, "occur", $Occur)
	DllStructSetData($Var, "start", $Start)

	Local $Ret = DllCall($__Binary_User32Dll, "uint", "CallWindowProc", "ptr", $CodeBufferPtr, _
																		"ptr", DllStructGetPtr($Var), _
																		"int", 0, _
																		"int", 0, _
																		"int", 0)
	Return $Ret[0]
EndFunc

Func _BinaryReplace($Binary, $Search, $Replace, $Occur = 0)
	Static $ReAlloc = DllCallbackRegister("__Binary_Realloc", "ptr:cdecl", "ptr;uint")
	Static $ReAllocPtr = DllCallbackGetPtr($ReAlloc)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x41574531FF415641554154555756534883EC688B6918488B41204C898424C000000048899424B8000000448B592C448B412885ED48894424484C8B6110448B71084C8B2975144883C4684C89F85B5E5F5D415C415D415E415FC34585DBC744245C000000000F88DB0100004139E84489F276724589F24D89EFC74424400000000089EA4439D5774E4489D34C89F8EB0B83EB0139DD773F4883C0014839D24889C64C89E74889D1F3A675E54885C07426834424400144395C2440741289E94429F98D040189C14129C24901CFEBB58B74244085F674E64489C229EA0FAF542440418D54161031C9448944243844895C242841FFD1448B4424384531D24885C04989C74989C189EB448B5C24284589C04C894424400F842CFFFFFF48894424504589D74439F50F87940000004489F24C89E8EB0F83EA0139D50F87810000004883C0014839DB4889C64C89E74889D9F3A675E14885C0746889C74C89EA4C89C94429EF44895C24284C894C243089FE01EF4183C7014989F04129FEE8560100004C8B4C24304C8B442440488B542448498D34314889F1E83B010000448B5C24284C8B4C244089F84901C54539DF4E8D0C0E0F856CFFFFFF4585FF0F8463FFFFFF4589F64589FA4C89C94D89F04C89EA4C8B7C24504C894C24304489542438E8F30000004C8B4C24308B5C245C488B8C24C0000000448B542438488B8424B80000004D01F14529F985DB4489094489100F8432FEFFFF8B114C89F8498D5417FF4939D70F831FFEFFFF0FB60A32088808320A880A4883EA0130084883C0014839D072E6E900FEFFFF4489F241F7DB4C89E8498D5415FF4939D5731A0FB60A32088808320A880A4883EA0130084883C0014839D072E689EA4C89E0498D5414FF4939D4731A0FB60A32088808320A880A4883EA0130084883C0014839D072E6488B4424484489C2488D5410FF4839D0731A0FB60A32088808320A880A4883EA0130084883C0014839D072E6C744245C01000000E996FDFFFF56574889CF4889D64C89C1FCF3A45F5EC3")
		Else
			$Code = Binary("0x5557565383EC5C8B442470C744242C000000008B50188B580C8B48148B7010895424408B68088B500485DB8B00894C243C897424488954243089442434750E8B44242C83C45C5B5E5F5DC210008B742440C744244C0000000085F60F88D6010000395C243C8B4424300F8683000000894424288B442434896C242CC74424380000000089C53B5C2428775031C0EB0D8B54242883C00129C239D3773F8B7C242C8D74050039DB8974244489D9F3A675DF8B54244485D2742383442438018B4C2440394C2438740C29EA01DA01D529542428EBB28B4C243885C974EC8B44243C8B7424308B6C242C29D80FAF4424388D44061089442404C7042400000000FF54247CC74424440000000085C08944242C894424380F8426FFFFFF3B5C24300F87A40000008B4424308B4C243401C1894C2428EB0B83E80139C30F87890000008B74242889EF89D929C639DB8974241CF3A675E18B54241C85D2746D89D68B4424348B5424382B74243483442444018914248974240889442404E8320100008B7C24388B4C243C8B44244801F701DE893C24894C240889442404E8120100008B542440037C243C017424342974243039542444897C24380F855EFFFFFF8B44244485C00F8452FFFFFF8B7424308B4424348B5424388974240889442404891424E8CC0000008B4424388B4C24788B7C244C01F08B7424442B44242C85FF89018B44247489300F8436FEFFFF8B44242C8B118D5410FF39D00F8324FEFFFF0FB60A32088808320A880A83EA01300883C00139D072E9E908FEFFFF8D5410FFF75C244039D073170FB60A32088808320A880A83EA01300883C00139D072E98D541DFF89E839D573170FB60A32088808320A880A83EA01300883C00139D072E98B4424488B74243C8D5430FF39D073170FB60A32088808320A880A83EA01300883C00139D072E9C744244C01000000E9B2FDFFFF56578B7C240C8B7424108B4C241485C9742FFC83F9087227F7C7010000007402A449F7C702000000740566A583E90289CAC1E902F3A589D183E103F3A4EB02F3A45F5EC3")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	$Binary = Binary($Binary)
	$Search = Binary($Search)
	$Replace = Binary($Replace)

	Local $BinaryLen = BinaryLen($Binary)
	Local $SearchLen = BinaryLen($Search)
	Local $ReplaceLen = BinaryLen($Replace)

	Local $Len1 = BinaryLen($Binary)
	Local $Buffer1 = DllStructCreate("byte[" & $Len1 & "]")
	DllStructSetData($Buffer1, 1, $Binary)

	Local $Len2 = BinaryLen($Search)
	Local $Buffer2 = DllStructCreate("byte[" & $Len2 & "]")
	DllStructSetData($Buffer2, 1, $Search)

	Local $Len3 = BinaryLen($Replace)
	Local $Buffer3 = DllStructCreate("byte[" & $Len3 & "]")
	DllStructSetData($Buffer3, 1, $Replace)

	Local $Var = DllStructCreate("ptr bin1; uint len1; ptr bin2; uint len2; ptr bin3; uint len3; int occur; ")
	DllStructSetData($Var, "bin1", DllStructGetPtr($Buffer1))
	DllStructSetData($Var, "bin2", DllStructGetPtr($Buffer2))
	DllStructSetData($Var, "bin3", DllStructGetPtr($Buffer3))
	DllStructSetData($Var, "len1", $Len1)
	DllStructSetData($Var, "len2", $Len2)
	DllStructSetData($Var, "len3", $Len3)
	DllStructSetData($Var, "occur", $Occur)

	Local $Ret = DllCall($__Binary_User32Dll, "uint", "CallWindowProc", "ptr", $CodeBufferPtr, _
																		"ptr", DllStructGetPtr($Var), _
																		"uint*", 0, _
																		"uint*", 0, _
																		"ptr", $ReAllocPtr)

	Local $Result, $Count
	If $Ret[0] Then
		Local $Buffer = DllStructCreate("byte[" & $Ret[4] & "]", $Ret[0])
		$Result = DllStructGetData($Buffer, 1)
		$Count = $Ret[3]
		__Binary_Free($Ret[0])
	Else
		$Result = DllStructGetData($Buffer1, 1)
		$Count = 0
	EndIf

	Return SetExtended($Count, $Result)
EndFunc

Func _BinarySplit($Binary, $Search)
	$Binary = Binary($Binary)
	$Search = Binary($Search)

	Local $SearchLen = BinaryLen($Search)
	Local $Array[1] = [0]
	Do
		Local $Pos = _BinaryInBin($Binary, $Search)

		$Array[0] += 1
		ReDim $Array[$Array[0] + 1]
		$Array[$Array[0]] = BinaryMid($Binary, 1, $Pos - 1)

		$Binary = BinaryMid($Binary, $Pos + $SearchLen)
	Until $Pos = 0

	Return $Array
EndFunc

Func _BinaryRandom($Length, $Start = 0, $To = 255, $Seed = 0)
	Static $CodeBufferPtr
	If Not $CodeBufferPtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x41574156415541545531ED5756534881ECF80900004585C948C78424D009000000000000745E4C8D54241044894C2410B801000000498D72044489CBC1EB1E4431CB4469CB6589076C468D0C0883C00144890E4883C6043D7002000075DB498D42044C899424D00900004C89D548898424D8090000498D823406000048898424E00900004589C341C1E8084538C376034587D885D20F84730100004C8D542410450FB6C0410FB6C34183C00183EA014129C0498D8238060000488D5C1101498D7204498DBA340600004D8D8AC00900004889442408EB4789C2C1EA0B31C289D0C1E0072580562C9D31D031D289C5C1E50F81E50000C6EF31C589E8C1E81231E841F7F0418D141388114883C1014839D90F84F8000000488BAC24D00900004885ED0F84870000004C8BBC24E00900004C8BA424D80900004D8D6F044C89E0448B308B55004C89A424D00900004983C4044C89AC24E00900004C89A424D80900004489F081E2000000804183E60125FFFFFF7F41F7DE09D04181E6DFB00899D1E84431F04133074D39CD89450074164D39CC0F8540FFFFFF4C899424D8090000E933FFFFFF4C899424E0090000EBE00F3131D04989F4BD010000008944241089C2C1EA1E31C269C26589076C01E883C501418904244983C40481FD7002000075DE4C899424D00900004889B424D80900004889F04889BC24E00900004C8B6C24084C89D54989FF4989F4E930FFFFFF4881C4F80900005B5E5F5D415C415D415E415FC3")
		Else
			$Code = Binary("0x5531D257565381ECE40900008BB424040A00008B9C24000A0000C78424D80900000000000085F6744C89742418B8010000008D4C241889F2C1EA1E31F269F26589076C8D343089348183C0013D7002000075E38D44241C89CA898424DC0900008D84244C060000898C24D8090000898424E0090000885C2413C1EB08385C2413760A0FB644241393884424138B8424FC09000085C00F84690100000FB6DB0FB644241383C3018DB424D8090000895C240C8D4C241831DB2944240C893424EB5289C2C1EA0B31C289D0C1E0072580562C9D31D031D289C6C1E60F81E60000C6EF31C689F0C1E81231F0F774240C8B8424F80900000254241388141883C301399C24FC0900000F86F90000008B9424D809000085D20F84850000008BAC24E00900008BBC24DC0900008D750489F8897424048B008B3289BC24D809000083C70489BC24DC0900008944240825FFFFFF7F81E60000008009F08B742408D1E883E601F7DE81E6DFB0089931F08B342433450089028B54240439F2899424E009000074153B3C240F8536FFFFFF898C24DC090000E92AFFFFFF898C24E0090000EBE20F3131D0BE010000008944241889C2C1EA1E31C269C26589076C01F08904B183C60181FE7002000075E38D44241C8D94244C06000089C78DB42450060000899424E00900008DAC244C06000089CA898C24D8090000898424DC09000089742404E92DFFFFFF81C4E40900005B5E5F5DC21000")
		EndIf
		$CodeBufferPtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	If $Length = 0 Then Return Binary("")

	Local $Buffer = DllStructCreate("byte[" & $Length & "]")
	Local $Ret = DllCall($__Binary_User32Dll, "uint", "CallWindowProc", "ptr", $CodeBufferPtr, _
																		"ptr", DllStructGetPtr($Buffer), _
																		"uint", $Length, _
																		"word", $To * 256 + $Start, _
																		"uint", $Seed)
	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryRight($Binary, $Count)
	Return BinaryMid($Binary, BinaryLen($Binary) - $Count + 1)
EndFunc

Func _BinaryLeft($Binary, $Count)
	Return BinaryMid($Binary, 1, $Count)
EndFunc

Func _BinaryTrimLeft($Binary, $Count)
	Return BinaryMid($Binary, $Count + 1)
EndFunc

Func _BinaryTrimRight($Binary, $Count)
	Return BinaryMid($Binary, 1, BinaryLen($Binary) - $Count)
EndFunc

Func _BinaryToInt16($Binary)
	Return BitAND(Int(Binary($Binary)), 0xFFFF)
EndFunc

Func _BinaryFromInt16($Value)
	Return _BinaryLeft(Binary(BitAND($Value, 0xFFFF)), 2)
EndFunc

Func _BinaryToInt32($Binary)
	Return BitAND(Int(Binary($Binary)), 0xFFFFFFFF)
EndFunc

Func _BinaryFromInt32($Value)
	Return Binary(BitAND($Value, 0xFFFFFFFF))
EndFunc

Func _BinaryToInt64($Binary)
	Local $Buffer = DllStructCreate("byte[8]")
	DllStructSetData($Buffer, 1, Binary($Binary))

	Return DllStructGetData(DllStructCreate("int64", DllStructGetPtr($Buffer)), 1)
EndFunc

Func _BinaryFromInt64($Value)
	Local $Buffer = DllStructCreate("int64")
	DllStructSetData($Buffer, 1, $Value)

	Return DllStructGetData(DllStructCreate("byte[8]", DllStructGetPtr($Buffer)), 1)
EndFunc

Func _BinaryToDouble($Binary)
	Local $Buffer = DllStructCreate("byte[8]")
	DllStructSetData($Buffer, 1, Binary($Binary))

	Return DllStructGetData(DllStructCreate("double", DllStructGetPtr($Buffer)), 1)
EndFunc

Func _BinaryFromDouble($Value)
	Local $Buffer = DllStructCreate("double")
	DllStructSetData($Buffer, 1, $Value)

	Return DllStructGetData(DllStructCreate("byte[8]", DllStructGetPtr($Buffer)), 1)
EndFunc

Func _BinaryToMemory($Binary, $Ptr)
	Local $Buffer = DllStructCreate("byte[" & BinaryLen($Binary) & "]", $Ptr)
	DllStructSetData($Buffer, 1, $Binary)
EndFunc

Func _BinaryFromMemory($Ptr, $Size = 1)
	Local $Buffer = DllStructCreate("byte[" & $Size & "]", $Ptr)
	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryToDLLStruct($Binary)
	Local $Buffer = DllStructCreate("byte[" & BinaryLen($Binary) & "]")
	DllStructSetData($Buffer, 1, $Binary)
	Return $Buffer
EndFunc

Func _BinaryFromDLLStruct(ByRef $DLLStruct)
	Local $Buffer = DllStructCreate("byte[" & DllStructGetSize($DLLStruct) & "]", DllStructGetPtr($DLLStruct))
	Return DllStructGetData($Buffer, 1)
EndFunc

Func _BinaryFillDLLStruct($Binary, ByRef $DLLStruct)
	Local $Buffer = DllStructCreate("byte[" & DllStructGetSize($DLLStruct) & "]", DllStructGetPtr($DLLStruct))
	DllStructSetData($Buffer, 1, $Binary)
EndFunc

Func _BitShift64($Value, $Shift)
	Return _BinaryToInt64(_BinaryShift(_BinaryFromInt64($Value), $Shift))
EndFunc

Func _BitRotate64($Value, $Shift)
	Return _BinaryToInt64(_BinaryRotate(_BinaryFromInt64($Value), $Shift))
EndFunc

Func _BitNOT64($Value)
	Return _BinaryToInt64(_BinaryNOT(_BinaryFromInt64($Value)))
EndFunc

Func _BitXOR64($Value1, $Value2, $Value3 = 0, $Value4 = 0, $Value5 = 0, $Value6 = 0, $Value7 = 0, $Value8 = 0, $Value9 = 0, $Value10 = 0, $Value11 = 0, $Value12 = 0, $Value13 = 0, $Value14 = 0, $Value15 = 0, $Value16 = 0, $Value17 = 0, $Value18 = 0, $Value19 = 0, $Value20 = 0)
	Local $Ret = _BinaryFromInt64($Value1)
	For $i = 2 To @NumParams
		$Ret = _BinaryXOR($Ret, _BinaryFromInt64(Eval("Value" & $i)))
	Next
	Return _BinaryToInt64($Ret)
EndFunc

Func _BitAND64($Value1, $Value2, $Value3 = 0, $Value4 = 0, $Value5 = 0, $Value6 = 0, $Value7 = 0, $Value8 = 0, $Value9 = 0, $Value10 = 0, $Value11 = 0, $Value12 = 0, $Value13 = 0, $Value14 = 0, $Value15 = 0, $Value16 = 0, $Value17 = 0, $Value18 = 0, $Value19 = 0, $Value20 = 0)
	Local $Ret = _BinaryFromInt64($Value1)
	For $i = 2 To @NumParams
		$Ret = _BinaryAND($Ret, _BinaryFromInt64(Eval("Value" & $i)))
	Next
	Return _BinaryToInt64($Ret)
EndFunc

Func _BitOR64($Value1, $Value2, $Value3 = 0, $Value4 = 0, $Value5 = 0, $Value6 = 0, $Value7 = 0, $Value8 = 0, $Value9 = 0, $Value10 = 0, $Value11 = 0, $Value12 = 0, $Value13 = 0, $Value14 = 0, $Value15 = 0, $Value16 = 0, $Value17 = 0, $Value18 = 0, $Value19 = 0, $Value20 = 0)
	Local $Ret = _BinaryFromInt64($Value1)
	For $i = 2 To @NumParams
		$Ret = _BinaryOR($Ret, _BinaryFromInt64(Eval("Value" & $i)))
	Next
	Return _BinaryToInt64($Ret)
EndFunc

Func _Hex64($Value, $Len = 16)
	Local $Binary = _BinaryReverse(_BinaryFromInt64($Value))
	Return StringRight(StringTrimLeft($Binary, 2), $Len)
EndFunc

Func _Dec64($Hex)
	If Mod(StringLen($Hex), 2) = 1 Then $Hex = "0" & $Hex
	Return _BinaryToInt64(_BinaryReverse("0x" & $Hex))
EndFunc
