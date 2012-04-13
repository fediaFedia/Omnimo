; =============================================================================
;  AutoIt IconImage UDF (2011.9.21)
;  Purpose: Icon Management And Conversion (Among IconImage/hIcon/.ico)
;  Author: Ward
;  Required:
;	"Binary.au3"		by Ward
;	"WinAPIEx.au3"		by Yashied
; =============================================================================

#Include-once
#Include <Constants.au3>
#Include <WinAPI.au3>
#Include <GDIPlus.au3>
#Include <Memory.au3>

#Include "Binary.au3"
#Include "WinAPIEx.au3"
#Include "APIConstants.au3"

; =============================================================================
;  Functions List
;	_IconImage_Startup()
;	_IconImage_Shutdown()
;
;	_IconImage_FromPath($Path, $Width, $Height = Default)
;	_IconImage_FromPE($IconPE, $Index, $Width, $Height = Default)
;	_IconImage_FromPEEx($IconFile, $Width, $Height = Default)
;
;	_IconImage_FromIcoData($IconData, $Width, $Height = Default)
;	_IconImage_FromIcoFile($IconFile, $Width, $Height = Default)
;	_IconImage_FromImageData($ImageData)
;	_IconImage_FromImageFile($Filename)
;	_IconImage_FromGdipBitmap($Gdibmp)
;	_IconImage_FromHandle($Handle)
;
;	_IconImage_ToIcoData($IconImage)
;	_IconImage_ToIcoFile($IconImage, $Filename)
;	_IconImage_ToImageData($IconImage, $Type = "PNG")
;	_IconImage_ToImageFile($IconImage, $Filename, $Type = "PNG")
;	_IconImage_ToGdipBitmap($IconImage)
;	_IconImage_ToHandle($IconImage, $Width = Default, $Height = $GDIP_ModeInvalid)
;
;	_IconImage_IsPNGIcon($IconImage)
;	_IconImage_ConvertToBMPIcon($IconImage)
;	_IconImage_ConvertToPNGIcon($IconImage)
;
;	_IconImage_GetSize($IconImage)
;	_IconImage_Scale($IconImage, $Width, $Height = Default, $Quality = Default)
;	_IconImage_RotateFlip($IconImage, $Flag)
;	_IconImage_Merge($IconImage1, $IconImage2, $Align = 0, $X = 0, $Y = 0)
;	_IconImage_Overlay($IconImage1, $IconImage2) ; Deprecated
;
;  Functions Using Internally
;	_IconImage_FromGroupId($Module, $GroupId, $Width, $Height)
;	_IconImage_FromIconId($Module, $IconId)
;	_IconImage_CreateStream($InitData = Default)
;	_IconImage_ReadStream($Stream)
;	_IconImage_ReleaseStream($Stream)
;	_IconImage_SaveGdipBitmapToBinary($Gdibmp, $Type = "PNG")
;	_IconImage_LoadGdipBitmapFromBinary($Data)
;	_IconImage_32BitAlphaToGdipBitmap($IconImage)
;	_IconImage_CreateMaskBmp($ColorBmp)
;	_IconImage_VistaAndLater()
; =============================================================================

; for _IconImage_Merge()
Global Enum _
	$ICONIMAGE_ALIGN_TOP			= 1,	_
	$ICONIMAGE_ALIGN_MIDDLE			= 2,	_
	$ICONIMAGE_ALIGN_BOTTOM			= 4,	_
	$ICONIMAGE_ALIGN_LEFT			= 8,	_
	$ICONIMAGE_ALIGN_CENTER			= 16,	_
	$ICONIMAGE_ALIGN_RIGHT			= 32,	_
	$ICONIMAGE_ALIGN_TOPLEFT		= 9,	_
	$ICONIMAGE_ALIGN_TOPRIGHT		= 33,	_
	$ICONIMAGE_ALIGN_BOTTOMLEFT		= 12,	_
	$ICONIMAGE_ALIGN_BOTTOMRIGHT	= 36

; for _IconImage_RotateFlip()
Global Enum _
	$GDIP_RotateNoneFlipNone   = 0,	_
	$GDIP_Rotate90FlipNone     = 1,	_
	$GDIP_Rotate180FlipNone    = 2,	_
	$GDIP_Rotate270FlipNone    = 3,	_
	$GDIP_RotateNoneFlipX      = 4,	_
	$GDIP_Rotate90FlipX        = 5,	_
	$GDIP_Rotate180FlipX       = 6,	_
	$GDIP_Rotate270FlipX       = 7,	_
	$GDIP_RotateNoneFlipY      = $GDIP_Rotate180FlipX,		_
	$GDIP_Rotate90FlipY        = $GDIP_Rotate270FlipX,		_
	$GDIP_Rotate180FlipY       = $GDIP_RotateNoneFlipX,		_
	$GDIP_Rotate270FlipY       = $GDIP_Rotate90FlipX,			_
	$GDIP_RotateNoneFlipXY     = $GDIP_Rotate180FlipNone,		_
	$GDIP_Rotate90FlipXY       = $GDIP_Rotate270FlipNone,		_
	$GDIP_Rotate180FlipXY      = $GDIP_RotateNoneFlipNone,	_
	$GDIP_Rotate270FlipXY      = $GDIP_Rotate90FlipNone

; for _IconImage_Scale()
Global Enum _
	$GDIP_ModeInvalid				= -1,	_
	$GDIP_ModeDefault				= 0,	_
	$GDIP_ModeLowQuality			= 1,	_
	$GDIP_ModeHighQuality			= 2,	_
	$GDIP_ModeBilinear				= 3,	_
	$GDIP_ModeBicubic				= 4,	_
	$GDIP_ModeNearestNeighbor		= 5,	_
	$GDIP_ModeHighQualityBilinear	= 6,	_
	$GDIP_ModeHighQualityBicubic	= 7

Global $_IconImage_StartupRef = 0
Global $_IconImage_VistaFlag = 0
Global $_IconImage_PNG_Header = Binary("0x89504E470D0A1A0A")

Func _IconImage_Startup()
	If $_IconImage_StartupRef <= 0 Then
		_GDIPlus_Startup()
		$_IconImage_VistaFlag = _IconImage_VistaAndLater()
		$_IconImage_StartupRef = 0
	EndIf
	$_IconImage_StartupRef += 1
EndFunc

Func _IconImage_Shutdown()
	$_IconImage_StartupRef -= 1
	If $_IconImage_StartupRef = 0 Then
		_GDIPlus_Shutdown()
	EndIf
EndFunc

Func _IconImage_FromPath($Path, $Width, $Height = Default)
	If IsKeyword($Height) Then $Height = $Width
	Local $IconFile, $IconIndex, $IsSelf = False, $IsLink = False, $Ret

	; try to get link target
	If _WinAPI_PathFindExtension($Path) = ".lnk" Then
		Local $Array = FileGetShortcut($Path)
		If Not @Error Then
			$Path = $Array[0]
			$IsLink = True
		EndIf
	EndIf

	If _WinAPI_PathIsDirectory($Path) Then
		; SHGFI_ICONLOCATION usually works on folder
		Local $Info = DllStructCreate($tagSHFILEINFO)
		_WinAPI_ShellGetFileInfo($Path, $SHGFI_ICONLOCATION, 0, $Info)

		$IconFile = DllStructGetData($Info, "DisplayName")
		$IconIndex = DllStructGetData($Info, "iIcon")

		; can't get icon location, for example: fonts folder
		If Not $IconFile Then
			; try to get hIcon and then convert it to IconImage
			_WinAPI_ShellGetFileInfo($Path, BitOR($SHGFI_ICON, $SHGFI_SHELLICONSIZE), 0, $Info)
			Local $hIcon = DllStructGetData($Info, "hIcon")
			If $hIcon Then
				Local $IconImage = _IconImage_FromHandle($hIcon)
				If Not @Error Then $Ret = $IconImage

				_WinAPI_DestroyIcon($hIcon)
			EndIf

			; if fail, return the folder icon as default
			$IconFile = "shell32.dll"
			$IconIndex = 3
		EndIf
	Else
		Local $Ext = _WinAPI_PathFindExtension($Path)
		Local $IconPath = _WinAPI_AssocQueryString($Ext, $ASSOCSTR_DEFAULTICON)

		; no default icon, for example: .scr
		If Not $IconPath Then $IconPath = _WinAPI_AssocQueryString($Ext, $ASSOCSTR_EXECUTABLE)

		If $IconPath = "%1" Or $IconPath = '"%1"' Then
			$IconFile = $Path
			$IconIndex = 0
			$IsSelf = True
		Else
			$IconFile = $IconPath
			$IconIndex = Default
		EndIf
	EndIf

	; try to replace stardand icon in shell32.dll by imageres.dll (vista or windows 7)
	If Not $Ret And $_IconImage_VistaFlag Then
		Local $FileName = _WinAPI_PathFindFileName($IconFile)
		Select
		Case $FileName = "shell32.dll,2" Or ($FileName = "shell32.dll" And $IconIndex = 2)
			$Ret = _IconImage_FromPE("imageres.dll", 11, $Width, $Height)

		Case $FileName = "shell32.dll,0" Or ($FileName = "shell32.dll" And $IconIndex = 0)
			$Ret = _IconImage_FromPE("imageres.dll", 2, $Width, $Height)

		Case $FileName = "shell32.dll,3" Or ($FileName = "shell32.dll" And $IconIndex = 3)
			$Ret = _IconImage_FromPE("imageres.dll", 3, $Width, $Height)
		EndSelect
	EndIf

	; load icon as PE file with/without index
	If Not $Ret Then
		If IsKeyword($IconIndex) Then
			$Ret = _IconImage_FromPEEx($IconFile, $Width, $Height)
		Else
			$Ret = _IconImage_FromPE($IconFile, $IconIndex, $Width, $Height)
		EndIf
	EndIf

	; can't load as PE, try load as ICO file
	If Not $Ret Then
		$Ret = _IconImage_FromIcoFile($IconFile, $Width, $Height)
	EndIf

	; still fail and default icon is path itself (exe, msc, xml etc...), try get associated exe
	; if ext = .ico, means error on extracting icon from .ico file, let it be unknow file
	If Not $Ret And $IsSelf And $Ext <> ".ico" Then
		Local $ExeFile = _WinAPI_AssocQueryString($Ext, $ASSOCSTR_EXECUTABLE)
		If $ExeFile = "%1" Or $ExeFile = '"%1"' Then
			;exe without icon, get default icon for exe
			If $_IconImage_VistaFlag Then $Ret = _IconImage_FromPE("imageres.dll", 11, $Width, $Height)
			If Not $Ret Then $Ret = _IconImage_FromPE("shell32.dll", 2, $Width, $Height)
		Else
			$Ret = _IconImage_FromPE($ExeFile, 0, $Width, $Height)
		EndIf
	EndIf

	; still can't find any icon, use default icon of unknow
	If Not $Ret Then
		$IconFile = _WinAPI_AssocQueryString("Unknown", $ASSOCSTR_DEFAULTICON)
		If $_IconImage_VistaFlag And _WinAPI_PathFindFileName($IconFile) = "shell32.dll,0" Then
			$Ret = _IconImage_FromPE("imageres.dll", 2, $Width, $Height)
		EndIf
		If Not $Ret Then $Ret = _IconImage_FromPEEx($IconFile, $Width, $Height)
		If Not $Ret Then $Ret = _IconImage_FromPE("shell32.dll", 0, $Width, $Height)
	EndIf

	; add link mark
	If $Ret And $IsLink Then
		Local $Source = _IconImage_Scale($Ret, $Width, $Height)
		Local $LinkMark, $LinkW, $LinkH
		If $_IconImage_VistaFlag Then
			$LinkW = Int($Width / 1.5)
			$LinkH = Int($Height / 1.5)
			$LinkMark = _IconImage_FromPEEx("imageres.dll,154", $LinkW, $LinkH)
		Else
			;$LinkW = $Width
			;$LinkH = $Height
			;$LinkMark = _IconImage_FromPEEx("shell32.dll,29", $LinkW, $LinkH)

			; use the beautiful vista link mark instead under XP
			$LinkW = Int($Width / 3)
			$LinkH = Int($Height / 3)
			$LinkMark = _IconImage_FromImageData(Binary("0x89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF610000000970485973000016250000162501495224F00000022C4944415478DA9D534D6B1351140DE8A28B8A82581391366D6D71E54AF063152C8A96128DB689D2953FC06574A168104B2D8DCE649A2FBB2D42510B2E14140417C1EA46A882D68592566D9B6A6326C94CDB79133D9E37C5F8311BE9E2C03BF7CD39F7DC3B3CCFD04802D1E8F975615053E19107FD470D05DBC6BC65C3FCFE7FB0A9915AC76081E2BC2EF0D91018B8FD028D87E3F01DD7D071FA163ACF64EBD8114AA293B5E59A804593BA41A166E343C9C22C4DAA350B779FBD476B380DDF090D2DBD19B4F4A58834B6F5A8F0873498F63F068B34C8D36046A630053B58888D4D626BB7027F3843B33534D160D729D59D401ACC9405660993E247531FD116CEC2DFF75BDC1AC962BB6390701B7C2191E26F14BFCC17B1BB7F14CDBD290AB38EB8F964123B43234CA0A08306AE11BE92CC2F0B146D0B3D17EEA129A8A13D9271E2FB822ABCDDC39C5D45E3A141B487147782224989DD73D305788309B431EE2FF18603318C3F7D83E7EFE6E0D97F05DEA3D7DD062512B9B8ECC357D8724C710C64E48D0763B8313E8915DE494CE4DE6273E0AA7B049D447E907E30854D47E25C5E1A0D810144938F9D7A851D2B14C9F3FDDCB43B4199C4E0E593D79FD0D035CC3134F838F79C6E50C4E55A16F4551A09E170974195646955389D02E7C6E0D973117BCF8E3A1D4DD6741A94890A5115967B048364917FC1E0C70B6513914B77E0D97719FDB109677955D6ABEC6E5028C5AE04F261ACB060D52120FEE0E2AFBB35D41FD3B59BF1753F6725A5E127FA9CFE5079A665AB0000000049454E44AE426082"))
		EndIf
		$LinkMark = _IconImage_Scale($LinkMark, $LinkW, $LinkH, $GDIP_ModeHighQuality)
		If $Source And $LinkMark Then
			$Source = _IconImage_Merge($Source, $LinkMark, $ICONIMAGE_ALIGN_BOTTOMLEFT)
			If Not @Error Then $Ret = $Source
		EndIf
	EndIf

	If Not $Ret Then Return SetError(1, 0, Binary(""))
	Return $Ret
EndFunc

Func _IconImage_FromPE($IconPE, $Index, $Width, $Height = Default)
	If IsKeyword($Height) Then $Height = $Width

	Local $Module, $Error = 1, $IconImage = Binary("")
	Do
		$Module = _WinAPI_LoadLibraryEx($IconPE, $LOAD_LIBRARY_AS_DATAFILE)
		If $Module = 0 Then ExitLoop

		$Index = Int($Index)
		If $Index >= 0 Then ; $Index = index
			Local $Array = _WinAPI_EnumResourceNames($Module, 14)
			If Not IsArray($Array) Or $Array[0] < $Index + 1 Then ExitLoop

			$IconImage = _IconImage_FromGroupId($Module, $Array[$Index + 1], $Width, $Height)
		Else ; $Index = -(id)
			$IconImage = _IconImage_FromGroupId($Module, -$Index, $Width, $Height)
		EndIf
		$Error = @Error
	Until 1
	If $Module Then _WinAPI_FreeLibrary($Module)
	Return SetError($Error, 0, $IconImage)
EndFunc

Func _IconImage_FromPEEx($IconFile, $Width, $Height = Default)
	Local $Ret
	Local $Array = _WinAPI_PathParseIconLocation($IconFile)
	If Not @Error Then
		$Ret = _IconImage_FromPE($Array[0], $Array[1], $Width, $Height)
	Else
		$Ret = _IconImage_FromPE($IconFile, 0, $Width, $Height)
	EndIf
	Return SetError(@Error, 0, $Ret)
EndFunc

Func _IconImage_FromIcoData($IconData, $Width, $Height = Default, $Index = Default)
	If IsKeyword($Height) Then $Height = $Width

	Local $Buffer = _BinaryToDLLStruct($IconData)
	Local $Ptr = DllStructGetPtr($Buffer)
	If @Error Then Return SetError(1, 0, Binary(""))

	Local $IconDir = DllStructCreate("align 1;dword Identify;word Count", $Ptr)
	Local $EntryPtr = $Ptr + DllStructGetSize($IconDir)

	; check is this a icon file
	If DllStructGetData($IconDir, "Identify") <> 0x10000 Then Return SetError(1, 0, Binary(""))
	Local $Count = DllStructGetData($IconDir, "Count")

	If Not IsKeyword($Index) Then
		; $Index = 0 ~ $Count - 1, negative value means count from last icon
		; if $Index is invaild value (for exampel, very big value), return $Count in @Extended
		$Index = Int($Index)
		If $Index < 0 Then $Index = $Count + $Index
		If $Index < 0 Or $Index >= $Count Then Return SetError(1, $Count, Binary(""))

		$EntryPtr += 16 * $Index
		Local $IconDirEntry = DllStructCreate("dword[2];dword size;dword offset", $EntryPtr)
		Local $Size = DllStructGetData($IconDirEntry, "size")
		Local $Offset = DllStructGetData($IconDirEntry, "offset")

		Return _BinaryFromMemory($Ptr + $Offset, $Size)

	Else
		; if $Index = Default, choice icon by LookupIconIdFromDirectoryEx
		; MSDN: Searches through icon or cursor data for the icon or cursor that best fits the current display device.
		Local $IconGroup = _BinaryFromDLLStruct($IconDir)
		Local $Size[$Count]
		Local $Offset[$Count]

		For $i = 0 To $Count - 1
			Local $IconDirEntry = DllStructCreate("dword[2];dword size;dword offset", $EntryPtr)
			Local $IconDirEntryHead = DllStructCreate("byte[12]", $EntryPtr)

			; convert offset (dword) to index (word)
			$IconGroup &= DllStructGetData($IconDirEntryHead, 1) & _BinaryFromInt16($i + 1)

			$Size[$i] = DllStructGetData($IconDirEntry, "size")
			$Offset[$i] = DllStructGetData($IconDirEntry, "offset")
			$EntryPtr += DllStructGetSize($IconDirEntry)
		Next
		_BinaryToMemory($IconGroup, $Ptr)

		$Index = _WinAPI_LookupIconIdFromDirectoryEx($Ptr, 1, $Width, $Height, 0)
		If $Index = 0 Or $Index > $Count Then Return SetError(1, 0, Binary(""))

		$Index -= 1
		If BinaryLen($IconData) < $Offset[$Index] + $Size[$Index] Then Return SetError(1, 0, Binary(""))
		Return _BinaryFromMemory($Ptr + $Offset[$Index], $Size[$Index])
	EndIf
EndFunc

Func _IconImage_FromIcoFile($IconFile, $Width, $Height = Default, $Index = Default)
	If IsKeyword($Height) Then $Height = $Width

	; also support "xxx.ico,index" format filename
	If Not FileExists($IconFile) Then
		Local $Array = _WinAPI_PathParseIconLocation($IconFile)
		If Not @Error Then
			$IconFile = $Array[0]
			$Index = $Array[1]
		EndIf
	EndIf

	Local $File = FileOpen($IconFile, 16)
	If $File = -1 Then Return SetError(1, 0, Binary(""))
	Local $IconData = FileRead($File)
	FileClose($File)

	Local $Ret = _IconImage_FromIcoData($IconData, $Width, $Height, $Index)
	Return SetError(@Error, @Extended, $Ret)
EndFunc

Func _IconImage_FromImageData($ImageData)
	Local $Gdibmp, $Error = 1, $IconImage = Binary("")
	Do
		If Not $ImageData Then ExitLoop

		$Gdibmp = _IconImage_LoadGdipBitmapFromBinary(Binary($ImageData))
		If @Error Then ExitLoop

		$IconImage = _IconImage_FromGdipBitmap($Gdibmp)
		$Error = @Error
	Until 1
	If $Gdibmp Then _GDIPlus_ImageDispose($Gdibmp)
	Return SetError($Error, 0, $IconImage)
EndFunc

Func _IconImage_FromImageFile($Filename)
	Local $File = FileOpen($Filename, 16)
	If $File = -1 Then Return SetError(1, 0, Binary(""))
	Local $ImageData = FileRead($File)
	FileClose($File)

	Local $Ret = _IconImage_FromImageData($ImageData)
	Return SetError(@Error, @Extended, $Ret)
EndFunc

; Modified from Yashied's code
Func _IconImage_FromGdipBitmap($Gdibmp)
	Local $BitmapData, $ColorBmp, $MaskBmp, $Error = 1, $IconImage = Binary("")
	Do
		If Not $Gdibmp Then ExitLoop

		; _GDIPlus_BitmapCreateHBITMAPFromBitmap is easy but always apply some background, but we don't need background
		;local $ColorBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($Gdibmp, 0xFFFFFFFF)
		;If Not $ColorBmp Then ExitLoop

		Local $Width = _GDIPlus_ImageGetWidth($Gdibmp)
		Local $Height = _GDIPlus_ImageGetHeight($Gdibmp)

		$BitmapData = _GDIPlus_BitmapLockBits($Gdibmp, 0, 0, $Width, $Height, $GDIP_ILMREAD, $GDIP_PXF32ARGB)
		If @Error Then ExitLoop

		Local $Scan0Ptr = DllStructGetData($BitmapData, "Scan0")
		Local $ColorBmp = _WinAPI_CreateDIB($Width, $Height)
		If @Error Or Not $Scan0Ptr Then ExitLoop

        _WinAPI_SetBitmapBits($ColorBmp, $Width * $Height * 4, $Scan0Ptr)
		If @Error Then ExitLoop

		$MaskBmp = _IconImage_CreateMaskBmp($ColorBmp)
		If @Error Then ExitLoop

		Local $DIBSection = DllStructCreate($tagDIBSECTION)
		Local $Ptr = DllStructGetPtr($DIBSection)
		Local $Size = DllStructGetSize($DIBSection)

		If Not _WinAPI_GetObject($MaskBmp, $Size, $Ptr) Then ExitLoop
		Local $MaskBitsPtr = DllStructGetData($DIBSection, "bmBits")
		Local $MaskSizeImage = DllStructGetData($DIBSection, "biSizeImage")

		If Not _WinAPI_GetObject($ColorBmp, $Size, $Ptr) Then ExitLoop
		Local $ColorBitsPtr = DllStructGetData($DIBSection, "bmBits")
		Local $ColorSizeImage = DllStructGetData($DIBSection, "biSizeImage")

		Local $Width = DllStructGetData($DIBSection, "bmWidth")
		Local $Height = DllStructGetData($DIBSection, "bmHeight")

		Local $Header = DllStructCreate(StringReplace($tagBITMAPINFO, "dword RGBQuad", ""))
		DllStructSetData($Header, "Size", 40)
		DllStructSetData($Header, "Planes", 1)
		DllStructSetData($Header, "BitCount", 32)
		DllStructSetData($Header, "Width", $Width)
		DllStructSetData($Header, "Height", $Height * 2)
		DllStructSetData($Header, "SizeImage", $ColorSizeImage + $MaskSizeImage)

		$IconImage = _BinaryFromDLLStruct($Header) & _BinaryFromMemory($ColorBitsPtr, $ColorSizeImage) & _BinaryFromMemory($MaskBitsPtr, $MaskSizeImage)
		$Error = 0
	Until 1
	If $MaskBmp Then _WinAPI_DeleteObject($MaskBmp)
	If $ColorBmp Then _WinAPI_DeleteObject($ColorBmp)
	If $BitmapData Then _GDIPlus_BitmapUnlockBits($Gdibmp, $BitmapData)
	Return SetError($Error, 0, $IconImage)
EndFunc

; Modified from Yashied's code
Func _IconImage_FromHandle($Handle)
	Static $CodePtr
	If Not $CodePtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("4883EC0831C0EB15F701000000FF7407B801000000EB0C4883C104FFC039D072E731C05AC3")
		Else
			$Code = Binary("0x5531C089E58B4D088B550CEB11F70481000000FF7407B801000000EB074039D072EB31C05DC21000")
		EndIf
		$CodePtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	Local $MaskBmp, $ColorBmp, $Error = 1, $IconImage = Binary("")
	Do
		If Not $Handle Then ExitLoop

		Local $Info = _WinAPI_GetIconInfo($Handle)
		If @Error Then ExitLoop
		$MaskBmp = $Info[4]
		$ColorBmp = $Info[5]

		Local $DIBSection = DllStructCreate($tagDIBSECTION)
		Local $Ptr = DllStructGetPtr($DIBSection)
		Local $Size = DllStructGetSize($DIBSection)

		$MaskBmp = _WinAPI_CopyImage($MaskBmp, 0, 0, 0, 0x2008)
		If @Error Then ExitLoop

		$ColorBmp = _WinAPI_CopyImage($ColorBmp, 0, 0, 0, 0x2008)
		If @Error Then ExitLoop

		If Not _WinAPI_GetObject($MaskBmp, $Size, $Ptr) Then ExitLoop
		Local $MaskBitsPtr = DllStructGetData($DIBSection, "bmBits")
		Local $MaskSizeImage = DllStructGetData($DIBSection, "biSizeImage")

		If Not _WinAPI_GetObject($ColorBmp, $Size, $Ptr) Then ExitLoop
		Local $ColorBitsPtr = DllStructGetData($DIBSection, "bmBits")
		Local $ColorSizeImage = DllStructGetData($DIBSection, "biSizeImage")

		Local $Width = DllStructGetData($DIBSection, "bmWidth")
		Local $Height = DllStructGetData($DIBSection, "bmHeight")

		; check has alpha channel or not
		Local $Ret = DllCall($__Binary_User32Dll, "int", "CallWindowProc", "ptr", $CodePtr, _
																			"ptr", $ColorBitsPtr, _
																			"uint", $Width * $Height, _
																			"int", 0, _
																			"int", 0)
		; if no alpha channel, convert the 32 bit bitmap from icon
		If Not $Ret[0] Then
			_WinAPI_DeleteObject($ColorBmp)
			$ColorBmp = _WinAPI_Create32BitHBITMAP($Handle)
			If @Error Then ExitLoop

			If Not _WinAPI_GetObject($ColorBmp, $Size, $Ptr) Then ExitLoop
			$ColorBitsPtr = DllStructGetData($DIBSection, "bmBits")
			$ColorSizeImage = DllStructGetData($DIBSection, "biSizeImage")
		EndIf

		Local $Header = DllStructCreate(StringReplace($tagBITMAPINFO, "dword RGBQuad", ""))
		DllStructSetData($Header, "Size", 40)
		DllStructSetData($Header, "Planes", 1)
		DllStructSetData($Header, "BitCount", 32)
		DllStructSetData($Header, "Width", $Width)
		DllStructSetData($Header, "Height", $Height * 2)
		DllStructSetData($Header, "SizeImage", $ColorSizeImage + $MaskSizeImage)

		$IconImage = _BinaryFromDLLStruct($Header) & _BinaryFromMemory($ColorBitsPtr, $ColorSizeImage) & _BinaryFromMemory($MaskBitsPtr, $MaskSizeImage)
		$Error = 0
	Until 1
	If $MaskBmp Then _WinAPI_DeleteObject($MaskBmp)
	If $ColorBmp Then _WinAPI_DeleteObject($ColorBmp)
	Return SetError($Error, 0, $IconImage)
EndFunc

Func _IconImage_ToIcoData($IconImage)
	If Not IsArray($IconImage) Then
		Local $Array[1] = [Binary($IconImage)]
		$IconImage = $Array
	EndIf

	Local $Count = 0
	For $i = 0 To UBound($IconImage) - 1
		If $IconImage[$i] Then $Count += 1
	Next
	If Not $Count Then Return SetError(1, 0, Binary(""))

	Local $IconHeader = DllStructCreate("align 1;dword Identify;word Count")
	Local $IconEntry = DllStructCreate("byte Width;byte Height;byte ColorCount;byte;word Planes;word BitCount;dword Size;dword Offset")

	Local $Offest = DllStructGetSize($IconHeader) + DllStructGetSize($IconEntry) * $Count
	Local $EntryDir = Binary(""), $ImageBody = Binary("")
	For $i = 0 To UBound($IconImage) - 1
		If $IconImage[$i] Then
			$IconImage[$i] = Binary($IconImage[$i])
			Local $Size = _IconImage_GetSize($IconImage[$i])
			Local $BitCount = @Extended
			If $Size[0] >= 256 Then $Size[0] = 0
			If $Size[1] >= 256 Then $Size[1] = 0

			DllStructSetData($IconEntry, "Width", $Size[0])
			DllStructSetData($IconEntry, "Height", $Size[1])
			DllStructSetData($IconEntry, "Planes", 1)
			DllStructSetData($IconEntry, "BitCount", $BitCount)
			DllStructSetData($IconEntry, "Size", BinaryLen($IconImage[$i]))
			DllStructSetData($IconEntry, "Offset", $Offest)
			If $BitCount < 8 Then
				DllStructSetData($IconEntry, "ColorCount", BitShift(1, -$BitCount))
			Else
				DllStructSetData($IconEntry, "ColorCount", 0)
			EndIf

			$EntryDir &= _BinaryFromDLLStruct($IconEntry)
			$ImageBody &= $IconImage[$i]

			$Offest += BinaryLen($IconImage[$i])
		EndIf
	Next
	DllStructSetData($IconHeader, "Identify", 0x10000)
	DllStructSetData($IconHeader, "Count", $Count)
	Return _BinaryFromDLLStruct($IconHeader) & $EntryDir & $ImageBody
EndFunc

Func _IconImage_ToIcoFile($IconImage, $Filename)
	Local $IcoData = _IconImage_ToIcoData($IconImage)
	If Not @Error Then
		Local $File = FileOpen($Filename, 2 + 16)
		FileWrite($File, $IcoData)
		FileClose($File)
	EndIf
EndFunc

Func _IconImage_ToImageData($IconImage, $Type = "PNG")
	Local $Gdibmp, $Error = 1, $ImageData = Binary("")
	Do
		$Gdibmp = _IconImage_ToGdipBitmap(Binary($IconImage))
		If @Error Then ExitLoop

		$ImageData = _IconImage_SaveGdipBitmapToBinary($Gdibmp, $Type)
		$Error = @Error
	Until 1
	If $Gdibmp Then _GDIPlus_ImageDispose($Gdibmp)
	Return SetError($Error, 0, $ImageData)
EndFunc

Func _IconImage_ToImageFile($IconImage, $Filename, $Type = "PNG")
	Local $ImageData = _IconImage_ToImageData($IconImage, $Type)
	If Not @Error Then
		Local $File = FileOpen($Filename, 18)
		FileWrite($File, $ImageData)
		FileClose($File)
	EndIf
EndFunc

Func _IconImage_ToGdipBitmap($IconImage)
	Local $Gdibmp
	If _IconImage_IsPNGIcon($IconImage) Then
		$Gdibmp = _IconImage_LoadGdipBitmapFromBinary(Binary($IconImage))
		Return SetError(@Error, 0, $Gdibmp)
	Else
		; 32bit alpha image not supported by GDI+
		$Gdibmp = _IconImage_32BitAlphaToGdipBitmap($IconImage)

		; not use GdipCreateBitmapFromHICON for poor support on most image
		; always use _IconImage_LoadGdipBitmapFromBinary if $IconImage is not 32bit alpha image
		;If Not $Gdibmp Then
			;Local $Size = _IconImage_GetSize($IconImage)
			;Local $hIcon = _IconImage_ToHandle($IconImage, $Size[0], $Size[1])
			;Local $Ret = DllCall($ghGDIPDll, "int", "GdipCreateBitmapFromHICON", "hwnd", $hIcon, "ptr*", 0)
			;If Not @Error And $Ret[0] = 0 Then
				;$Gdibmp = $Ret[2]
			;EndIf
		;EndIf
		If Not $Gdibmp Then $Gdibmp = _IconImage_LoadGdipBitmapFromBinary(_IconImage_ToIcoData($IconImage))
		If Not $Gdibmp Then SetError(1, 0, 0)
		Return $Gdibmp
	EndIf
EndFunc

Func _IconImage_ToHandle($IconImage, $Width = Default, $Height = Default)
	If IsKeyword($Width) Or IsKeyword($Height) Then
		Local $Size = _IconImage_GetSize($IconImage)
		If IsKeyword($Width) Then $Width = $Size[0]
		If IsKeyword($Height) Then $Height = $Size[1]
	EndIf

	; because even Vista or Windows 7 handle system PNG icon with some error, so always convert to BMP Icon
	;If Not $_IconImage_VistaFlag And _IconImage_IsPNGIcon($IconImage) Then
	If _IconImage_IsPNGIcon($IconImage) Then $IconImage = _IconImage_ConvertToBMPIcon($IconImage)

	If $IconImage Then
		Local $Buffer = _BinaryToDLLStruct($IconImage)
		Local $hIcon = _WinAPI_CreateIconFromResourceEx(DllStructGetPtr($Buffer), DllStructGetSize($Buffer), 1, $Width, $Height, 0)
		Return SetError(@Error, 0, $hIcon)
	EndIf
	Return SetError(1, 0, 0)
EndFunc

Func _IconImage_IsPNGIcon(ByRef $IconImage)
	Return (BinaryMid($IconImage, 1, 8) = $_IconImage_PNG_Header)
EndFunc

Func _IconImage_ConvertToBMPIcon($IconImage)
	If $IconImage And Not _IconImage_IsPNGIcon($IconImage) Then Return $IconImage

	Local $Gdibmp, $Error = 1, $IsConvert = 0, $NewImage = Binary("")
	Do
		$Gdibmp = _IconImage_LoadGdipBitmapFromBinary(Binary($IconImage))
		If @Error Then ExitLoop

		$NewImage = _IconImage_FromGdipBitmap($Gdibmp)
		If @Error Then ExitLoop

		$IsConvert = 1
		$Error = 0
	Until 1
	If $Gdibmp Then _GDIPlus_ImageDispose($Gdibmp)
	Return SetError($Error, $IsConvert, $NewImage)
EndFunc

Func _IconImage_ConvertToPNGIcon($IconImage)
	If _IconImage_IsPNGIcon($IconImage) Then Return $IconImage

	Local $Gdibmp, $Error = 1, $IsConvert = 0, $NewImage = Binary("")
	Do
		$Gdibmp = _IconImage_ToGdipBitmap($IconImage)
		If @Error Then ExitLoop

		$NewImage = _IconImage_SaveGdipBitmapToBinary($Gdibmp, "PNG")
		If @Error Then ExitLoop

		$IsConvert = 1
		$Error = 0
	Until 1
	If $Gdibmp Then _GDIPlus_ImageDispose($Gdibmp)
	Return SetError($Error, $IsConvert, $NewImage)
EndFunc

Func _IconImage_GetSize($IconImage)
	Local $Error = 0, $Width = 0, $Height = 0, $BitCount = 0, $Header

	If _IconImage_IsPNGIcon($IconImage) Then
		$Header = DllStructCreate("byte[16];byte Width[4];byte Height[4]")
		_BinaryFillDLLStruct($IconImage, $Header)

		; convert network byte order
		$Width = Dec(StringTrimLeft(DllStructGetData($Header, "Width"), 2))
		$Height = Dec(StringTrimLeft(DllStructGetData($Header, "Height"), 2))
		$BitCount = 32
	ElseIf $IconImage Then
		$Header = DllStructCreate($tagBITMAPINFO)
		_BinaryFillDLLStruct($IconImage, $Header)

		$Width = DllStructGetData($Header, "Width")
		$Height = DllStructGetData($Header, "Height") / 2
		$BitCount = DllStructGetData($Header, "BitCount")
	Else
		$Error = 1
	EndIf

	Local $Ret[2] = [$Width, $Height]
	Return SetError($Error, $BitCount, $Ret)
EndFunc

Func _IconImage_Scale($IconImage, $Width, $Height = Default, $Quality = $GDIP_ModeInvalid)
	If IsKeyword($Height) Then $Height = $Width
	If Not $IconImage Then Return SetError(1, 0, Binary(""))

	Local $Error = 1, $NewImage = Binary("")
	If $Quality < 0 Or IsKeyword($Quality) Then
		Local $hIcon
		Do
			$hIcon = _IconImage_ToHandle($IconImage, $Width, $Height)
			If @Error Then ExitLoop

			$NewImage = _IconImage_FromHandle($hIcon)
			$Error = @Error
		Until 1
		If $hIcon Then _WinAPI_DestroyIcon($hIcon)
	Else
		Local $Gdibmp, $Gdibmp2, $Scan0Ptr, $Graph = -1
		Do
			$Gdibmp = _IconImage_ToGdipBitmap($IconImage)
			If @Error Then ExitLoop

			$Scan0Ptr = _MemGlobalAlloc($Width * $Height * 4, $GMEM_ZEROINIT)
			Local $Ret = DllCall($ghGDIPDll, "int", "GdipCreateBitmapFromScan0", "int", $Width, "int", $Height, "int", 4 * $Width, "uint", $GDIP_PXF32ARGB, "ptr", $Scan0Ptr, "ptr*", 0)
			If @Error Or $Ret[0] Then ExitLoop
			$Gdibmp2 = $Ret[6]

			$Graph = _GDIPlus_ImageGetGraphicsContext($Gdibmp2)
			If @Error Then ExitLoop

			DllCall($ghGDIPDll, "int", "GdipSetInterpolationMode", "ptr", $Graph, "int", $Quality)
			If Not _GDIPlus_GraphicsDrawImageRect($Graph, $Gdibmp, 0, 0, $Width, $Height) Then ExitLoop

			$NewImage = _IconImage_FromGdipBitmap($Gdibmp2)
			$Error = @Error
		Until 1
		If $Graph <> -1 Then _GDIPlus_GraphicsDispose($Graph)
		If $Gdibmp2 Then _GDIPlus_ImageDispose($Gdibmp2)
		If $Gdibmp Then _GDIPlus_ImageDispose($Gdibmp)
		If $Scan0Ptr Then _MemGlobalFree($Scan0Ptr)
	EndIf
	Return SetError($Error, 0, $NewImage)
EndFunc

Func _IconImage_RotateFlip($IconImage, $Flag)
	Local $Gdibmp, $Error = 1, $NewImage = Binary("")
	Do
		If Not $IconImage Then ExitLoop
		$Gdibmp = _IconImage_ToGdipBitmap($IconImage)
		If @Error Then ExitLoop

		DllCall($ghGDIPDll, "int", "GdipImageRotateFlip", "ptr", $Gdibmp, "int", $Flag)
		$NewImage = _IconImage_FromGdipBitmap($Gdibmp)
		$Error = @Error
	Until 1
	If $Gdibmp Then _GDIPlus_ImageDispose($Gdibmp)
	Return SetError($Error, 0, $NewImage)
EndFunc

Func _IconImage_Merge($IconImage1, $IconImage2, $Align = 0, $X = 0, $Y = 0)
	Local $Size1 = _IconImage_GetSize($IconImage1)
	Local $Size2 = _IconImage_GetSize($IconImage2)

	Select
	Case BitAND($Align, $ICONIMAGE_ALIGN_LEFT)
		$X = 0
	Case BitAND($Align, $ICONIMAGE_ALIGN_RIGHT)
		$X = $Size1[0] - $Size2[0]
	Case BitAND($Align, $ICONIMAGE_ALIGN_CENTER)
		$X = ($Size1[0] - $Size2[0]) / 2
	EndSelect

	Select
	Case BitAND($Align, $ICONIMAGE_ALIGN_TOP)
		$Y = 0
	Case BitAND($Align, $ICONIMAGE_ALIGN_BOTTOM)
		$Y = $Size1[1] - $Size2[1]
	Case BitAND($Align, $ICONIMAGE_ALIGN_MIDDLE)
		$Y = ($Size1[1] - $Size2[1]) / 2
	EndSelect

	Local $Gdibmp1, $Gdibmp2, $Graph = -1, $Error = 1, $IconImage3 = Binary("")
	Do
		$Gdibmp1 = _IconImage_ToGdipBitmap($IconImage1)
		If @Error Then ExitLoop

		$Gdibmp2 = _IconImage_ToGdipBitmap($IconImage2)
		If @Error Then ExitLoop

		$Graph = _GDIPlus_ImageGetGraphicsContext($Gdibmp1)
		If @Error Then ExitLoop

		If Not _GDIPlus_GraphicsDrawImage($Graph, $Gdibmp2, $X, $Y) Then ExitLoop

		$IconImage3 = _IconImage_FromGdipBitmap($Gdibmp1)
		$Error = @Error
	Until 1
	If $Graph <> -1 Then _GDIPlus_GraphicsDispose($Graph)
	If $Gdibmp1 Then _GDIPlus_ImageDispose($Gdibmp1)
	If $Gdibmp2 Then _GDIPlus_ImageDispose($Gdibmp2)
	Return SetError($Error, 0, $IconImage3)
EndFunc

; Deprecated, ImageList_SetOverlayImage can only handle images in the same size
; Use _IconImage_Merge instead
Func _IconImage_Overlay($IconImage1, $IconImage2)
	Local $ImageList, $hIcon1, $hIcon2, $hIcon3, $Error = 1, $IconImage = Binary("")
	Local $Size = _IconImage_GetSize($IconImage1)
	Do
		Local $hIcon1 = _IconImage_ToHandle($IconImage1, $Size[0], $Size[1])
		If @Error Then ExitLoop

		Local $hIcon2 = _IconImage_ToHandle($IconImage2, $Size[0], $Size[1])
		If @Error Then ExitLoop

		$hIcon3 = _WinAPI_AddIconOverlay($hIcon1, $hIcon2)
		If @Error Then ExitLoop

		$IconImage = _IconImage_FromHandle($hIcon3)
		$Error = @Error
	Until 1
	If $hIcon1 Then _WinAPI_DestroyIcon($hIcon1)
	If $hIcon2 Then _WinAPI_DestroyIcon($hIcon2)
	If $hIcon3 Then _WinAPI_DestroyIcon($hIcon3)
	Return SetError($Error, 0, $IconImage)
EndFunc

;  Functions Using Internally

Func _IconImage_FromGroupId($Module, $GroupId, $Width, $Height)
	Local $Resource = _WinAPI_FindResource($Module, 14, $GroupId)
	Local $Handle = _WinAPI_LoadResource($Module, $Resource)
	Local $Ptr = _WinAPI_LockResource($Handle)

	If $Resource And $Handle And $Ptr Then
		Local $IconId = _WinAPI_LookupIconIdFromDirectoryEx($Ptr, 1, $Width, $Height, 0)
		Return _IconImage_FromIconId($Module, $IconId)
	EndIf
	Return SetError(1, 0, Binary(""))
EndFunc

Func _IconImage_FromIconId($Module, $IconId)
	Local $Resource = _WinAPI_FindResource($Module, 3, $IconId)
	Local $Handle = _WinAPI_LoadResource($Module, $Resource)
	Local $Ptr = _WinAPI_LockResource($Handle)
	Local $Size = _WinAPI_SizeOfResource($Module, $Resource)

	If $Resource And $Handle And $Ptr And $Size Then Return _BinaryFromMemory($Ptr, $Size)
	Return SetError(1, 0, Binary(""))
EndFunc

Func _IconImage_CreateStream($InitData = Default)
	Local $hMem
	If IsKeyword($InitData) Then
		$hMem = _MemGlobalAlloc(16, $GMEM_MOVEABLE)
	ElseIf $InitData Then
		$hMem = _MemGlobalAlloc(BinaryLen($InitData), $GMEM_MOVEABLE)
		_BinaryToMemory($InitData, _MemGlobalLock($hMem))
	Else
		Return SetError(1, 0, 0)
	EndIf

	Local $Ret = DllCall("ole32.dll", "int", "CreateStreamOnHGlobal", "ptr", $hMem, "int", 1, "ptr*", 0)
	If Not @Error And $Ret[0] = 0 Then Return $Ret[3]
	Return SetError(1, 0, 0)
EndFunc

Func _IconImage_ReadStream($Stream)
	Do
		If Not $Stream Then ExitLoop
		Local $Ret = DllCall("ole32.dll", "int", "GetHGlobalFromStream", "ptr", $Stream, "ptr*", 0)
		If @Error Or $Ret[0] Then ExitLoop
		Local $Length = _MemGlobalSize($Ret[2])
		Local $Ptr = _MemGlobalLock($Ret[2])

		If $Length And $Ptr Then Return _BinaryFromMemory($Ptr, $Length)
	Until 1
	Return SetError(1, 0, Binary(""))
EndFunc

Func _IconImage_ReleaseStream($Stream)
	If $Stream Then DllCall("oleaut32.dll", "int", "DispCallFunc", "ptr", $Stream, "dword", 8 * @AutoItX64 + 8, "dword", 4, "dword", 23, "dword", 0, "ptr", 0, "ptr", 0, "str", "")
EndFunc

Func _IconImage_SaveGdipBitmapToBinary($Gdibmp, $Type = "PNG")
	Local $Error = 1, $Binary = Binary(""), $Stream = 0
	Do
		$Stream = _IconImage_CreateStream()
		If @Error Then ExitLoop

		Local $GUID = _WinAPI_GUIDFromString(_GDIPlus_EncodersGetCLSID($Type))
		Local $Ret = DllCall($ghGDIPDll, "int", "GdipSaveImageToStream", "ptr", $Gdibmp, "ptr", $Stream, "ptr", DllStructGetPtr($GUID), "ptr", 0)
		If @Error Or $Ret[0] Then ExitLoop

		$Binary = _IconImage_ReadStream($Stream)
		$Error = @Error
	Until 1
	If $Stream Then _IconImage_ReleaseStream($Stream)
	Return SetError($Error, 0, $Binary)
EndFunc

Func _IconImage_LoadGdipBitmapFromBinary($Data)
	Local $Error = 1, $Gdibmp = 0, $Stream = 0
	Do
		$Stream = _IconImage_CreateStream($Data)
		If @Error Then ExitLoop

		Local $Ret = DllCall($ghGDIPDll, "int", "GdipCreateBitmapFromStream", "ptr", $Stream, "ptr*", 0)
		If @Error Or $Ret[0] Then ExitLoop
		$Gdibmp = $Ret[2]
		$Error = 0
	Until 1
	If $Stream Then _IconImage_ReleaseStream($Stream)
	Return SetError($Error, 0, $Gdibmp)
EndFunc

Func _IconImage_32BitAlphaToGdipBitmap($IconImage)
	Local $Header = DllStructCreate(StringReplace($tagBITMAPINFO, "dword RGBQuad", ""))
	_BinaryFillDLLStruct($IconImage, $Header)

	If DllStructGetData($Header, "BitCount") <> 32 Then Return SetError(1, 0, 0)
	Local $Height = DllStructGetData($Header, "Height") / 2
	Local $Width = DllStructGetData($Header, "Width")

	Local $Error = 1, $Gdibmp = 0, $NewGdibmp
	Local $Buffer = _BinaryToDLLStruct($IconImage)
	Local $Scan0Ptr = DllStructGetPtr($Buffer) + DllStructGetSize($Header)
	Do
		Local $Ret = DllCall($ghGDIPDll, "int", "GdipCreateBitmapFromScan0", "int", $Width, "int", $Height, "int", 4 * $Width, "uint", $GDIP_PXF32ARGB, "ptr", $Scan0Ptr, "ptr*", 0)
		If @Error Or $Ret[0] Then ExitLoop
		$NewGdibmp = $Ret[6]

		$Ret = DllCall($ghGDIPDll, "int", "GdipCloneImage", "ptr", $NewGdibmp, "ptr*", 0)
		If @Error Or $Ret[0] Then ExitLoop
		$Gdibmp = $Ret[2]

		DllCall($ghGDIPDll, "int", "GdipImageRotateFlip", "ptr", $Gdibmp, "int", 6)
		$Error = 0
	Until 1
	If $NewGdibmp Then _GDIPlus_ImageDispose($NewGdibmp)
	Return SetError($Error, 0, $Gdibmp)
EndFunc

Func _IconImage_CreateMaskBmp($ColorBmp)
	Static $CodePtr
	If Not $CodePtr Then
		Local $Code
		If @AutoItX64 Then
			$Code = Binary("0x41544889C84489C155BD010000005731FF41F6C00F400F95C7C1E9044531DB5601CF01FF5389FF31DBEB38418D0C1AF70488000000FF751A4489D64489D14189ECC1EE03F7D189F683E10741D3E44408243241FFC24539C272D14801FA41FFC34401C34539CB73054531D2EBE85B5E5F5D415CC3")
		Else
			$Code = Binary("0x5531C089E557565383EC188B7D108B550CC745EC00000000F7C70F00000089F90F95C0C1E90401C88B4D0801C08945E48D04BD000000008945E8894DF0EB42F703000000FF752289C789C6F7D783E707897DE08A4DE0BF01000000C1EE03D3E7897DE08A4DE0080C324083C3043B45DC72CD8B45E88B7DDCFF45EC0145F00355E48B4D14394DEC730A8B5DF031C0897DDCEBDA83C4185B5E5F5DC21000")
		EndIf
		$CodePtr = __BinaryCodeBufferAlloc($Code)
	EndIf

	Local $MaskPtr, $MaskBmp = 0, $Error = 1
	Do
		Local $DIBSection = DllStructCreate($tagDIBSECTION)
		Local $Ptr = DllStructGetPtr($DIBSection)
		Local $Size = DllStructGetSize($DIBSection)
		If Not _WinAPI_GetObject($ColorBmp, $Size, $Ptr) Then ExitLoop

		Local $BitPtr = DllStructGetData($DIBSection, "bmBits")
		Local $Width = DllStructGetData($DIBSection, "bmWidth")
		Local $Height = DllStructGetData($DIBSection, "bmHeight")
		Local $Stride = Ceiling($Width / 16) * 2
		Local $Header = DllStructCreate($tagBITMAPINFO)
		DllStructSetData($Header, "Size", 40)
		DllStructSetData($Header, "Width", $Width)
		DllStructSetData($Header, "Height", $Height)
		DllStructSetData($Header, "Planes", 1)
		DllStructSetData($Header, "BitCount", 1)
		DllStructSetData($Header, "SizeImage", $Stride * $Height)

		$MaskBmp = _WinAPI_CreateDIBSection(0, $Header, $DIB_RGB_COLORS, $MaskPtr)
		If @Error Then ExitLoop

		DllCall($__Binary_User32Dll, "none", "CallWindowProc", "ptr", $CodePtr, _
																"ptr", $BitPtr, _
																"ptr", $MaskPtr, _
																"uint", $Width, _
																"uint", $Height)

		$Error = 0
	Until 1
	Return SetError($Error, 0, $MaskBmp)
EndFunc

Func _IconImage_VistaAndLater()
	Local $OSVI = DllStructCreate("dword OSVersionInfoSize; dword MajorVersion; dword MinorVersion; dword BuildNumber; dword PlatformId; wchar CSDVersion[128]")
	DllStructSetData($OSVI, "OSVersionInfoSize", DllStructGetSize($OSVI))
	DllCall("kernel32.dll", "bool", "GetVersionExW", "ptr", DllStructGetPtr($OSVI))
	Return DllStructGetData($OSVI, "MajorVersion") >= 6
EndFunc
