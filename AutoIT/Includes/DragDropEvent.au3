; ===============================================================================================================================
; File     : DragDropEvent.au3 (2012/3/15)
; Purpose  : Convert OLE drag-and-drop event to "Windows Message" that AutoIt3 can handle by GUIRegisterMsg
;            Provide 4 message: $WM_DRAGENTER, $WM_DRAGOVER, $WM_DRAGLEAVE, and $WM_DROP
; Author   : Ward
; ===============================================================================================================================

#Include-once
#Include <Memory.au3>
#Include <SendMessage.au3>
#Include <WindowsConstants.au3>

; ===============================================================================================================================
; Public Functions:
;
; DragDropEvent_Startup()
;	DragDropEvent UDF startup.
;
; DragDropEvent_Register($hWnd, $hWndToReceiveMsg = $hWnd)
;	Register a window or control that can be the target. $hWndToReceiveMsg is needed only when $hWnd is a control.
;
; DragDropEvent_Revoke($hWnd)
;   Revokes the registration of the specified window or control.
;
; DragDropEvent_GetHWnd($wParam)
;   Can invoke by all message handler, to get what window or control is the target.
;
; DragDropEvent_GetX($wParam)
; DragDropEvent_GetY($wParam)
; DragDropEvent_GetKeyState($wParam)
;   Can invoke by all message handler except $WM_DRAGLEAVE, to get the modifier keys and mouse position.
;
; DragDropEvent_IsText($wParam)
; DragDropEvent_IsFile($wParam)
;   Can invoke by $WM_DRAGENTER or $WM_DROP, to check what data is being dragged.
;
; DragDropEvent_GetText($wParam)
; DragDropEvent_GetFile($wParam)
;   Can invoke by $WM_DRAGENTER or $WM_DROP, to get related data. Path of file is splited by "|".
;
; ===============================================================================================================================

; ===============================================================================================================================
; Internal Functions:
;
; IDropTarget_QueryInterface($pSelf, $pRIID, $pObj)
; IDropTarget_AddRef($pSelf)
; IDropTarget_Release($pSelf)
; IDropTarget_DragEnter($pSelf, $DataObj, $KeyState, $X, $Y, $pEffect)
; IDropTarget_DragLeave($pSelf)
; IDropTarget_DragOver($pSelf, $KeyState, $X, $Y, $pEffect)
; IDropTarget_Drop($pSelf, $DataObj, $KeyState, $X, $Y, $pEffect)
; IDropTarget_SetEffect($pEffect, $Value)
;   Methods of IDropTarget interface.
;
; IDropTarget_SetHWnd($pSelf, $hWnd, $hWndToReceiveMsg)
; IDropTarget_GetHWnd($pSelf, ByRef $hWnd, ByRef $hWndToReceiveMsg)
;   To set and get data store in IDropTarget interface.
;
; DataObject_QueryText($DataObj)
; DataObject_QueryFile($DataObj)
; DataObject_GetText($DataObj)
; DataObject_GetFile($DataObj)
;   Functions to handle DataObject.
;
; DragDropEvent_InfoCreate($hWnd, $DataObj, $KeyState, $X, $Y)
; DragDropEvent_Get($wParam, $Name)
;   Functions to handle infomation data for DragDropEvent.
;
; __CreateCOMInterface($sFunctionPrefix, $dtagInterface, $fNoUnknown = False, $ExtraSpace = 0)
;   To create vtable of a COM interface. Modify from _AutoItObject_ObjectFromDtag.
;
; ===============================================================================================================================

; ===============================================================================================================================
; Global const and variables
; ===============================================================================================================================

; Define 4 kind of DragDropEvent: DragEnter, DragOver, DragLeave, and Drop
Global Enum $WM_DRAGENTER = $WM_USER + 0x1001, $WM_DRAGOVER, $WM_DRAGLEAVE, $WM_DROP

; Message handler return one of these flags, which indicates what the result of the drop operation would be.
Global Enum $DROPEFFECT_NONE = 0, $DROPEFFECT_COPY = 1, $DROPEFFECT_MOVE = 2, $DROPEFFECT_LINK = 4, $DROPEFFECT_SCROLL = 0x80000000

Global Const $IID_IDataObject = "{0000010e-0000-0000-C000-000000000046}"

Global Const $dtagIDropTarget = "DragEnter hresult(ptr;uint;uint64;ptr);DragOver hresult(uint;uint64;ptr);DragLeave hresult();Drop hresult(ptr;uint;uint64;ptr);"
Global Const $dtagIDataObject = "GetData hresult(struct*;struct*);GetDataHere hresult(struct*;struct*);QueryGetData hresult(struct*);GetCanonicalFormatEtc hresult(struct*;struct*);SetData hresult(struct*;struct*;int);EnumFormatEtc hresult(uint;ptr);DAdvise hresult(struct*;uint;ptr;ptr);DUnadvise hresult(uint);EnumDAdvise hresult(ptr);"

Global Const $tagFORMATETC = "struct;uint Format;ptr ptd;uint Aspect;int lindex;uint tymed;endstruct"
Global Const $tagSTGMEDIUM = "struct;uint tymed;ptr hGlobal;ptr UnkForRelease;endstruct"
Global Const $tagDragDropEventInfo = "ptr hwnd;ptr DataObj;uint KeyState;uint x;uint y"

Global Const $__KERNEL32_DLL = DllOpen("kernel32.dll")
Global Const $__OLE32_DLL = DllOpen("ole32.dll")
Global $__IDropTargetLen = 0

; ===============================================================================================================================
; DragDropEvent startup and register functions
; ===============================================================================================================================

Func DragDropEvent_Startup()
	If @AutoItVersion < "3.3.8.0" Then Exit MsgBox(16, "DragDropEvent Fail", "Require AutoIt Version 3.3.8.0 at least")

	DllCall($__OLE32_DLL, "int", "OleInitialize", "ptr", 0)
EndFunc

Func DragDropEvent_Register($hWnd, $hWndToReceiveMsg = Default)
	If IsKeyword($hWndToReceiveMsg) Then $hWndToReceiveMsg = $hWnd

	Local $IDropTarget = __CreateCOMInterface("IDropTarget_", $dtagIDropTarget, True, 2) ; add 2 extra space to store hWnd
	If $IDropTarget Then
		$__IDropTargetLen = @Extended

		IDropTarget_SetHWnd($IDropTarget, $hWnd, $hWndToReceiveMsg)
		DllCall($__OLE32_DLL, "int", "RegisterDragDrop", "hwnd", $hWnd, "ptr", $IDropTarget)
	EndIf
EndFunc

Func DragDropEvent_Revoke($hWnd)
	DllCall($__OLE32_DLL, "int", "RevokeDragDrop", "hwnd", $hWnd)
EndFunc

; ===============================================================================================================================
; Methods of IDropTarget interface
; ===============================================================================================================================

Func IDropTarget_QueryInterface($pSelf, $pRIID, $pObj)
	Return 0x80004002 ; E_NOINTERFACE
EndFunc

Func IDropTarget_AddRef($pSelf)
EndFunc

Func IDropTarget_Release($pSelf)
	DllCall($__OLE32_DLL, "none", "CoTaskMemFree", "ptr", $pSelf)
EndFunc

Func IDropTarget_DragEnter($pSelf, $DataObj, $KeyState, $Point, $pEffect)
	Local $hWnd, $hWndToReceiveMsg
	IDropTarget_GetHWnd($pSelf, $hWnd, $hWndToReceiveMsg)

	Local $X = BitAND($Point, 0xFFFFFFFF), $Y = Dec(StringTrimRight(Hex($Point), 8))
	Local $Info = DragDropEvent_InfoCreate($hWnd, $DataObj, $KeyState, $X, $Y)
	Local $Ret = _SendMessage($hWndToReceiveMsg, $WM_DRAGENTER, DllStructGetPtr($Info), 0)
	DllStructSetData(DllStructCreate("dword", $pEffect), 1, $Ret)
EndFunc

Func IDropTarget_DragLeave($pSelf)
	Local $hWnd, $hWndToReceiveMsg
	IDropTarget_GetHWnd($pSelf, $hWnd, $hWndToReceiveMsg)

	Local $Info = DragDropEvent_InfoCreate($hWnd, 0, 0, 0, 0)
	_SendMessage($hWndToReceiveMsg, $WM_DRAGLEAVE, DllStructGetPtr($Info), 0)
EndFunc

Func IDropTarget_DragOver($pSelf, $KeyState, $Point, $pEffect)
	Local $hWnd, $hWndToReceiveMsg
	IDropTarget_GetHWnd($pSelf, $hWnd, $hWndToReceiveMsg)

	Local $X = BitAND($Point, 0xFFFFFFFF), $Y = Dec(StringTrimRight(Hex($Point), 8))
	Local $Info = DragDropEvent_InfoCreate($hWnd, 0, $KeyState, $X, $Y)
	Local $Ret = _SendMessage($hWndToReceiveMsg, $WM_DRAGOVER, DllStructGetPtr($Info), 0)
	DllStructSetData(DllStructCreate("dword", $pEffect), 1, $Ret)
EndFunc

Func IDropTarget_Drop($pSelf, $DataObj, $KeyState, $Point, $pEffect)
	Local $hWnd, $hWndToReceiveMsg
	IDropTarget_GetHWnd($pSelf, $hWnd, $hWndToReceiveMsg)

	Local $X = BitAND($Point, 0xFFFFFFFF), $Y = Dec(StringTrimRight(Hex($Point), 8))
	Local $Info = DragDropEvent_InfoCreate($hWnd, $DataObj, $KeyState, $X, $Y)
	Local $Ret = _SendMessage($hWndToReceiveMsg, $WM_DROP, DllStructGetPtr($Info), 0)
	DllStructSetData(DllStructCreate("dword", $pEffect), 1, $Ret)
EndFunc

Func IDropTarget_SetHWnd($pSelf, $hWnd, $hWndToReceiveMsg)
	Local $Buffer = DllStructCreate("ptr[" & ($__IDropTargetLen + 2) & "]", $pSelf)
	DllStructSetData($Buffer, 1, $hWnd, $__IDropTargetLen + 1)
	DllStructSetData($Buffer, 1, $hWndToReceiveMsg, $__IDropTargetLen + 2)
EndFunc

Func IDropTarget_GetHWnd($pSelf, ByRef $hWnd, ByRef $hWndToReceiveMsg)
	Local $Buffer = DllStructCreate("ptr[" & ($__IDropTargetLen + 2) & "]", $pSelf)
	$hWnd = DllStructGetData($Buffer, 1, $__IDropTargetLen + 1)
	$hWndToReceiveMsg = DllStructGetData($Buffer, 1, $__IDropTargetLen + 2)
EndFunc

; ===============================================================================================================================
; Functions to handle DataObject
; ===============================================================================================================================

Func DataObject_QueryText($DataObj)
	Local $IDataObj = ObjCreateInterface($DataObj, $IID_IDataObject, $dtagIDataObject)
	If Not IsObj($IDataObj) Then Return -1
	$IDataObj.AddRef()

	Local $FORMATETC = DllStructCreate($tagFORMATETC)
	DllStructSetData($FORMATETC, "Format", 13) ; 13 = CF_UNICODETEXT
	DllStructSetData($FORMATETC, "Aspect", 1)
	DllStructSetData($FORMATETC, "lindex", -1)
	DllStructSetData($FORMATETC, "tymed", 1) ; 1 = TYMED_HGLOBAL

	Local $Ret = $IDataObj.QueryGetData($FORMATETC)
	If $Ret <> 0 Then
		DllStructSetData($FORMATETC, "Format", 1) ; 1 = CF_TEXT
		$Ret = $IDataObj.QueryGetData($FORMATETC)
	EndIf
	Return $Ret
EndFunc

Func DataObject_QueryFile($DataObj)
	Local $IDataObj = ObjCreateInterface($DataObj, $IID_IDataObject, $dtagIDataObject)
	If Not IsObj($IDataObj) Then Return -1
	$IDataObj.AddRef()

	Local $FORMATETC = DllStructCreate($tagFORMATETC)
	DllStructSetData($FORMATETC, "Format", 15) ; 15 = CF_HDROP
	DllStructSetData($FORMATETC, "Aspect", 1)
	DllStructSetData($FORMATETC, "lindex", -1)
	DllStructSetData($FORMATETC, "tymed", 1) ; 1 = TYMED_HGLOBAL
	Return $IDataObj.QueryGetData($FORMATETC)
EndFunc

Func DataObject_GetText($DataObj)
	Local $IDataObj = ObjCreateInterface($DataObj, $IID_IDataObject, $dtagIDataObject)
	If Not IsObj($IDataObj) Then Return -1
	$IDataObj.AddRef()

	Local $FORMATETC = DllStructCreate($tagFORMATETC)
	Local $STGMEDIUM = DllStructCreate($tagSTGMEDIUM)
	DllStructSetData($FORMATETC, "Format", 13) ; 13 = CF_UNICODETEXT
	DllStructSetData($FORMATETC, "Aspect", 1)
	DllStructSetData($FORMATETC, "lindex", -1)
	DllStructSetData($FORMATETC, "tymed", 1) ; 1 = TYMED_HGLOBAL

	Local $IsUnicode = True
	Local $Ret = $IDataObj.QueryGetData($FORMATETC)
	If $Ret <> 0 Then
		$IsUnicode = False
		DllStructSetData($FORMATETC, "Format", 1) ; 1 = CF_TEXT
		$Ret = $IDataObj.QueryGetData($FORMATETC)
	EndIf
	If $Ret <> 0 Then Return SetError(1, 0, "")

	Local $Error = 1, $Text = ""
	If $IDataObj.GetData($FORMATETC, $STGMEDIUM) = 0 Then
		If DllStructGetData($STGMEDIUM, "tymed") = 1 Then
			Local $Ptr = _MemGlobalLock(DllStructGetData($STGMEDIUM, "hGlobal"))
			Local $Tag
			If $IsUnicode Then
				$Tag = "wchar[" & (_MemGlobalSize($Ptr) / 2) & "]"
			Else
				$Tag = "char[" & _MemGlobalSize($Ptr) & "]"
			EndIf
			$Text = DllStructGetData(DllStructCreate($Tag, $Ptr), 1)
			_MemGlobalUnlock($Ptr)
			If DllStructGetData($STGMEDIUM, "UnkForRelease") = 0 Then _MemGlobalFree($Ptr)
			$Error = 0
		EndIf
	EndIf
	Return SetError($Error, 0, $Text)
EndFunc

Func DataObject_GetFile($DataObj)
	Local $IDataObj = ObjCreateInterface($DataObj, $IID_IDataObject, $dtagIDataObject)
	If Not IsObj($IDataObj) Then Return -1
	$IDataObj.AddRef()

	Local $FORMATETC = DllStructCreate($tagFORMATETC)
	Local $STGMEDIUM = DllStructCreate($tagSTGMEDIUM)
	DllStructSetData($FORMATETC, "Format", 15) ; 15 = CF_HDROP
	DllStructSetData($FORMATETC, "Aspect", 1)
	DllStructSetData($FORMATETC, "lindex", -1)
	DllStructSetData($FORMATETC, "tymed", 1) ; 1 = TYMED_HGLOBAL

	Local $Error = 1, $FileList = ""
	If $IDataObj.GetData($FORMATETC, $STGMEDIUM) = 0 Then
		If DllStructGetData($STGMEDIUM, "tymed") = 1 Then
			Local $Ptr = _MemGlobalLock(DllStructGetData($STGMEDIUM, "hGlobal"))
			Local $StrPtr = $Ptr + DllStructGetData(DllStructCreate("dword", $Ptr), 1)
			Do
				Local $Ret = DllCall($__KERNEL32_DLL, "uint", "lstrlenW", "ptr", $StrPtr)
				Local $StrLen = $Ret[0]
				If $StrLen Then
					Local $Str = DllStructGetData(DllStructCreate("wchar[" & $StrLen & "]", $StrPtr), 1)
					$FileList &= $Str & "|"
					$StrPtr += $StrLen * 2 + 2
				EndIf
			Until $StrLen = 0
			If StringRight($FileList, 1) = "|" Then $FileList = StringTrimRight($FileList, 1)
			_MemGlobalUnlock($Ptr)
			If DllStructGetData($STGMEDIUM, "UnkForRelease") = 0 Then _MemGlobalFree($Ptr)
			$Error = 0
		EndIf
	EndIf
	Return SetError($Error, 0, $FileList)
EndFunc

; ===============================================================================================================================
; Functions to handle infomation data for DragDropEvent
; ===============================================================================================================================

Func DragDropEvent_InfoCreate($hWnd, $DataObj, $KeyState, $X, $Y)
	Local $Info = DllStructCreate($tagDragDropEventInfo)
	DllStructSetData($Info, "hwnd", $hWnd)
	DllStructSetData($Info, "DataObj", $DataObj)
	DllStructSetData($Info, "KeyState", $KeyState)
	DllStructSetData($Info, "x", $X)
	DllStructSetData($Info, "y", $Y)
	Return $Info
EndFunc

Func DragDropEvent_Get($wParam, $Name)
	If Not $wParam Then Return SetError(1, 0, 0)
	Local $Info = DllStructCreate($tagDragDropEventInfo, $wParam)
	Return DllStructGetData($Info, $Name)
EndFunc

Func DragDropEvent_GetHWnd($wParam)
	Local $Ret = DragDropEvent_Get($wParam, "hwnd")
	Return SetError(@Error, 0, $Ret)
EndFunc

Func DragDropEvent_GetX($wParam)
	Local $Ret = DragDropEvent_Get($wParam, "x")
	Return SetError(@Error, 0, $Ret)
EndFunc

Func DragDropEvent_GetY($wParam)
	Local $Ret = DragDropEvent_Get($wParam, "y")
	Return SetError(@Error, 0, $Ret)
EndFunc

Func DragDropEvent_GetKeyState($wParam)
	Local $Ret = DragDropEvent_Get($wParam, "KeyState")
	Return SetError(@Error, 0, $Ret)
EndFunc

Func DragDropEvent_IsText($wParam)
	Local $DataObj = DragDropEvent_Get($wParam, "DataObj")
	Return DataObject_QueryText($DataObj) = 0
EndFunc

Func DragDropEvent_IsFile($wParam)
	Local $DataObj = DragDropEvent_Get($wParam, "DataObj")
	Return DataObject_QueryFile($DataObj) = 0
EndFunc

Func DragDropEvent_GetText($wParam)
	Local $DataObj = DragDropEvent_Get($wParam, "DataObj")
	Return DataObject_GetText($DataObj)
EndFunc

Func DragDropEvent_GetFile($wParam)
	Local $DataObj = DragDropEvent_Get($wParam, "DataObj")
	Return DataObject_GetFile($DataObj)
EndFunc

; ===============================================================================================================================
; Functions to create COM interface
; ===============================================================================================================================

Func __CreateCOMInterface($sFunctionPrefix, $dtagInterface, $fNoUnknown = False, $ExtraSpace = 0)
	; Original is _AutoItObject_ObjectFromDtag in AutoItObject.au3 by AutoItObject-Team
	; Modify by Ward

	Local Const $__PtrSize = DllStructGetSize(DllStructCreate('ptr', 1))
	Local Const $dtagIUnknown = "QueryInterface hresult(ptr;ptr*);AddRef dword();Release dword();"

	If $fNoUnknown Then $dtagInterface = $dtagIUnknown & $dtagInterface
	Local $sMethods = StringReplace(StringRegExpReplace($dtagInterface, "\h*(\w+)\h*(\w+\*?)\h*(\((.*?)\))\h*(;|;*\z)", "$1\|$2;$4" & @LF), ";" & @LF, @LF)
	If $sMethods = $dtagInterface Then $sMethods = StringReplace(StringRegExpReplace($dtagInterface, "\h*(\w+)\h*(;|;*\z)", "$1\|" & @LF), ";" & @LF, @LF)
	$sMethods = StringTrimRight($sMethods, 1)
	$sMethods = StringReplace(StringReplace(StringReplace(StringReplace($sMethods, "object", "idispatch"), "variant*", "ptr"), "hresult", "long"), "bstr", "ptr")

	Local $aMethods = StringSplit($sMethods, @LF, 3)
	Local $iUbound = UBound($aMethods)
	Local $sMethod, $aSplit, $sNamePart, $aTagPart, $sTagPart, $sRet, $sParams, $hCallback

	Local $AllocSize = $__PtrSize * ($iUbound + 1 + $ExtraSpace)
	Local $Ret = DllCall($__OLE32_DLL, "ptr", "CoTaskMemAlloc", "uint_ptr", $AllocSize)
	If @error Then Return SetError(1, 0, 0)
	Local $AllocPtr = $Ret[0]

	Local $tInterface = DllStructCreate("ptr[" & $iUbound + 1 & "]", $AllocPtr)
	If @error Then Return SetError(1, 0, 0)
	For $i = 0 To $iUbound - 1
		$aSplit = StringSplit($aMethods[$i], "|", 2)
		If UBound($aSplit) <> 2 Then ReDim $aSplit[2]
		$sNamePart = $aSplit[0]
		$sTagPart = $aSplit[1]
		$sMethod = $sFunctionPrefix & $sNamePart
		$aTagPart = StringSplit($sTagPart, ";", 2)
		$sRet = $aTagPart[0]
		$sParams = StringReplace($sTagPart, $sRet, "", 1)
		$sParams = "ptr" & $sParams

		; To avoid repeat allocate the same callback, a memory leakage
		$hCallback = Eval(":Callback:" & $sMethod)
		If Not $hCallback Then
			$hCallback = DllCallbackRegister($sMethod, $sRet, $sParams)
			Assign(":Callback:" & $sMethod, $hCallback, 2)
		EndIf
		DllStructSetData($tInterface, 1, DllCallbackGetPtr($hCallback), $i + 2)
	Next
	DllStructSetData($tInterface, 1, $AllocPtr + $__PtrSize) ; Interface method pointers are actually pointer size away
	Return SetExtended($iUbound + 1, $AllocPtr) ; Return interface size as @Extended for access extra space
EndFunc
