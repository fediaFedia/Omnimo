#Region
#AutoIt3Wrapper_OutFile=..\..\..\Rainmeter\Skins\WP7\@Resources\Common\MultiManager\MultiManager.exe
#AutoIt3Wrapper_UseUpx=n
#EndRegion
Global Const $gdip_dashcapflat = 0
Global Const $gdip_dashcapround = 2
Global Const $gdip_dashcaptriangle = 3
Global Const $gdip_dashstylesolid = 0
Global Const $gdip_dashstyledash = 1
Global Const $gdip_dashstyledot = 2
Global Const $gdip_dashstyledashdot = 3
Global Const $gdip_dashstyledashdotdot = 4
Global Const $gdip_dashstylecustom = 5
Global Const $gdip_epgchrominancetable = "{F2E455DC-09B3-4316-8260-676ADA32481C}"
Global Const $gdip_epgcolordepth = "{66087055-AD66-4C7C-9A18-38A2310B8337}"
Global Const $gdip_epgcompression = "{E09D739D-CCD4-44EE-8EBA-3FBF8BE4FC58}"
Global Const $gdip_epgluminancetable = "{EDB33BCE-0266-4A77-B904-27216099E717}"
Global Const $gdip_epgquality = "{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"
Global Const $gdip_epgrendermethod = "{6D42C53A-229A-4825-8BB7-5C99E2B9A8B8}"
Global Const $gdip_epgsaveflag = "{292266FC-AC40-47BF-8CFC-A85B89A655DE}"
Global Const $gdip_epgscanmethod = "{3A4E2661-3109-4E56-8536-42C156E7DCFA}"
Global Const $gdip_epgtransformation = "{8D0EB2D1-A58E-4EA8-AA14-108074B7B6F9}"
Global Const $gdip_epgversion = "{24D18C76-814A-41A4-BF53-1C219CCCF797}"
Global Const $gdip_eptbyte = 1
Global Const $gdip_eptascii = 2
Global Const $gdip_eptshort = 3
Global Const $gdip_eptlong = 4
Global Const $gdip_eptrational = 5
Global Const $gdip_eptlongrange = 6
Global Const $gdip_eptundefined = 7
Global Const $gdip_eptrationalrange = 8
Global Const $gdip_errok = 0
Global Const $gdip_errgenericerror = 1
Global Const $gdip_errinvalidparameter = 2
Global Const $gdip_erroutofmemory = 3
Global Const $gdip_errobjectbusy = 4
Global Const $gdip_errinsufficientbuffer = 5
Global Const $gdip_errnotimplemented = 6
Global Const $gdip_errwin32error = 7
Global Const $gdip_errwrongstate = 8
Global Const $gdip_erraborted = 9
Global Const $gdip_errfilenotfound = 10
Global Const $gdip_errvalueoverflow = 11
Global Const $gdip_erraccessdenied = 12
Global Const $gdip_errunknownimageformat = 13
Global Const $gdip_errfontfamilynotfound = 14
Global Const $gdip_errfontstylenotfound = 15
Global Const $gdip_errnottruetypefont = 16
Global Const $gdip_errunsupportedgdiversion = 17
Global Const $gdip_errgdiplusnotinitialized = 18
Global Const $gdip_errpropertynotfound = 19
Global Const $gdip_errpropertynotsupported = 20
Global Const $gdip_evtcompressionlzw = 2
Global Const $gdip_evtcompressionccitt3 = 3
Global Const $gdip_evtcompressionccitt4 = 4
Global Const $gdip_evtcompressionrle = 5
Global Const $gdip_evtcompressionnone = 6
Global Const $gdip_evttransformrotate90 = 13
Global Const $gdip_evttransformrotate180 = 14
Global Const $gdip_evttransformrotate270 = 15
Global Const $gdip_evttransformfliphorizontal = 16
Global Const $gdip_evttransformflipvertical = 17
Global Const $gdip_evtmultiframe = 18
Global Const $gdip_evtlastframe = 19
Global Const $gdip_evtflush = 20
Global Const $gdip_evtframedimensionpage = 23
Global Const $gdip_icfencoder = 1
Global Const $gdip_icfdecoder = 2
Global Const $gdip_icfsupportbitmap = 4
Global Const $gdip_icfsupportvector = 8
Global Const $gdip_icfseekableencode = 16
Global Const $gdip_icfblockingdecode = 32
Global Const $gdip_icfbuiltin = 65536
Global Const $gdip_icfsystem = 131072
Global Const $gdip_icfuser = 262144
Global Const $gdip_ilmread = 1
Global Const $gdip_ilmwrite = 2
Global Const $gdip_ilmuserinputbuf = 4
Global Const $gdip_linecapflat = 0
Global Const $gdip_linecapsquare = 1
Global Const $gdip_linecapround = 2
Global Const $gdip_linecaptriangle = 3
Global Const $gdip_linecapnoanchor = 16
Global Const $gdip_linecapsquareanchor = 17
Global Const $gdip_linecaproundanchor = 18
Global Const $gdip_linecapdiamondanchor = 19
Global Const $gdip_linecaparrowanchor = 20
Global Const $gdip_linecapcustom = 255
Global Const $gdip_pxf01indexed = 196865
Global Const $gdip_pxf04indexed = 197634
Global Const $gdip_pxf08indexed = 198659
Global Const $gdip_pxf16grayscale = 1052676
Global Const $gdip_pxf16rgb555 = 135173
Global Const $gdip_pxf16rgb565 = 135174
Global Const $gdip_pxf16argb1555 = 397319
Global Const $gdip_pxf24rgb = 137224
Global Const $gdip_pxf32rgb = 139273
Global Const $gdip_pxf32argb = 2498570
Global Const $gdip_pxf32pargb = 860171
Global Const $gdip_pxf48rgb = 1060876
Global Const $gdip_pxf64argb = 3424269
Global Const $gdip_pxf64pargb = 1851406
Global Const $gdip_imageformat_undefined = "{B96B3CA9-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_memorybmp = "{B96B3CAA-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_bmp = "{B96B3CAB-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_emf = "{B96B3CAC-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_wmf = "{B96B3CAD-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_jpeg = "{B96B3CAE-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_png = "{B96B3CAF-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_gif = "{B96B3CB0-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_tiff = "{B96B3CB1-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_exif = "{B96B3CB2-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imageformat_icon = "{B96B3CB5-0728-11D3-9D7B-0000F81EF32E}"
Global Const $gdip_imagetype_unknown = 0
Global Const $gdip_imagetype_bitmap = 1
Global Const $gdip_imagetype_metafile = 2
Global Const $gdip_imageflags_none = 0
Global Const $gdip_imageflags_scalable = 1
Global Const $gdip_imageflags_hasalpha = 2
Global Const $gdip_imageflags_hastranslucent = 4
Global Const $gdip_imageflags_partiallyscalable = 8
Global Const $gdip_imageflags_colorspace_rgb = 16
Global Const $gdip_imageflags_colorspace_cmyk = 32
Global Const $gdip_imageflags_colorspace_gray = 64
Global Const $gdip_imageflags_colorspace_ycbcr = 128
Global Const $gdip_imageflags_colorspace_ycck = 256
Global Const $gdip_imageflags_hasrealdpi = 4096
Global Const $gdip_imageflags_hasrealpixelsize = 8192
Global Const $gdip_imageflags_readonly = 65536
Global Const $gdip_imageflags_caching = 131072
Global Const $tagpoint = "struct;long X;long Y;endstruct"
Global Const $tagrect = "struct;long Left;long Top;long Right;long Bottom;endstruct"
Global Const $tagsize = "struct;long X;long Y;endstruct"
Global Const $tagmargins = "int cxLeftWidth;int cxRightWidth;int cyTopHeight;int cyBottomHeight"
Global Const $tagfiletime = "struct;dword Lo;dword Hi;endstruct"
Global Const $tagsystemtime = "struct;word Year;word Month;word Dow;word Day;word Hour;word Minute;word Second;word MSeconds;endstruct"
Global Const $tagtime_zone_information = "struct;long Bias;wchar StdName[32];word StdDate[8];long StdBias;wchar DayName[32];word DayDate[8];long DayBias;endstruct"
Global Const $tagnmhdr = "struct;hwnd hWndFrom;uint_ptr IDFrom;INT Code;endstruct"
Global Const $tagcomboboxexitem = "uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;int SelectedImage;int OverlayImage;" & "int Indent;lparam Param"
Global Const $tagnmcbedragbegin = $tagnmhdr & ";int ItemID;wchar szText[260]"
Global Const $tagnmcbeendedit = $tagnmhdr & ";bool fChanged;int NewSelection;wchar szText[260];int Why"
Global Const $tagnmcomboboxex = $tagnmhdr & ";uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;" & "int SelectedImage;int OverlayImage;int Indent;lparam Param"
Global Const $tagdtprange = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;" & "word MinSecond;word MinMSecond;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;" & "word MaxMinute;word MaxSecond;word MaxMSecond;bool MinValid;bool MaxValid"
Global Const $tagnmdatetimechange = $tagnmhdr & ";dword Flag;" & $tagsystemtime
Global Const $tagnmdatetimeformat = $tagnmhdr & ";ptr Format;" & $tagsystemtime & ";ptr pDisplay;wchar Display[64]"
Global Const $tagnmdatetimeformatquery = $tagnmhdr & ";ptr Format;struct;long SizeX;long SizeY;endstruct"
Global Const $tagnmdatetimekeydown = $tagnmhdr & ";int VirtKey;ptr Format;" & $tagsystemtime
Global Const $tagnmdatetimestring = $tagnmhdr & ";ptr UserString;" & $tagsystemtime & ";dword Flags"
Global Const $tageventlogrecord = "dword Length;dword Reserved;dword RecordNumber;dword TimeGenerated;dword TimeWritten;dword EventID;" & "word EventType;word NumStrings;word EventCategory;word ReservedFlags;dword ClosingRecordNumber;dword StringOffset;" & "dword UserSidLength;dword UserSidOffset;dword DataLength;dword DataOffset"
Global Const $taggdipbitmapdata = "uint Width;uint Height;int Stride;int Format;ptr Scan0;uint_ptr Reserved"
Global Const $taggdipencoderparam = "byte GUID[16];ulong Count;ulong Type;ptr Values"
Global Const $taggdipencoderparams = "uint Count;byte Params[1]"
Global Const $taggdiprectf = "float X;float Y;float Width;float Height"
Global Const $taggdipstartupinput = "uint Version;ptr Callback;bool NoThread;bool NoCodecs"
Global Const $taggdipstartupoutput = "ptr HookProc;ptr UnhookProc"
Global Const $taggdipimagecodecinfo = "byte CLSID[16];byte FormatID[16];ptr CodecName;ptr DllName;ptr FormatDesc;ptr FileExt;" & "ptr MimeType;dword Flags;dword Version;dword SigCount;dword SigSize;ptr SigPattern;ptr SigMask"
Global Const $taggdippencoderparams = "uint Count;byte Params[1]"
Global Const $taghditem = "uint Mask;int XY;ptr Text;handle hBMP;int TextMax;int Fmt;lparam Param;int Image;int Order;uint Type;ptr pFilter;uint State"
Global Const $tagnmhddispinfo = $tagnmhdr & ";int Item;uint Mask;ptr Text;int TextMax;int Image;lparam lParam"
Global Const $tagnmhdfilterbtnclick = $tagnmhdr & ";int Item;" & $tagrect
Global Const $tagnmheader = $tagnmhdr & ";int Item;int Button;ptr pItem"
Global Const $taggetipaddress = "byte Field4;byte Field3;byte Field2;byte Field1"
Global Const $tagnmipaddress = $tagnmhdr & ";int Field;int Value"
Global Const $taglvfindinfo = "struct;uint Flags;ptr Text;lparam Param;" & $tagpoint & ";uint Direction;endstruct"
Global Const $taglvhittestinfo = $tagpoint & ";uint Flags;int Item;int SubItem;int iGroup"
Global Const $taglvitem = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" & "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
Global Const $tagnmlistview = $tagnmhdr & ";int Item;int SubItem;uint NewState;uint OldState;uint Changed;" & "struct;long ActionX;long ActionY;endstruct;lparam Param"
Global Const $tagnmlvcustomdraw = "struct;" & $tagnmhdr & ";dword dwDrawStage;handle hdc;" & $tagrect & ";dword_ptr dwItemSpec;uint uItemState;lparam lItemlParam;endstruct" & ";dword clrText;dword clrTextBk;int iSubItem;dword dwItemType;dword clrFace;int iIconEffect;" & "int iIconPhase;int iPartId;int iStateId;struct;long TextLeft;long TextTop;long TextRight;long TextBottom;endstruct;uint uAlign"
Global Const $tagnmlvdispinfo = $tagnmhdr & ";" & $taglvitem
Global Const $tagnmlvfinditem = $tagnmhdr & ";int Start;" & $taglvfindinfo
Global Const $tagnmlvgetinfotip = $tagnmhdr & ";dword Flags;ptr Text;int TextMax;int Item;int SubItem;lparam lParam"
Global Const $tagnmitemactivate = $tagnmhdr & ";int Index;int SubItem;uint NewState;uint OldState;uint Changed;" & $tagpoint & ";lparam lParam;uint KeyFlags"
Global Const $tagnmlvkeydown = "align 1;" & $tagnmhdr & ";word VKey;uint Flags"
Global Const $tagnmlvscroll = $tagnmhdr & ";int DX;int DY"
Global Const $tagmchittestinfo = "uint Size;" & $tagpoint & ";uint Hit;" & $tagsystemtime & ";" & $tagrect & ";int iOffset;int iRow;int iCol"
Global Const $tagmcmonthrange = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" & "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" & "word MaxMSeconds;short Span"
Global Const $tagmcrange = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" & "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" & "word MaxMSeconds;short MinSet;short MaxSet"
Global Const $tagmcselrange = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" & "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" & "word MaxMSeconds"
Global Const $tagnmdaystate = $tagnmhdr & ";" & $tagsystemtime & ";int DayState;ptr pDayState"
Global Const $tagnmselchange = $tagnmhdr & ";struct;word BegYear;word BegMonth;word BegDOW;word BegDay;word BegHour;word BegMinute;word BegSecond;word BegMSeconds;endstruct;" & "struct;word EndYear;word EndMonth;word EndDOW;word EndDay;word EndHour;word EndMinute;word EndSecond;word EndMSeconds;endstruct"
Global Const $tagnmobjectnotify = $tagnmhdr & ";int Item;ptr piid;ptr pObject;long Result;dword dwFlags"
Global Const $tagnmtckeydown = "align 1;" & $tagnmhdr & ";word VKey;uint Flags"
Global Const $tagtvitem = "struct;uint Mask;handle hItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;int SelectedImage;" & "int Children;lparam Param;endstruct"
Global Const $tagtvitemex = "struct;" & $tagtvitem & ";int Integral;uint uStateEx;hwnd hwnd;int iExpandedImage;int iReserved;endstruct"
Global Const $tagnmtreeview = $tagnmhdr & ";uint Action;" & "struct;uint OldMask;handle OldhItem;uint OldState;uint OldStateMask;" & "ptr OldText;int OldTextMax;int OldImage;int OldSelectedImage;int OldChildren;lparam OldParam;endstruct;" & "struct;uint NewMask;handle NewhItem;uint NewState;uint NewStateMask;" & "ptr NewText;int NewTextMax;int NewImage;int NewSelectedImage;int NewChildren;lparam NewParam;endstruct;" & "struct;long PointX;long PointY;endstruct"
Global Const $tagnmtvcustomdraw = "struct;" & $tagnmhdr & ";dword DrawStage;handle HDC;" & $tagrect & ";dword_ptr ItemSpec;uint ItemState;lparam ItemParam;endstruct" & ";dword ClrText;dword ClrTextBk;int Level"
Global Const $tagnmtvdispinfo = $tagnmhdr & ";" & $tagtvitem
Global Const $tagnmtvgetinfotip = $tagnmhdr & ";ptr Text;int TextMax;handle hItem;lparam lParam"
Global Const $tagtvhittestinfo = $tagpoint & ";uint Flags;handle Item"
Global Const $tagnmtvkeydown = "align 1;" & $tagnmhdr & ";word VKey;uint Flags"
Global Const $tagnmmouse = $tagnmhdr & ";dword_ptr ItemSpec;dword_ptr ItemData;" & $tagpoint & ";lparam HitInfo"
Global Const $tagtoken_privileges = "dword Count;align 4;int64 LUID;dword Attributes"
Global Const $tagimageinfo = "handle hBitmap;handle hMask;int Unused1;int Unused2;" & $tagrect
Global Const $tagmenuinfo = "dword Size;INT Mask;dword Style;uint YMax;handle hBack;dword ContextHelpID;ulong_ptr MenuData"
Global Const $tagmenuiteminfo = "uint Size;uint Mask;uint Type;uint State;uint ID;handle SubMenu;handle BmpChecked;handle BmpUnchecked;" & "ulong_ptr ItemData;ptr TypeData;uint CCH;handle BmpItem"
Global Const $tagrebarbandinfo = "uint cbSize;uint fMask;uint fStyle;dword clrFore;dword clrBack;ptr lpText;uint cch;" & "int iImage;hwnd hwndChild;uint cxMinChild;uint cyMinChild;uint cx;handle hbmBack;uint wID;uint cyChild;uint cyMaxChild;" & "uint cyIntegral;uint cxIdeal;lparam lParam;uint cxHeader;" & $tagrect & ";uint uChevronState"
Global Const $tagnmrebarautobreak = $tagnmhdr & ";uint uBand;uint wID;lparam lParam;uint uMsg;uint fStyleCurrent;bool fAutoBreak"
Global Const $tagnmrbautosize = $tagnmhdr & ";bool fChanged;" & "struct;long TargetLeft;long TargetTop;long TargetRight;long TargetBottom;endstruct;" & "struct;long ActualLeft;long ActualTop;long ActualRight;long ActualBottom;endstruct"
Global Const $tagnmrebar = $tagnmhdr & ";dword dwMask;uint uBand;uint fStyle;uint wID;lparam lParam"
Global Const $tagnmrebarchevron = $tagnmhdr & ";uint uBand;uint wID;lparam lParam;" & $tagrect & ";lparam lParamNM"
Global Const $tagnmrebarchildsize = $tagnmhdr & ";uint uBand;uint wID;" & "struct;long CLeft;long CTop;long CRight;long CBottom;endstruct;" & "struct;long BLeft;long BTop;long BRight;long BBottom;endstruct"
Global Const $tagcolorscheme = "dword Size;dword BtnHighlight;dword BtnShadow"
Global Const $tagnmtoolbar = $tagnmhdr & ";int iItem;" & "struct;int iBitmap;int idCommand;byte fsState;byte fsStyle;dword_ptr dwData;int_ptr iString;endstruct" & ";int cchText;ptr pszText;" & $tagrect
Global Const $tagnmtbhotitem = $tagnmhdr & ";int idOld;int idNew;dword dwFlags"
Global Const $tagtbbutton = "int Bitmap;int Command;byte State;byte Style;align;dword_ptr Param;int_ptr String"
Global Const $tagtbbuttoninfo = "uint Size;dword Mask;int Command;int Image;byte State;byte Style;word CX;dword_ptr Param;ptr Text;int TextMax"
Global Const $tagnetresource = "dword Scope;dword Type;dword DisplayType;dword Usage;ptr LocalName;ptr RemoteName;ptr Comment;ptr Provider"
Global Const $tagoverlapped = "ulong_ptr Internal;ulong_ptr InternalHigh;struct;dword Offset;dword OffsetHigh;endstruct;handle hEvent"
Global Const $tagopenfilename = "dword StructSize;hwnd hwndOwner;handle hInstance;ptr lpstrFilter;ptr lpstrCustomFilter;" & "dword nMaxCustFilter;dword nFilterIndex;ptr lpstrFile;dword nMaxFile;ptr lpstrFileTitle;dword nMaxFileTitle;" & "ptr lpstrInitialDir;ptr lpstrTitle;dword Flags;word nFileOffset;word nFileExtension;ptr lpstrDefExt;lparam lCustData;" & "ptr lpfnHook;ptr lpTemplateName;ptr pvReserved;dword dwReserved;dword FlagsEx"
Global Const $tagbitmapinfo = "struct;dword Size;long Width;long Height;word Planes;word BitCount;dword Compression;dword SizeImage;" & "long XPelsPerMeter;long YPelsPerMeter;dword ClrUsed;dword ClrImportant;endstruct;dword RGBQuad"
Global Const $tagblendfunction = "byte Op;byte Flags;byte Alpha;byte Format"
Global Const $tagguid = "ulong Data1;ushort Data2;ushort Data3;byte Data4[8]"
Global Const $tagwindowplacement = "uint length;uint flags;uint showCmd;long ptMinPosition[2];long ptMaxPosition[2];long rcNormalPosition[4]"
Global Const $tagwindowpos = "hwnd hWnd;hwnd InsertAfter;int X;int Y;int CX;int CY;uint Flags"
Global Const $tagscrollinfo = "uint cbSize;uint fMask;int nMin;int nMax;uint nPage;int nPos;int nTrackPos"
Global Const $tagscrollbarinfo = "dword cbSize;" & $tagrect & ";int dxyLineButton;int xyThumbTop;" & "int xyThumbBottom;int reserved;dword rgstate[6]"
Global Const $taglogfont = "long Height;long Width;long Escapement;long Orientation;long Weight;byte Italic;byte Underline;" & "byte Strikeout;byte CharSet;byte OutPrecision;byte ClipPrecision;byte Quality;byte PitchAndFamily;wchar FaceName[32]"
Global Const $tagkbdllhookstruct = "dword vkCode;dword scanCode;dword flags;dword time;ulong_ptr dwExtraInfo"
Global Const $tagprocess_information = "handle hProcess;handle hThread;dword ProcessID;dword ThreadID"
Global Const $tagstartupinfo = "dword Size;ptr Reserved1;ptr Desktop;ptr Title;dword X;dword Y;dword XSize;dword YSize;dword XCountChars;" & "dword YCountChars;dword FillAttribute;dword Flags;word ShowWindow;word Reserved2;ptr Reserved3;handle StdInput;" & "handle StdOutput;handle StdError"
Global Const $tagsecurity_attributes = "dword Length;ptr Descriptor;bool InheritHandle"
Global Const $tagwin32_find_data = "dword dwFileAttributes;dword ftCreationTime[2];dword ftLastAccessTime[2];dword ftLastWriteTime[2];dword nFileSizeHigh;dword nFileSizeLow;dword dwReserved0;dword dwReserved1;wchar cFileName[260];wchar cAlternateFileName[14]"
Global Const $tagtextmetric = "long tmHeight;long tmAscent;long tmDescent;long tmInternalLeading;long tmExternalLeading;" & "long tmAveCharWidth;long tmMaxCharWidth;long tmWeight;long tmOverhang;long tmDigitizedAspectX;long tmDigitizedAspectY;" & "wchar tmFirstChar;wchar tmLastChar;wchar tmDefaultChar;wchar tmBreakChar;byte tmItalic;byte tmUnderlined;byte tmStruckOut;" & "byte tmPitchAndFamily;byte tmCharSet"
Global Const $fc_nooverwrite = 0
Global Const $fc_overwrite = 1
Global Const $ft_modified = 0
Global Const $ft_created = 1
Global Const $ft_accessed = 2
Global Const $fo_read = 0
Global Const $fo_append = 1
Global Const $fo_overwrite = 2
Global Const $fo_binary = 16
Global Const $fo_unicode = 32
Global Const $fo_utf16_le = 32
Global Const $fo_utf16_be = 64
Global Const $fo_utf8 = 128
Global Const $fo_utf8_nobom = 256
Global Const $eof = -1
Global Const $fd_filemustexist = 1
Global Const $fd_pathmustexist = 2
Global Const $fd_multiselect = 4
Global Const $fd_promptcreatenew = 8
Global Const $fd_promptoverwrite = 16
Global Const $create_new = 1
Global Const $create_always = 2
Global Const $open_existing = 3
Global Const $open_always = 4
Global Const $truncate_existing = 5
Global Const $invalid_set_file_pointer = -1
Global Const $file_begin = 0
Global Const $file_current = 1
Global Const $file_end = 2
Global Const $file_attribute_readonly = 1
Global Const $file_attribute_hidden = 2
Global Const $file_attribute_system = 4
Global Const $file_attribute_directory = 16
Global Const $file_attribute_archive = 32
Global Const $file_attribute_device = 64
Global Const $file_attribute_normal = 128
Global Const $file_attribute_temporary = 256
Global Const $file_attribute_sparse_file = 512
Global Const $file_attribute_reparse_point = 1024
Global Const $file_attribute_compressed = 2048
Global Const $file_attribute_offline = 4096
Global Const $file_attribute_not_content_indexed = 8192
Global Const $file_attribute_encrypted = 16384
Global Const $file_share_read = 1
Global Const $file_share_write = 2
Global Const $file_share_delete = 4
Global Const $generic_all = 268435456
Global Const $generic_execute = 536870912
Global Const $generic_write = 1073741824
Global Const $generic_read = -2147483648
Global Const $error_no_token = 1008
Global Const $se_assignprimarytoken_name = "SeAssignPrimaryTokenPrivilege"
Global Const $se_audit_name = "SeAuditPrivilege"
Global Const $se_backup_name = "SeBackupPrivilege"
Global Const $se_change_notify_name = "SeChangeNotifyPrivilege"
Global Const $se_create_global_name = "SeCreateGlobalPrivilege"
Global Const $se_create_pagefile_name = "SeCreatePagefilePrivilege"
Global Const $se_create_permanent_name = "SeCreatePermanentPrivilege"
Global Const $se_create_token_name = "SeCreateTokenPrivilege"
Global Const $se_debug_name = "SeDebugPrivilege"
Global Const $se_enable_delegation_name = "SeEnableDelegationPrivilege"
Global Const $se_impersonate_name = "SeImpersonatePrivilege"
Global Const $se_inc_base_priority_name = "SeIncreaseBasePriorityPrivilege"
Global Const $se_increase_quota_name = "SeIncreaseQuotaPrivilege"
Global Const $se_load_driver_name = "SeLoadDriverPrivilege"
Global Const $se_lock_memory_name = "SeLockMemoryPrivilege"
Global Const $se_machine_account_name = "SeMachineAccountPrivilege"
Global Const $se_manage_volume_name = "SeManageVolumePrivilege"
Global Const $se_prof_single_process_name = "SeProfileSingleProcessPrivilege"
Global Const $se_remote_shutdown_name = "SeRemoteShutdownPrivilege"
Global Const $se_restore_name = "SeRestorePrivilege"
Global Const $se_security_name = "SeSecurityPrivilege"
Global Const $se_shutdown_name = "SeShutdownPrivilege"
Global Const $se_sync_agent_name = "SeSyncAgentPrivilege"
Global Const $se_system_environment_name = "SeSystemEnvironmentPrivilege"
Global Const $se_system_profile_name = "SeSystemProfilePrivilege"
Global Const $se_systemtime_name = "SeSystemtimePrivilege"
Global Const $se_take_ownership_name = "SeTakeOwnershipPrivilege"
Global Const $se_tcb_name = "SeTcbPrivilege"
Global Const $se_unsolicited_input_name = "SeUnsolicitedInputPrivilege"
Global Const $se_undock_name = "SeUndockPrivilege"
Global Const $se_privilege_enabled_by_default = 1
Global Const $se_privilege_enabled = 2
Global Const $se_privilege_removed = 4
Global Const $se_privilege_used_for_access = -2147483648
Global Const $se_group_mandatory = 1
Global Const $se_group_enabled_by_default = 2
Global Const $se_group_enabled = 4
Global Const $se_group_owner = 8
Global Const $se_group_use_for_deny_only = 16
Global Const $se_group_integrity = 32
Global Const $se_group_integrity_enabled = 64
Global Const $se_group_resource = 536870912
Global Const $se_group_logon_id = -1073741824
Global Enum $tokenprimary = 1, $tokenimpersonation
Global Enum $securityanonymous = 0, $securityidentification, $securityimpersonation, $securitydelegation
Global Enum $tokenuser = 1, $tokengroups, $tokenprivileges, $tokenowner, $tokenprimarygroup, $tokendefaultdacl, $tokensource, $tokentype, $tokenimpersonationlevel, $tokenstatistics, $tokenrestrictedsids, $tokensessionid, $tokengroupsandprivileges, $tokensessionreference, $tokensandboxinert, $tokenauditpolicy, $tokenorigin, $tokenelevationtype, $tokenlinkedtoken, $tokenelevation, $tokenhasrestrictions, $tokenaccessinformation, $tokenvirtualizationallowed, $tokenvirtualizationenabled, $tokenintegritylevel, $tokenuiaccess, $tokenmandatorypolicy, $tokenlogonsid
Global Const $token_assign_primary = 1
Global Const $token_duplicate = 2
Global Const $token_impersonate = 4
Global Const $token_query = 8
Global Const $token_query_source = 16
Global Const $token_adjust_privileges = 32
Global Const $token_adjust_groups = 64
Global Const $token_adjust_default = 128
Global Const $token_adjust_sessionid = 256
Global Const $token_all_access = 983551
Global Const $token_read = 131080
Global Const $token_write = 131296
Global Const $token_execute = 131072
Global Const $token_has_traverse_privilege = 1
Global Const $token_has_backup_privilege = 2
Global Const $token_has_restore_privilege = 4
Global Const $token_has_admin_group = 8
Global Const $token_is_restricted = 16
Global Const $token_session_not_referenced = 32
Global Const $token_sandbox_inert = 64
Global Const $token_has_impersonate_privilege = 128
Global Const $rights_delete = 65536
Global Const $read_control = 131072
Global Const $write_dac = 262144
Global Const $write_owner = 524288
Global Const $synchronize = 1048576
Global Const $standard_rights_required = 983040
Global Const $standard_rights_read = $read_control
Global Const $standard_rights_write = $read_control
Global Const $standard_rights_execute = $read_control
Global Const $standard_rights_all = 2031616
Global Const $specific_rights_all = 65535
Global Enum $not_used_access = 0, $grant_access, $set_access, $deny_access, $revoke_access, $set_audit_success, $set_audit_failure
Global Enum $trustee_is_unknown = 0, $trustee_is_user, $trustee_is_group, $trustee_is_domain, $trustee_is_alias, $trustee_is_well_known_group, $trustee_is_deleted, $trustee_is_invalid, $trustee_is_computer
Global Const $logon_with_profile = 1
Global Const $logon_netcredentials_only = 2
Global Enum $sidtypeuser = 1, $sidtypegroup, $sidtypedomain, $sidtypealias, $sidtypewellknowngroup, $sidtypedeletedaccount, $sidtypeinvalid, $sidtypeunknown, $sidtypecomputer, $sidtypelabel
Global Const $sid_administrators = "S-1-5-32-544"
Global Const $sid_users = "S-1-5-32-545"
Global Const $sid_guests = "S-1-5-32-546"
Global Const $sid_account_operators = "S-1-5-32-548"
Global Const $sid_server_operators = "S-1-5-32-549"
Global Const $sid_print_operators = "S-1-5-32-550"
Global Const $sid_backup_operators = "S-1-5-32-551"
Global Const $sid_replicator = "S-1-5-32-552"
Global Const $sid_owner = "S-1-3-0"
Global Const $sid_everyone = "S-1-1-0"
Global Const $sid_network = "S-1-5-2"
Global Const $sid_interactive = "S-1-5-4"
Global Const $sid_system = "S-1-5-18"
Global Const $sid_authenticated_users = "S-1-5-11"
Global Const $sid_schannel_authentication = "S-1-5-64-14"
Global Const $sid_digest_authentication = "S-1-5-64-21"
Global Const $sid_nt_service = "S-1-5-80"
Global Const $sid_untrusted_mandatory_level = "S-1-16-0"
Global Const $sid_low_mandatory_level = "S-1-16-4096"
Global Const $sid_medium_mandatory_level = "S-1-16-8192"
Global Const $sid_medium_plus_mandatory_level = "S-1-16-8448"
Global Const $sid_high_mandatory_level = "S-1-16-12288"
Global Const $sid_system_mandatory_level = "S-1-16-16384"
Global Const $sid_protected_process_mandatory_level = "S-1-16-20480"
Global Const $sid_secure_process_mandatory_level = "S-1-16-28672"
Global Const $sid_all_services = "S-1-5-80-0"

Func _winapi_getlasterror($curerr = @error, $curext = @extended)
	Local $aresult = DllCall("kernel32.dll", "dword", "GetLastError")
	Return SetError($curerr, $curext, $aresult[0])
EndFunc

Func _winapi_setlasterror($ierrcode, $curerr = @error, $curext = @extended)
	DllCall("kernel32.dll", "none", "SetLastError", "dword", $ierrcode)
	Return SetError($curerr, $curext)
EndFunc

Func _security__adjusttokenprivileges($htoken, $fdisableall, $pnewstate, $ibufferlen, $pprevstate = 0, $prequired = 0)
	Local $acall = DllCall("advapi32.dll", "bool", "AdjustTokenPrivileges", "handle", $htoken, "bool", $fdisableall, "struct*", $pnewstate, "dword", $ibufferlen, "struct*", $pprevstate, "struct*", $prequired)
	If @error Then Return SetError(1, @extended, False)
	Return NOT ($acall[0] = 0)
EndFunc

Func _security__createprocesswithtoken($htoken, $ilogonflags, $scommandline, $icreationflags, $scurdir, $tstartupinfo, $tprocess_information)
	Local $acall = DllCall("advapi32.dll", "bool", "CreateProcessWithTokenW", "handle", $htoken, "dword", $ilogonflags, "ptr", 0, "wstr", $scommandline, "dword", $icreationflags, "struct*", 0, "wstr", $scurdir, "struct*", $tstartupinfo, "struct*", $tprocess_information)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, False)
	Return True
EndFunc

Func _security__duplicatetokenex($hexistingtoken, $idesiredaccess, $iimpersonationlevel, $itokentype)
	Local $acall = DllCall("advapi32.dll", "bool", "DuplicateTokenEx", "handle", $hexistingtoken, "dword", $idesiredaccess, "struct*", 0, "int", $iimpersonationlevel, "int", $itokentype, "handle*", 0)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, 0)
	Return $acall[6]
EndFunc

Func _security__getaccountsid($saccount, $ssystem = "")
	Local $aacct = _security__lookupaccountname($saccount, $ssystem)
	If @error Then Return SetError(@error, @extended, 0)
	If IsArray($aacct) Then Return _security__stringsidtosid($aacct[0])
	Return ""
EndFunc

Func _security__getlengthsid($psid)
	If NOT _security__isvalidsid($psid) Then Return SetError(1, @extended, 0)
	Local $acall = DllCall("advapi32.dll", "dword", "GetLengthSid", "struct*", $psid)
	If @error Then Return SetError(2, @extended, 0)
	Return $acall[0]
EndFunc

Func _security__gettokeninformation($htoken, $iclass)
	Local $acall = DllCall("advapi32.dll", "bool", "GetTokenInformation", "handle", $htoken, "int", $iclass, "struct*", 0, "dword", 0, "dword*", 0)
	If @error OR NOT $acall[5] Then Return SetError(1, @extended, 0)
	Local $ilen = $acall[5]
	Local $tbuffer = DllStructCreate("byte[" & $ilen & "]")
	$acall = DllCall("advapi32.dll", "bool", "GetTokenInformation", "handle", $htoken, "int", $iclass, "struct*", $tbuffer, "dword", DllStructGetSize($tbuffer), "dword*", 0)
	If @error OR NOT $acall[0] Then Return SetError(2, @extended, 0)
	Return $tbuffer
EndFunc

Func _security__impersonateself($ilevel = $securityimpersonation)
	Local $acall = DllCall("advapi32.dll", "bool", "ImpersonateSelf", "int", $ilevel)
	If @error Then Return SetError(1, @extended, False)
	Return NOT ($acall[0] = 0)
EndFunc

Func _security__isvalidsid($psid)
	Local $acall = DllCall("advapi32.dll", "bool", "IsValidSid", "struct*", $psid)
	If @error Then Return SetError(1, @extended, False)
	Return NOT ($acall[0] = 0)
EndFunc

Func _security__lookupaccountname($saccount, $ssystem = "")
	Local $tdata = DllStructCreate("byte SID[256]")
	Local $acall = DllCall("advapi32.dll", "bool", "LookupAccountNameW", "wstr", $ssystem, "wstr", $saccount, "struct*", $tdata, "dword*", DllStructGetSize($tdata), "wstr", "", "dword*", DllStructGetSize($tdata), "int*", 0)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, 0)
	Local $aacct[3]
	$aacct[0] = _security__sidtostringsid(DllStructGetPtr($tdata, "SID"))
	$aacct[1] = $acall[5]
	$aacct[2] = $acall[7]
	Return $aacct
EndFunc

Func _security__lookupaccountsid($vsid, $ssystem = "")
	Local $psid, $aacct[3]
	If IsString($vsid) Then
		$psid = _security__stringsidtosid($vsid)
	Else
		$psid = $vsid
	EndIf
	If NOT _security__isvalidsid($psid) Then Return SetError(1, @extended, 0)
	Local $typesystem = "ptr"
	If $ssystem Then $typesystem = "wstr"
	Local $acall = DllCall("advapi32.dll", "bool", "LookupAccountSidW", $typesystem, $ssystem, "struct*", $psid, "wstr", "", "dword*", 65536, "wstr", "", "dword*", 65536, "int*", 0)
	If @error OR NOT $acall[0] Then Return SetError(2, @extended, 0)
	Local $aacct[3]
	$aacct[0] = $acall[3]
	$aacct[1] = $acall[5]
	$aacct[2] = $acall[7]
	Return $aacct
EndFunc

Func _security__lookupprivilegevalue($ssystem, $sname)
	Local $acall = DllCall("advapi32.dll", "bool", "LookupPrivilegeValueW", "wstr", $ssystem, "wstr", $sname, "int64*", 0)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, 0)
	Return $acall[3]
EndFunc

Func _security__openprocesstoken($hprocess, $iaccess)
	Local $acall = DllCall("advapi32.dll", "bool", "OpenProcessToken", "handle", $hprocess, "dword", $iaccess, "handle*", 0)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, 0)
	Return $acall[3]
EndFunc

Func _security__openthreadtoken($iaccess, $hthread = 0, $fopenasself = False)
	If $hthread = 0 Then $hthread = _winapi_getcurrentthread()
	If @error Then Return SetError(1, @extended, 0)
	Local $acall = DllCall("advapi32.dll", "bool", "OpenThreadToken", "handle", $hthread, "dword", $iaccess, "bool", $fopenasself, "handle*", 0)
	If @error OR NOT $acall[0] Then Return SetError(2, @extended, 0)
	Return $acall[4]
EndFunc

Func _security__openthreadtokenex($iaccess, $hthread = 0, $fopenasself = False)
	Local $htoken = _security__openthreadtoken($iaccess, $hthread, $fopenasself)
	If $htoken = 0 Then
		If _winapi_getlasterror() <> $error_no_token Then Return SetError(3, _winapi_getlasterror(), 0)
		If NOT _security__impersonateself() Then Return SetError(1, _winapi_getlasterror(), 0)
		$htoken = _security__openthreadtoken($iaccess, $hthread, $fopenasself)
		If $htoken = 0 Then Return SetError(2, _winapi_getlasterror(), 0)
	EndIf
	Return $htoken
EndFunc

Func _security__setprivilege($htoken, $sprivilege, $fenable)
	Local $iluid = _security__lookupprivilegevalue("", $sprivilege)
	If $iluid = 0 Then Return SetError(1, @extended, False)
	Local $tcurrstate = DllStructCreate($tagtoken_privileges)
	Local $icurrstate = DllStructGetSize($tcurrstate)
	Local $tprevstate = DllStructCreate($tagtoken_privileges)
	Local $iprevstate = DllStructGetSize($tprevstate)
	Local $trequired = DllStructCreate("int Data")
	DllStructSetData($tcurrstate, "Count", 1)
	DllStructSetData($tcurrstate, "LUID", $iluid)
	If NOT _security__adjusttokenprivileges($htoken, False, $tcurrstate, $icurrstate, $tprevstate, $trequired) Then Return SetError(2, @error, False)
	DllStructSetData($tprevstate, "Count", 1)
	DllStructSetData($tprevstate, "LUID", $iluid)
	Local $iattributes = DllStructGetData($tprevstate, "Attributes")
	If $fenable Then
		$iattributes = BitOR($iattributes, $se_privilege_enabled)
	Else
		$iattributes = BitAND($iattributes, BitNOT($se_privilege_enabled))
	EndIf
	DllStructSetData($tprevstate, "Attributes", $iattributes)
	If NOT _security__adjusttokenprivileges($htoken, False, $tprevstate, $iprevstate, $tcurrstate, $trequired) Then Return SetError(3, @error, False)
	Return True
EndFunc

Func _security__settokeninformation($htoken, $itokeninformation, $vtokeninformation, $itokeninformationlength)
	Local $acall = DllCall("advapi32.dll", "bool", "SetTokenInformation", "handle", $htoken, "int", $itokeninformation, "struct*", $vtokeninformation, "dword", $itokeninformationlength)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, False)
	Return True
EndFunc

Func _security__sidtostringsid($psid)
	If NOT _security__isvalidsid($psid) Then Return SetError(1, 0, "")
	Local $acall = DllCall("advapi32.dll", "bool", "ConvertSidToStringSidW", "struct*", $psid, "ptr*", 0)
	If @error OR NOT $acall[0] Then Return SetError(2, @extended, "")
	Local $pstringsid = $acall[2]
	Local $ssid = DllStructGetData(DllStructCreate("wchar Text[" & _winapi_stringlenw($pstringsid) + 1 & "]", $pstringsid), "Text")
	_winapi_localfree($pstringsid)
	Return $ssid
EndFunc

Func _security__sidtypestr($itype)
	Switch $itype
		Case $sidtypeuser
			Return "User"
		Case $sidtypegroup
			Return "Group"
		Case $sidtypedomain
			Return "Domain"
		Case $sidtypealias
			Return "Alias"
		Case $sidtypewellknowngroup
			Return "Well Known Group"
		Case $sidtypedeletedaccount
			Return "Deleted Account"
		Case $sidtypeinvalid
			Return "Invalid"
		Case $sidtypeunknown
			Return "Unknown Type"
		Case $sidtypecomputer
			Return "Computer"
		Case $sidtypelabel
			Return "A mandatory integrity label SID"
		Case Else
			Return "Unknown SID Type"
	EndSwitch
EndFunc

Func _security__stringsidtosid($ssid)
	Local $acall = DllCall("advapi32.dll", "bool", "ConvertStringSidToSidW", "wstr", $ssid, "ptr*", 0)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, 0)
	Local $psid = $acall[2]
	Local $tbuffer = DllStructCreate("byte Data[" & _security__getlengthsid($psid) & "]", $psid)
	Local $tsid = DllStructCreate("byte Data[" & DllStructGetSize($tbuffer) & "]")
	DllStructSetData($tsid, "Data", DllStructGetData($tbuffer, "Data"))
	_winapi_localfree($psid)
	Return $tsid
EndFunc

Func _sendmessage($hwnd, $imsg, $wparam = 0, $lparam = 0, $ireturn = 0, $wparamtype = "wparam", $lparamtype = "lparam", $sreturntype = "lresult")
	Local $aresult = DllCall("user32.dll", $sreturntype, "SendMessageW", "hwnd", $hwnd, "uint", $imsg, $wparamtype, $wparam, $lparamtype, $lparam)
	If @error Then Return SetError(@error, @extended, "")
	If $ireturn >= 0 AND $ireturn <= 4 Then Return $aresult[$ireturn]
	Return $aresult
EndFunc

Func _sendmessagea($hwnd, $imsg, $wparam = 0, $lparam = 0, $ireturn = 0, $wparamtype = "wparam", $lparamtype = "lparam", $sreturntype = "lresult")
	Local $aresult = DllCall("user32.dll", $sreturntype, "SendMessageA", "hwnd", $hwnd, "uint", $imsg, $wparamtype, $wparam, $lparamtype, $lparam)
	If @error Then Return SetError(@error, @extended, "")
	If $ireturn >= 0 AND $ireturn <= 4 Then Return $aresult[$ireturn]
	Return $aresult
EndFunc

Global $__gainprocess_winapi[64][2] = [[0, 0]]
Global $__gawinlist_winapi[64][2] = [[0, 0]]
Global Const $__winapiconstant_wm_setfont = 48
Global Const $__winapiconstant_fw_normal = 400
Global Const $__winapiconstant_default_charset = 1
Global Const $__winapiconstant_out_default_precis = 0
Global Const $__winapiconstant_clip_default_precis = 0
Global Const $__winapiconstant_default_quality = 0
Global Const $__winapiconstant_format_message_allocate_buffer = 256
Global Const $__winapiconstant_format_message_from_system = 4096
Global Const $__winapiconstant_logpixelsx = 88
Global Const $__winapiconstant_logpixelsy = 90
Global Const $hgdi_error = Ptr(-1)
Global Const $invalid_handle_value = Ptr(-1)
Global Const $clr_invalid = -1
Global Const $__winapiconstant_flashw_caption = 1
Global Const $__winapiconstant_flashw_tray = 2
Global Const $__winapiconstant_flashw_timer = 4
Global Const $__winapiconstant_flashw_timernofg = 12
Global Const $__winapiconstant_gw_hwndnext = 2
Global Const $__winapiconstant_gw_child = 5
Global Const $__winapiconstant_di_mask = 1
Global Const $__winapiconstant_di_image = 2
Global Const $__winapiconstant_di_normal = 3
Global Const $__winapiconstant_di_compat = 4
Global Const $__winapiconstant_di_defaultsize = 8
Global Const $__winapiconstant_di_nomirror = 16
Global Const $__winapiconstant_display_device_attached_to_desktop = 1
Global Const $__winapiconstant_display_device_primary_device = 4
Global Const $__winapiconstant_display_device_mirroring_driver = 8
Global Const $__winapiconstant_display_device_vga_compatible = 16
Global Const $__winapiconstant_display_device_removable = 32
Global Const $__winapiconstant_display_device_modespruned = 134217728
Global Const $null_brush = 5
Global Const $null_pen = 8
Global Const $black_brush = 4
Global Const $dkgray_brush = 3
Global Const $dc_brush = 18
Global Const $gray_brush = 2
Global Const $hollow_brush = $null_brush
Global Const $ltgray_brush = 1
Global Const $white_brush = 0
Global Const $black_pen = 7
Global Const $dc_pen = 19
Global Const $white_pen = 6
Global Const $ansi_fixed_font = 11
Global Const $ansi_var_font = 12
Global Const $device_default_font = 14
Global Const $default_gui_font = 17
Global Const $oem_fixed_font = 10
Global Const $system_font = 13
Global Const $system_fixed_font = 16
Global Const $default_palette = 15
Global Const $mb_precomposed = 1
Global Const $mb_composite = 2
Global Const $mb_useglyphchars = 4
Global Const $ulw_alpha = 2
Global Const $ulw_colorkey = 1
Global Const $ulw_opaque = 4
Global Const $wh_callwndproc = 4
Global Const $wh_callwndprocret = 12
Global Const $wh_cbt = 5
Global Const $wh_debug = 9
Global Const $wh_foregroundidle = 11
Global Const $wh_getmessage = 3
Global Const $wh_journalplayback = 1
Global Const $wh_journalrecord = 0
Global Const $wh_keyboard = 2
Global Const $wh_keyboard_ll = 13
Global Const $wh_mouse = 7
Global Const $wh_mouse_ll = 14
Global Const $wh_msgfilter = -1
Global Const $wh_shell = 10
Global Const $wh_sysmsgfilter = 6
Global Const $wpf_asyncwindowplacement = 4
Global Const $wpf_restoretomaximized = 2
Global Const $wpf_setminposition = 1
Global Const $kf_extended = 256
Global Const $kf_altdown = 8192
Global Const $kf_up = 32768
Global Const $llkhf_extended = BitShift($kf_extended, 8)
Global Const $llkhf_injected = 16
Global Const $llkhf_altdown = BitShift($kf_altdown, 8)
Global Const $llkhf_up = BitShift($kf_up, 8)
Global Const $ofn_allowmultiselect = 512
Global Const $ofn_createprompt = 8192
Global Const $ofn_dontaddtorecent = 33554432
Global Const $ofn_enablehook = 32
Global Const $ofn_enableincludenotify = 4194304
Global Const $ofn_enablesizing = 8388608
Global Const $ofn_enabletemplate = 64
Global Const $ofn_enabletemplatehandle = 128
Global Const $ofn_explorer = 524288
Global Const $ofn_extensiondifferent = 1024
Global Const $ofn_filemustexist = 4096
Global Const $ofn_forceshowhidden = 268435456
Global Const $ofn_hidereadonly = 4
Global Const $ofn_longnames = 2097152
Global Const $ofn_nochangedir = 8
Global Const $ofn_nodereferencelinks = 1048576
Global Const $ofn_nolongnames = 262144
Global Const $ofn_nonetworkbutton = 131072
Global Const $ofn_noreadonlyreturn = 32768
Global Const $ofn_notestfilecreate = 65536
Global Const $ofn_novalidate = 256
Global Const $ofn_overwriteprompt = 2
Global Const $ofn_pathmustexist = 2048
Global Const $ofn_readonly = 1
Global Const $ofn_shareaware = 16384
Global Const $ofn_showhelp = 16
Global Const $ofn_ex_noplacesbar = 1
Global Const $tmpf_fixed_pitch = 1
Global Const $tmpf_vector = 2
Global Const $tmpf_truetype = 4
Global Const $tmpf_device = 8
Global Const $duplicate_close_source = 1
Global Const $duplicate_same_access = 2
Global Const $tagcursorinfo = "dword Size;dword Flags;handle hCursor;" & $tagpoint
Global Const $tagdisplay_device = "dword Size;wchar Name[32];wchar String[128];dword Flags;wchar ID[128];wchar Key[128]"
Global Const $tagflashwinfo = "uint Size;hwnd hWnd;dword Flags;uint Count;dword TimeOut"
Global Const $tagiconinfo = "bool Icon;dword XHotSpot;dword YHotSpot;handle hMask;handle hColor"
Global Const $tagmemorystatusex = "dword Length;dword MemoryLoad;" & "uint64 TotalPhys;uint64 AvailPhys;uint64 TotalPageFile;uint64 AvailPageFile;" & "uint64 TotalVirtual;uint64 AvailVirtual;uint64 AvailExtendedVirtual"

Func _winapi_attachconsole($iprocessid = -1)
	Local $aresult = DllCall("kernel32.dll", "bool", "AttachConsole", "dword", $iprocessid)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_attachthreadinput($iattach, $iattachto, $fattach)
	Local $aresult = DllCall("user32.dll", "bool", "AttachThreadInput", "dword", $iattach, "dword", $iattachto, "bool", $fattach)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_beep($ifreq = 500, $iduration = 1000)
	Local $aresult = DllCall("kernel32.dll", "bool", "Beep", "dword", $ifreq, "dword", $iduration)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_bitblt($hdestdc, $ixdest, $iydest, $iwidth, $iheight, $hsrcdc, $ixsrc, $iysrc, $irop)
	Local $aresult = DllCall("gdi32.dll", "bool", "BitBlt", "handle", $hdestdc, "int", $ixdest, "int", $iydest, "int", $iwidth, "int", $iheight, "handle", $hsrcdc, "int", $ixsrc, "int", $iysrc, "dword", $irop)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_callnexthookex($hhk, $icode, $wparam, $lparam)
	Local $aresult = DllCall("user32.dll", "lresult", "CallNextHookEx", "handle", $hhk, "int", $icode, "wparam", $wparam, "lparam", $lparam)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_callwindowproc($lpprevwndfunc, $hwnd, $msg, $wparam, $lparam)
	Local $aresult = DllCall("user32.dll", "lresult", "CallWindowProc", "ptr", $lpprevwndfunc, "hwnd", $hwnd, "uint", $msg, "wparam", $wparam, "lparam", $lparam)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_clienttoscreen($hwnd, ByRef $tpoint)
	DllCall("user32.dll", "bool", "ClientToScreen", "hwnd", $hwnd, "struct*", $tpoint)
	Return SetError(@error, @extended, $tpoint)
EndFunc

Func _winapi_closehandle($hobject)
	Local $aresult = DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hobject)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_combinergn($hrgndest, $hrgnsrc1, $hrgnsrc2, $icombinemode)
	Local $aresult = DllCall("gdi32.dll", "int", "CombineRgn", "handle", $hrgndest, "handle", $hrgnsrc1, "handle", $hrgnsrc2, "int", $icombinemode)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_commdlgextendederror()
	Local Const $cderr_dialogfailure = 65535
	Local Const $cderr_findresfailure = 6
	Local Const $cderr_initialization = 2
	Local Const $cderr_loadresfailure = 7
	Local Const $cderr_loadstrfailure = 5
	Local Const $cderr_lockresfailure = 8
	Local Const $cderr_memallocfailure = 9
	Local Const $cderr_memlockfailure = 10
	Local Const $cderr_nohinstance = 4
	Local Const $cderr_nohook = 11
	Local Const $cderr_notemplate = 3
	Local Const $cderr_registermsgfail = 12
	Local Const $cderr_structsize = 1
	Local Const $fnerr_buffertoosmall = 12291
	Local Const $fnerr_invalidfilename = 12290
	Local Const $fnerr_subclassfailure = 12289
	Local $aresult = DllCall("comdlg32.dll", "dword", "CommDlgExtendedError")
	If @error Then Return SetError(@error, @extended, 0)
	Switch $aresult[0]
		Case $cderr_dialogfailure
			Return SetError($aresult[0], 0, "The dialog box could not be created." & @LF & "The common dialog box function's call to the DialogBox function failed." & @LF & "For example, this error occurs if the common dialog box call specifies an invalid window handle.")
		Case $cderr_findresfailure
			Return SetError($aresult[0], 0, "The common dialog box function failed to find a specified resource.")
		Case $cderr_initialization
			Return SetError($aresult[0], 0, "The common dialog box function failed during initialization." & @LF & "This error often occurs when sufficient memory is not available.")
		Case $cderr_loadresfailure
			Return SetError($aresult[0], 0, "The common dialog box function failed to load a specified resource.")
		Case $cderr_loadstrfailure
			Return SetError($aresult[0], 0, "The common dialog box function failed to load a specified string.")
		Case $cderr_lockresfailure
			Return SetError($aresult[0], 0, "The common dialog box function failed to lock a specified resource.")
		Case $cderr_memallocfailure
			Return SetError($aresult[0], 0, "The common dialog box function was unable to allocate memory for internal structures.")
		Case $cderr_memlockfailure
			Return SetError($aresult[0], 0, "The common dialog box function was unable to lock the memory associated with a handle.")
		Case $cderr_nohinstance
			Return SetError($aresult[0], 0, "The ENABLETEMPLATE flag was set in the Flags member of the initialization structure for the corresponding common dialog box," & @LF & "but you failed to provide a corresponding instance handle.")
		Case $cderr_nohook
			Return SetError($aresult[0], 0, "The ENABLEHOOK flag was set in the Flags member of the initialization structure for the corresponding common dialog box," & @LF & "but you failed to provide a pointer to a corresponding hook procedure.")
		Case $cderr_notemplate
			Return SetError($aresult[0], 0, "The ENABLETEMPLATE flag was set in the Flags member of the initialization structure for the corresponding common dialog box," & @LF & "but you failed to provide a corresponding template.")
		Case $cderr_registermsgfail
			Return SetError($aresult[0], 0, "The RegisterWindowMessage function returned an error code when it was called by the common dialog box function.")
		Case $cderr_structsize
			Return SetError($aresult[0], 0, "The lStructSize member of the initialization structure for the corresponding common dialog box is invalid")
		Case $fnerr_buffertoosmall
			Return SetError($aresult[0], 0, "The buffer pointed to by the lpstrFile member of the OPENFILENAME structure is too small for the file name specified by the user." & @LF & "The first two bytes of the lpstrFile buffer contain an integer value specifying the size, in TCHARs, required to receive the full name.")
		Case $fnerr_invalidfilename
			Return SetError($aresult[0], 0, "A file name is invalid.")
		Case $fnerr_subclassfailure
			Return SetError($aresult[0], 0, "An attempt to subclass a list box failed because sufficient memory was not available.")
	EndSwitch
	Return Hex($aresult[0])
EndFunc

Func _winapi_copyicon($hicon)
	Local $aresult = DllCall("user32.dll", "handle", "CopyIcon", "handle", $hicon)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createbitmap($iwidth, $iheight, $iplanes = 1, $ibitsperpel = 1, $pbits = 0)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateBitmap", "int", $iwidth, "int", $iheight, "uint", $iplanes, "uint", $ibitsperpel, "ptr", $pbits)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createcompatiblebitmap($hdc, $iwidth, $iheight)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateCompatibleBitmap", "handle", $hdc, "int", $iwidth, "int", $iheight)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createcompatibledc($hdc)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateCompatibleDC", "handle", $hdc)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createevent($pattributes = 0, $fmanualreset = True, $finitialstate = True, $sname = "")
	Local $snametype = "wstr"
	If $sname = "" Then
		$sname = 0
		$snametype = "ptr"
	EndIf
	Local $aresult = DllCall("kernel32.dll", "handle", "CreateEventW", "ptr", $pattributes, "bool", $fmanualreset, "bool", $finitialstate, $snametype, $sname)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createfile($sfilename, $icreation, $iaccess = 4, $ishare = 0, $iattributes = 0, $psecurity = 0)
	Local $ida = 0, $ism = 0, $icd = 0, $ifa = 0
	If BitAND($iaccess, 1) <> 0 Then $ida = BitOR($ida, $generic_execute)
	If BitAND($iaccess, 2) <> 0 Then $ida = BitOR($ida, $generic_read)
	If BitAND($iaccess, 4) <> 0 Then $ida = BitOR($ida, $generic_write)
	If BitAND($ishare, 1) <> 0 Then $ism = BitOR($ism, $file_share_delete)
	If BitAND($ishare, 2) <> 0 Then $ism = BitOR($ism, $file_share_read)
	If BitAND($ishare, 4) <> 0 Then $ism = BitOR($ism, $file_share_write)
	Switch $icreation
		Case 0
			$icd = $create_new
		Case 1
			$icd = $create_always
		Case 2
			$icd = $open_existing
		Case 3
			$icd = $open_always
		Case 4
			$icd = $truncate_existing
	EndSwitch
	If BitAND($iattributes, 1) <> 0 Then $ifa = BitOR($ifa, $file_attribute_archive)
	If BitAND($iattributes, 2) <> 0 Then $ifa = BitOR($ifa, $file_attribute_hidden)
	If BitAND($iattributes, 4) <> 0 Then $ifa = BitOR($ifa, $file_attribute_readonly)
	If BitAND($iattributes, 8) <> 0 Then $ifa = BitOR($ifa, $file_attribute_system)
	Local $aresult = DllCall("kernel32.dll", "handle", "CreateFileW", "wstr", $sfilename, "dword", $ida, "dword", $ism, "ptr", $psecurity, "dword", $icd, "dword", $ifa, "ptr", 0)
	If @error OR $aresult[0] = Ptr(-1) Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createfont($nheight, $nwidth, $nescape = 0, $norientn = 0, $fnweight = $__winapiconstant_fw_normal, $bitalic = False, $bunderline = False, $bstrikeout = False, $ncharset = $__winapiconstant_default_charset, $noutputprec = $__winapiconstant_out_default_precis, $nclipprec = $__winapiconstant_clip_default_precis, $nquality = $__winapiconstant_default_quality, $npitch = 0, $szface = "Arial")
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateFontW", "int", $nheight, "int", $nwidth, "int", $nescape, "int", $norientn, "int", $fnweight, "dword", $bitalic, "dword", $bunderline, "dword", $bstrikeout, "dword", $ncharset, "dword", $noutputprec, "dword", $nclipprec, "dword", $nquality, "dword", $npitch, "wstr", $szface)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createfontindirect($tlogfont)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateFontIndirectW", "struct*", $tlogfont)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createpen($ipenstyle, $iwidth, $ncolor)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreatePen", "int", $ipenstyle, "int", $iwidth, "dword", $ncolor)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createprocess($sappname, $scommand, $psecurity, $pthread, $finherit, $iflags, $penviron, $sdir, $pstartupinfo, $pprocess)
	Local $tcommand = 0
	Local $sappnametype = "wstr", $sdirtype = "wstr"
	If $sappname = "" Then
		$sappnametype = "ptr"
		$sappname = 0
	EndIf
	If $scommand <> "" Then
		$tcommand = DllStructCreate("wchar Text[" & 260 + 1 & "]")
		DllStructSetData($tcommand, "Text", $scommand)
	EndIf
	If $sdir = "" Then
		$sdirtype = "ptr"
		$sdir = 0
	EndIf
	Local $aresult = DllCall("kernel32.dll", "bool", "CreateProcessW", $sappnametype, $sappname, "struct*", $tcommand, "ptr", $psecurity, "ptr", $pthread, "bool", $finherit, "dword", $iflags, "ptr", $penviron, $sdirtype, $sdir, "ptr", $pstartupinfo, "ptr", $pprocess)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_createrectrgn($ileftrect, $itoprect, $irightrect, $ibottomrect)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateRectRgn", "int", $ileftrect, "int", $itoprect, "int", $irightrect, "int", $ibottomrect)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createroundrectrgn($ileftrect, $itoprect, $irightrect, $ibottomrect, $iwidthellipse, $iheightellipse)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateRoundRectRgn", "int", $ileftrect, "int", $itoprect, "int", $irightrect, "int", $ibottomrect, "int", $iwidthellipse, "int", $iheightellipse)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createsolidbitmap($hwnd, $icolor, $iwidth, $iheight, $brgb = 1)
	Local $hdc = _winapi_getdc($hwnd)
	Local $hdestdc = _winapi_createcompatibledc($hdc)
	Local $hbitmap = _winapi_createcompatiblebitmap($hdc, $iwidth, $iheight)
	Local $hold = _winapi_selectobject($hdestdc, $hbitmap)
	Local $trect = DllStructCreate($tagrect)
	DllStructSetData($trect, 1, 0)
	DllStructSetData($trect, 2, 0)
	DllStructSetData($trect, 3, $iwidth)
	DllStructSetData($trect, 4, $iheight)
	If $brgb Then
		$icolor = BitOR(BitAND($icolor, 65280), BitShift(BitAND($icolor, 255), -16), BitShift(BitAND($icolor, 16711680), 16))
	EndIf
	Local $hbrush = _winapi_createsolidbrush($icolor)
	_winapi_fillrect($hdestdc, $trect, $hbrush)
	If @error Then
		_winapi_deleteobject($hbitmap)
		$hbitmap = 0
	EndIf
	_winapi_deleteobject($hbrush)
	_winapi_releasedc($hwnd, $hdc)
	_winapi_selectobject($hdestdc, $hold)
	_winapi_deletedc($hdestdc)
	If NOT $hbitmap Then Return SetError(1, 0, 0)
	Return $hbitmap
EndFunc

Func _winapi_createsolidbrush($ncolor)
	Local $aresult = DllCall("gdi32.dll", "handle", "CreateSolidBrush", "dword", $ncolor)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_createwindowex($iexstyle, $sclass, $sname, $istyle, $ix, $iy, $iwidth, $iheight, $hparent, $hmenu = 0, $hinstance = 0, $pparam = 0)
	If $hinstance = 0 Then $hinstance = _winapi_getmodulehandle("")
	Local $aresult = DllCall("user32.dll", "hwnd", "CreateWindowExW", "dword", $iexstyle, "wstr", $sclass, "wstr", $sname, "dword", $istyle, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight, "hwnd", $hparent, "handle", $hmenu, "handle", $hinstance, "ptr", $pparam)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_defwindowproc($hwnd, $imsg, $iwparam, $ilparam)
	Local $aresult = DllCall("user32.dll", "lresult", "DefWindowProc", "hwnd", $hwnd, "uint", $imsg, "wparam", $iwparam, "lparam", $ilparam)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_deletedc($hdc)
	Local $aresult = DllCall("gdi32.dll", "bool", "DeleteDC", "handle", $hdc)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_deleteobject($hobject)
	Local $aresult = DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $hobject)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_destroyicon($hicon)
	Local $aresult = DllCall("user32.dll", "bool", "DestroyIcon", "handle", $hicon)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_destroywindow($hwnd)
	Local $aresult = DllCall("user32.dll", "bool", "DestroyWindow", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_drawedge($hdc, $ptrrect, $nedgetype, $grfflags)
	Local $aresult = DllCall("user32.dll", "bool", "DrawEdge", "handle", $hdc, "ptr", $ptrrect, "uint", $nedgetype, "uint", $grfflags)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_drawframecontrol($hdc, $ptrrect, $ntype, $nstate)
	Local $aresult = DllCall("user32.dll", "bool", "DrawFrameControl", "handle", $hdc, "ptr", $ptrrect, "uint", $ntype, "uint", $nstate)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_drawicon($hdc, $ix, $iy, $hicon)
	Local $aresult = DllCall("user32.dll", "bool", "DrawIcon", "handle", $hdc, "int", $ix, "int", $iy, "handle", $hicon)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_drawiconex($hdc, $ix, $iy, $hicon, $iwidth = 0, $iheight = 0, $istep = 0, $hbrush = 0, $iflags = 3)
	Local $ioptions
	Switch $iflags
		Case 1
			$ioptions = $__winapiconstant_di_mask
		Case 2
			$ioptions = $__winapiconstant_di_image
		Case 3
			$ioptions = $__winapiconstant_di_normal
		Case 4
			$ioptions = $__winapiconstant_di_compat
		Case 5
			$ioptions = $__winapiconstant_di_defaultsize
		Case Else
			$ioptions = $__winapiconstant_di_nomirror
	EndSwitch
	Local $aresult = DllCall("user32.dll", "bool", "DrawIconEx", "handle", $hdc, "int", $ix, "int", $iy, "handle", $hicon, "int", $iwidth, "int", $iheight, "uint", $istep, "handle", $hbrush, "uint", $ioptions)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_drawline($hdc, $ix1, $iy1, $ix2, $iy2)
	_winapi_moveto($hdc, $ix1, $iy1)
	If @error Then Return SetError(@error, @extended, False)
	_winapi_lineto($hdc, $ix2, $iy2)
	If @error Then Return SetError(@error, @extended, False)
	Return True
EndFunc

Func _winapi_drawtext($hdc, $stext, ByRef $trect, $iflags)
	Local $aresult = DllCall("user32.dll", "int", "DrawTextW", "handle", $hdc, "wstr", $stext, "int", -1, "struct*", $trect, "uint", $iflags)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_duplicatehandle($hsourceprocesshandle, $hsourcehandle, $htargetprocesshandle, $idesiredaccess, $finherithandle, $ioptions)
	Local $acall = DllCall("kernel32.dll", "bool", "DuplicateHandle", "handle", $hsourceprocesshandle, "handle", $hsourcehandle, "handle", $htargetprocesshandle, "handle*", 0, "dword", $idesiredaccess, "bool", $finherithandle, "dword", $ioptions)
	If @error OR NOT $acall[0] Then Return SetError(1, @extended, 0)
	Return $acall[4]
EndFunc

Func _winapi_enablewindow($hwnd, $fenable = True)
	Local $aresult = DllCall("user32.dll", "bool", "EnableWindow", "hwnd", $hwnd, "bool", $fenable)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_enumdisplaydevices($sdevice, $idevnum)
	Local $tname = 0, $iflags = 0, $adevice[5]
	If $sdevice <> "" Then
		$tname = DllStructCreate("wchar Text[" & StringLen($sdevice) + 1 & "]")
		DllStructSetData($tname, "Text", $sdevice)
	EndIf
	Local $tdevice = DllStructCreate($tagdisplay_device)
	Local $idevice = DllStructGetSize($tdevice)
	DllStructSetData($tdevice, "Size", $idevice)
	DllCall("user32.dll", "bool", "EnumDisplayDevicesW", "struct*", $tname, "dword", $idevnum, "struct*", $tdevice, "dword", 1)
	If @error Then Return SetError(@error, @extended, 0)
	Local $in = DllStructGetData($tdevice, "Flags")
	If BitAND($in, $__winapiconstant_display_device_attached_to_desktop) <> 0 Then $iflags = BitOR($iflags, 1)
	If BitAND($in, $__winapiconstant_display_device_primary_device) <> 0 Then $iflags = BitOR($iflags, 2)
	If BitAND($in, $__winapiconstant_display_device_mirroring_driver) <> 0 Then $iflags = BitOR($iflags, 4)
	If BitAND($in, $__winapiconstant_display_device_vga_compatible) <> 0 Then $iflags = BitOR($iflags, 8)
	If BitAND($in, $__winapiconstant_display_device_removable) <> 0 Then $iflags = BitOR($iflags, 16)
	If BitAND($in, $__winapiconstant_display_device_modespruned) <> 0 Then $iflags = BitOR($iflags, 32)
	$adevice[0] = True
	$adevice[1] = DllStructGetData($tdevice, "Name")
	$adevice[2] = DllStructGetData($tdevice, "String")
	$adevice[3] = $iflags
	$adevice[4] = DllStructGetData($tdevice, "ID")
	Return $adevice
EndFunc

Func _winapi_enumwindows($fvisible = True, $hwnd = Default)
	__winapi_enumwindowsinit()
	If $hwnd = Default Then $hwnd = _winapi_getdesktopwindow()
	__winapi_enumwindowschild($hwnd, $fvisible)
	Return $__gawinlist_winapi
EndFunc

Func __winapi_enumwindowsadd($hwnd, $sclass = "")
	If $sclass = "" Then $sclass = _winapi_getclassname($hwnd)
	$__gawinlist_winapi[0][0] += 1
	Local $icount = $__gawinlist_winapi[0][0]
	If $icount >= $__gawinlist_winapi[0][1] Then
		ReDim $__gawinlist_winapi[$icount + 64][2]
		$__gawinlist_winapi[0][1] += 64
	EndIf
	$__gawinlist_winapi[$icount][0] = $hwnd
	$__gawinlist_winapi[$icount][1] = $sclass
EndFunc

Func __winapi_enumwindowschild($hwnd, $fvisible = True)
	$hwnd = _winapi_getwindow($hwnd, $__winapiconstant_gw_child)
	While $hwnd <> 0
		If (NOT $fvisible) OR _winapi_iswindowvisible($hwnd) Then
			__winapi_enumwindowschild($hwnd, $fvisible)
			__winapi_enumwindowsadd($hwnd)
		EndIf
		$hwnd = _winapi_getwindow($hwnd, $__winapiconstant_gw_hwndnext)
	WEnd
EndFunc

Func __winapi_enumwindowsinit()
	ReDim $__gawinlist_winapi[64][2]
	$__gawinlist_winapi[0][0] = 0
	$__gawinlist_winapi[0][1] = 64
EndFunc

Func _winapi_enumwindowspopup()
	__winapi_enumwindowsinit()
	Local $hwnd = _winapi_getwindow(_winapi_getdesktopwindow(), $__winapiconstant_gw_child)
	Local $sclass
	While $hwnd <> 0
		If _winapi_iswindowvisible($hwnd) Then
			$sclass = _winapi_getclassname($hwnd)
			If $sclass = "#32768" Then
				__winapi_enumwindowsadd($hwnd)
			ElseIf $sclass = "ToolbarWindow32" Then
				__winapi_enumwindowsadd($hwnd)
			ElseIf $sclass = "ToolTips_Class32" Then
				__winapi_enumwindowsadd($hwnd)
			ElseIf $sclass = "BaseBar" Then
				__winapi_enumwindowschild($hwnd)
			EndIf
		EndIf
		$hwnd = _winapi_getwindow($hwnd, $__winapiconstant_gw_hwndnext)
	WEnd
	Return $__gawinlist_winapi
EndFunc

Func _winapi_enumwindowstop()
	__winapi_enumwindowsinit()
	Local $hwnd = _winapi_getwindow(_winapi_getdesktopwindow(), $__winapiconstant_gw_child)
	While $hwnd <> 0
		If _winapi_iswindowvisible($hwnd) Then __winapi_enumwindowsadd($hwnd)
		$hwnd = _winapi_getwindow($hwnd, $__winapiconstant_gw_hwndnext)
	WEnd
	Return $__gawinlist_winapi
EndFunc

Func _winapi_expandenvironmentstrings($sstring)
	Local $aresult = DllCall("kernel32.dll", "dword", "ExpandEnvironmentStringsW", "wstr", $sstring, "wstr", "", "dword", 4096)
	If @error Then Return SetError(@error, @extended, "")
	Return $aresult[2]
EndFunc

Func _winapi_extracticonex($sfile, $iindex, $plarge, $psmall, $iicons)
	Local $aresult = DllCall("shell32.dll", "uint", "ExtractIconExW", "wstr", $sfile, "int", $iindex, "struct*", $plarge, "struct*", $psmall, "uint", $iicons)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_fatalappexit($smessage)
	DllCall("kernel32.dll", "none", "FatalAppExitW", "uint", 0, "wstr", $smessage)
	If @error Then Return SetError(@error, @extended)
EndFunc

Func _winapi_fillrect($hdc, $ptrrect, $hbrush)
	Local $aresult
	If IsPtr($hbrush) Then
		$aresult = DllCall("user32.dll", "int", "FillRect", "handle", $hdc, "struct*", $ptrrect, "handle", $hbrush)
	Else
		$aresult = DllCall("user32.dll", "int", "FillRect", "handle", $hdc, "struct*", $ptrrect, "dword_ptr", $hbrush)
	EndIf
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_findexecutable($sfilename, $sdirectory = "")
	Local $aresult = DllCall("shell32.dll", "INT", "FindExecutableW", "wstr", $sfilename, "wstr", $sdirectory, "wstr", "")
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[3])
EndFunc

Func _winapi_findwindow($sclassname, $swindowname)
	Local $aresult = DllCall("user32.dll", "hwnd", "FindWindowW", "wstr", $sclassname, "wstr", $swindowname)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_flashwindow($hwnd, $finvert = True)
	Local $aresult = DllCall("user32.dll", "bool", "FlashWindow", "hwnd", $hwnd, "bool", $finvert)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_flashwindowex($hwnd, $iflags = 3, $icount = 3, $itimeout = 0)
	Local $tflash = DllStructCreate($tagflashwinfo)
	Local $iflash = DllStructGetSize($tflash)
	Local $imode = 0
	If BitAND($iflags, 1) <> 0 Then $imode = BitOR($imode, $__winapiconstant_flashw_caption)
	If BitAND($iflags, 2) <> 0 Then $imode = BitOR($imode, $__winapiconstant_flashw_tray)
	If BitAND($iflags, 4) <> 0 Then $imode = BitOR($imode, $__winapiconstant_flashw_timer)
	If BitAND($iflags, 8) <> 0 Then $imode = BitOR($imode, $__winapiconstant_flashw_timernofg)
	DllStructSetData($tflash, "Size", $iflash)
	DllStructSetData($tflash, "hWnd", $hwnd)
	DllStructSetData($tflash, "Flags", $imode)
	DllStructSetData($tflash, "Count", $icount)
	DllStructSetData($tflash, "Timeout", $itimeout)
	Local $aresult = DllCall("user32.dll", "bool", "FlashWindowEx", "struct*", $tflash)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_floattoint($nfloat)
	Local $tfloat = DllStructCreate("float")
	Local $tint = DllStructCreate("int", DllStructGetPtr($tfloat))
	DllStructSetData($tfloat, 1, $nfloat)
	Return DllStructGetData($tint, 1)
EndFunc

Func _winapi_flushfilebuffers($hfile)
	Local $aresult = DllCall("kernel32.dll", "bool", "FlushFileBuffers", "handle", $hfile)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_formatmessage($iflags, $psource, $imessageid, $ilanguageid, ByRef $pbuffer, $isize, $varguments)
	Local $sbuffertype = "struct*"
	If IsString($pbuffer) Then $sbuffertype = "wstr"
	Local $aresult = DllCall("Kernel32.dll", "dword", "FormatMessageW", "dword", $iflags, "ptr", $psource, "dword", $imessageid, "dword", $ilanguageid, $sbuffertype, $pbuffer, "dword", $isize, "ptr", $varguments)
	If @error Then Return SetError(@error, @extended, 0)
	If $sbuffertype = "wstr" Then $pbuffer = $aresult[5]
	Return $aresult[0]
EndFunc

Func _winapi_framerect($hdc, $ptrrect, $hbrush)
	Local $aresult = DllCall("user32.dll", "int", "FrameRect", "handle", $hdc, "ptr", $ptrrect, "handle", $hbrush)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_freelibrary($hmodule)
	Local $aresult = DllCall("kernel32.dll", "bool", "FreeLibrary", "handle", $hmodule)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_getancestor($hwnd, $iflags = 1)
	Local $aresult = DllCall("user32.dll", "hwnd", "GetAncestor", "hwnd", $hwnd, "uint", $iflags)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getasynckeystate($ikey)
	Local $aresult = DllCall("user32.dll", "short", "GetAsyncKeyState", "int", $ikey)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getbkmode($hdc)
	Local $aresult = DllCall("gdi32.dll", "int", "GetBkMode", "handle", $hdc)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getclassname($hwnd)
	If NOT IsHWnd($hwnd) Then $hwnd = GUICtrlGetHandle($hwnd)
	Local $aresult = DllCall("user32.dll", "int", "GetClassNameW", "hwnd", $hwnd, "wstr", "", "int", 4096)
	If @error Then Return SetError(@error, @extended, False)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _winapi_getclientheight($hwnd)
	Local $trect = _winapi_getclientrect($hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return DllStructGetData($trect, "Bottom") - DllStructGetData($trect, "Top")
EndFunc

Func _winapi_getclientwidth($hwnd)
	Local $trect = _winapi_getclientrect($hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return DllStructGetData($trect, "Right") - DllStructGetData($trect, "Left")
EndFunc

Func _winapi_getclientrect($hwnd)
	Local $trect = DllStructCreate($tagrect)
	DllCall("user32.dll", "bool", "GetClientRect", "hwnd", $hwnd, "struct*", $trect)
	If @error Then Return SetError(@error, @extended, 0)
	Return $trect
EndFunc

Func _winapi_getcurrentprocess()
	Local $aresult = DllCall("kernel32.dll", "handle", "GetCurrentProcess")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getcurrentprocessid()
	Local $aresult = DllCall("kernel32.dll", "dword", "GetCurrentProcessId")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getcurrentthread()
	Local $aresult = DllCall("kernel32.dll", "handle", "GetCurrentThread")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getcurrentthreadid()
	Local $aresult = DllCall("kernel32.dll", "dword", "GetCurrentThreadId")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getcursorinfo()
	Local $tcursor = DllStructCreate($tagcursorinfo)
	Local $icursor = DllStructGetSize($tcursor)
	DllStructSetData($tcursor, "Size", $icursor)
	DllCall("user32.dll", "bool", "GetCursorInfo", "struct*", $tcursor)
	If @error Then Return SetError(@error, @extended, 0)
	Local $acursor[5]
	$acursor[0] = True
	$acursor[1] = DllStructGetData($tcursor, "Flags") <> 0
	$acursor[2] = DllStructGetData($tcursor, "hCursor")
	$acursor[3] = DllStructGetData($tcursor, "X")
	$acursor[4] = DllStructGetData($tcursor, "Y")
	Return $acursor
EndFunc

Func _winapi_getdc($hwnd)
	Local $aresult = DllCall("user32.dll", "handle", "GetDC", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getdesktopwindow()
	Local $aresult = DllCall("user32.dll", "hwnd", "GetDesktopWindow")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getdevicecaps($hdc, $iindex)
	Local $aresult = DllCall("gdi32.dll", "int", "GetDeviceCaps", "handle", $hdc, "int", $iindex)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getdibits($hdc, $hbmp, $istartscan, $iscanlines, $pbits, $pbi, $iusage)
	Local $aresult = DllCall("gdi32.dll", "int", "GetDIBits", "handle", $hdc, "handle", $hbmp, "uint", $istartscan, "uint", $iscanlines, "ptr", $pbits, "ptr", $pbi, "uint", $iusage)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_getdlgctrlid($hwnd)
	Local $aresult = DllCall("user32.dll", "int", "GetDlgCtrlID", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getdlgitem($hwnd, $iitemid)
	Local $aresult = DllCall("user32.dll", "hwnd", "GetDlgItem", "hwnd", $hwnd, "int", $iitemid)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getfocus()
	Local $aresult = DllCall("user32.dll", "hwnd", "GetFocus")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getforegroundwindow()
	Local $aresult = DllCall("user32.dll", "hwnd", "GetForegroundWindow")
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getguiresources($iflag = 0, $hprocess = -1)
	If $hprocess = -1 Then $hprocess = _winapi_getcurrentprocess()
	Local $aresult = DllCall("user32.dll", "dword", "GetGuiResources", "handle", $hprocess, "dword", $iflag)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_geticoninfo($hicon)
	Local $tinfo = DllStructCreate($tagiconinfo)
	DllCall("user32.dll", "bool", "GetIconInfo", "handle", $hicon, "struct*", $tinfo)
	If @error Then Return SetError(@error, @extended, 0)
	Local $aicon[6]
	$aicon[0] = True
	$aicon[1] = DllStructGetData($tinfo, "Icon") <> 0
	$aicon[2] = DllStructGetData($tinfo, "XHotSpot")
	$aicon[3] = DllStructGetData($tinfo, "YHotSpot")
	$aicon[4] = DllStructGetData($tinfo, "hMask")
	$aicon[5] = DllStructGetData($tinfo, "hColor")
	Return $aicon
EndFunc

Func _winapi_getfilesizeex($hfile)
	Local $aresult = DllCall("kernel32.dll", "bool", "GetFileSizeEx", "handle", $hfile, "int64*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[2]
EndFunc

Func _winapi_getlasterrormessage()
	Local $tbufferptr = DllStructCreate("ptr")
	Local $ncount = _winapi_formatmessage(BitOR($__winapiconstant_format_message_allocate_buffer, $__winapiconstant_format_message_from_system), 0, _winapi_getlasterror(), 0, $tbufferptr, 0, 0)
	If @error Then Return SetError(@error, 0, "")
	Local $stext = ""
	Local $pbuffer = DllStructGetData($tbufferptr, 1)
	If $pbuffer Then
		If $ncount > 0 Then
			Local $tbuffer = DllStructCreate("wchar[" & ($ncount + 1) & "]", $pbuffer)
			$stext = DllStructGetData($tbuffer, 1)
		EndIf
		_winapi_localfree($pbuffer)
	EndIf
	Return $stext
EndFunc

Func _winapi_getlayeredwindowattributes($hwnd, ByRef $i_transcolor, ByRef $transparency, $ascolorref = False)
	$i_transcolor = -1
	$transparency = -1
	Local $aresult = DllCall("user32.dll", "bool", "GetLayeredWindowAttributes", "hwnd", $hwnd, "dword*", $i_transcolor, "byte*", $transparency, "dword*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	If NOT $ascolorref Then
		$aresult[2] = Int(BinaryMid($aresult[2], 3, 1) & BinaryMid($aresult[2], 2, 1) & BinaryMid($aresult[2], 1, 1))
	EndIf
	$i_transcolor = $aresult[2]
	$transparency = $aresult[3]
	Return $aresult[4]
EndFunc

Func _winapi_getmodulehandle($smodulename)
	Local $smodulenametype = "wstr"
	If $smodulename = "" Then
		$smodulename = 0
		$smodulenametype = "ptr"
	EndIf
	Local $aresult = DllCall("kernel32.dll", "handle", "GetModuleHandleW", $smodulenametype, $smodulename)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getmousepos($ftoclient = False, $hwnd = 0)
	Local $imode = Opt("MouseCoordMode", 1)
	Local $apos = MouseGetPos()
	Opt("MouseCoordMode", $imode)
	Local $tpoint = DllStructCreate($tagpoint)
	DllStructSetData($tpoint, "X", $apos[0])
	DllStructSetData($tpoint, "Y", $apos[1])
	If $ftoclient Then
		_winapi_screentoclient($hwnd, $tpoint)
		If @error Then Return SetError(@error, @extended, 0)
	EndIf
	Return $tpoint
EndFunc

Func _winapi_getmouseposx($ftoclient = False, $hwnd = 0)
	Local $tpoint = _winapi_getmousepos($ftoclient, $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return DllStructGetData($tpoint, "X")
EndFunc

Func _winapi_getmouseposy($ftoclient = False, $hwnd = 0)
	Local $tpoint = _winapi_getmousepos($ftoclient, $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return DllStructGetData($tpoint, "Y")
EndFunc

Func _winapi_getobject($hobject, $isize, $pobject)
	Local $aresult = DllCall("gdi32.dll", "int", "GetObjectW", "handle", $hobject, "int", $isize, "ptr", $pobject)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getopenfilename($stitle = "", $sfilter = "All files (*.*)", $sinitaldir = ".", $sdefaultfile = "", $sdefaultext = "", $ifilterindex = 1, $iflags = 0, $iflagsex = 0, $hwndowner = 0)
	Local $ipathlen = 4096
	Local $inulls = 0
	Local $tofn = DllStructCreate($tagopenfilename)
	Local $afiles[1] = [0]
	Local $iflag = $iflags
	Local $asflines = StringSplit($sfilter, "|")
	Local $asfilter[$asflines[0] * 2 + 1]
	Local $istart, $ifinal, $stfilter
	$asfilter[0] = $asflines[0] * 2
	For $i = 1 To $asflines[0]
		$istart = StringInStr($asflines[$i], "(", 0, 1)
		$ifinal = StringInStr($asflines[$i], ")", 0, -1)
		$asfilter[$i * 2 - 1] = StringStripWS(StringLeft($asflines[$i], $istart - 1), 3)
		$asfilter[$i * 2] = StringStripWS(StringTrimRight(StringTrimLeft($asflines[$i], $istart), StringLen($asflines[$i]) - $ifinal + 1), 3)
		$stfilter &= "wchar[" & StringLen($asfilter[$i * 2 - 1]) + 1 & "];wchar[" & StringLen($asfilter[$i * 2]) + 1 & "];"
	Next
	Local $ttitle = DllStructCreate("wchar Title[" & StringLen($stitle) + 1 & "]")
	Local $tinitialdir = DllStructCreate("wchar InitDir[" & StringLen($sinitaldir) + 1 & "]")
	Local $tfilter = DllStructCreate($stfilter & "wchar")
	Local $tpath = DllStructCreate("wchar Path[" & $ipathlen & "]")
	Local $textn = DllStructCreate("wchar Extension[" & StringLen($sdefaultext) + 1 & "]")
	For $i = 1 To $asfilter[0]
		DllStructSetData($tfilter, $i, $asfilter[$i])
	Next
	DllStructSetData($ttitle, "Title", $stitle)
	DllStructSetData($tinitialdir, "InitDir", $sinitaldir)
	DllStructSetData($tpath, "Path", $sdefaultfile)
	DllStructSetData($textn, "Extension", $sdefaultext)
	DllStructSetData($tofn, "StructSize", DllStructGetSize($tofn))
	DllStructSetData($tofn, "hwndOwner", $hwndowner)
	DllStructSetData($tofn, "lpstrFilter", DllStructGetPtr($tfilter))
	DllStructSetData($tofn, "nFilterIndex", $ifilterindex)
	DllStructSetData($tofn, "lpstrFile", DllStructGetPtr($tpath))
	DllStructSetData($tofn, "nMaxFile", $ipathlen)
	DllStructSetData($tofn, "lpstrInitialDir", DllStructGetPtr($tinitialdir))
	DllStructSetData($tofn, "lpstrTitle", DllStructGetPtr($ttitle))
	DllStructSetData($tofn, "Flags", $iflag)
	DllStructSetData($tofn, "lpstrDefExt", DllStructGetPtr($textn))
	DllStructSetData($tofn, "FlagsEx", $iflagsex)
	DllCall("comdlg32.dll", "bool", "GetOpenFileNameW", "struct*", $tofn)
	If @error Then Return SetError(@error, @extended, $afiles)
	If BitAND($iflags, $ofn_allowmultiselect) = $ofn_allowmultiselect AND BitAND($iflags, $ofn_explorer) = $ofn_explorer Then
		For $x = 1 To $ipathlen
			If DllStructGetData($tpath, "Path", $x) = Chr(0) Then
				DllStructSetData($tpath, "Path", "|", $x)
				$inulls += 1
			Else
				$inulls = 0
			EndIf
			If $inulls = 2 Then ExitLoop 
		Next
		DllStructSetData($tpath, "Path", Chr(0), $x - 1)
		$afiles = StringSplit(DllStructGetData($tpath, "Path"), "|")
		If $afiles[0] = 1 Then Return __winapi_parsefiledialogpath(DllStructGetData($tpath, "Path"))
		Return StringSplit(DllStructGetData($tpath, "Path"), "|")
	ElseIf BitAND($iflags, $ofn_allowmultiselect) = $ofn_allowmultiselect Then
		$afiles = StringSplit(DllStructGetData($tpath, "Path"), " ")
		If $afiles[0] = 1 Then Return __winapi_parsefiledialogpath(DllStructGetData($tpath, "Path"))
		Return StringSplit(StringReplace(DllStructGetData($tpath, "Path"), " ", "|"), "|")
	Else
		Return __winapi_parsefiledialogpath(DllStructGetData($tpath, "Path"))
	EndIf
EndFunc

Func _winapi_getoverlappedresult($hfile, $poverlapped, ByRef $ibytes, $fwait = False)
	Local $aresult = DllCall("kernel32.dll", "bool", "GetOverlappedResult", "handle", $hfile, "ptr", $poverlapped, "dword*", 0, "bool", $fwait)
	If @error Then Return SetError(@error, @extended, False)
	$ibytes = $aresult[3]
	Return $aresult[0]
EndFunc

Func _winapi_getparent($hwnd)
	Local $aresult = DllCall("user32.dll", "hwnd", "GetParent", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getprocessaffinitymask($hprocess)
	Local $aresult = DllCall("kernel32.dll", "bool", "GetProcessAffinityMask", "handle", $hprocess, "dword_ptr*", 0, "dword_ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Local $amask[3]
	$amask[0] = True
	$amask[1] = $aresult[2]
	$amask[2] = $aresult[3]
	Return $amask
EndFunc

Func _winapi_getsavefilename($stitle = "", $sfilter = "All files (*.*)", $sinitaldir = ".", $sdefaultfile = "", $sdefaultext = "", $ifilterindex = 1, $iflags = 0, $iflagsex = 0, $hwndowner = 0)
	Local $ipathlen = 4096
	Local $tofn = DllStructCreate($tagopenfilename)
	Local $afiles[1] = [0]
	Local $iflag = $iflags
	Local $asflines = StringSplit($sfilter, "|")
	Local $asfilter[$asflines[0] * 2 + 1]
	Local $istart, $ifinal, $stfilter
	$asfilter[0] = $asflines[0] * 2
	For $i = 1 To $asflines[0]
		$istart = StringInStr($asflines[$i], "(", 0, 1)
		$ifinal = StringInStr($asflines[$i], ")", 0, -1)
		$asfilter[$i * 2 - 1] = StringStripWS(StringLeft($asflines[$i], $istart - 1), 3)
		$asfilter[$i * 2] = StringStripWS(StringTrimRight(StringTrimLeft($asflines[$i], $istart), StringLen($asflines[$i]) - $ifinal + 1), 3)
		$stfilter &= "wchar[" & StringLen($asfilter[$i * 2 - 1]) + 1 & "];wchar[" & StringLen($asfilter[$i * 2]) + 1 & "];"
	Next
	Local $ttitle = DllStructCreate("wchar Title[" & StringLen($stitle) + 1 & "]")
	Local $tinitialdir = DllStructCreate("wchar InitDir[" & StringLen($sinitaldir) + 1 & "]")
	Local $tfilter = DllStructCreate($stfilter & "wchar")
	Local $tpath = DllStructCreate("wchar Path[" & $ipathlen & "]")
	Local $textn = DllStructCreate("wchar Extension[" & StringLen($sdefaultext) + 1 & "]")
	For $i = 1 To $asfilter[0]
		DllStructSetData($tfilter, $i, $asfilter[$i])
	Next
	DllStructSetData($ttitle, "Title", $stitle)
	DllStructSetData($tinitialdir, "InitDir", $sinitaldir)
	DllStructSetData($tpath, "Path", $sdefaultfile)
	DllStructSetData($textn, "Extension", $sdefaultext)
	DllStructSetData($tofn, "StructSize", DllStructGetSize($tofn))
	DllStructSetData($tofn, "hwndOwner", $hwndowner)
	DllStructSetData($tofn, "lpstrFilter", DllStructGetPtr($tfilter))
	DllStructSetData($tofn, "nFilterIndex", $ifilterindex)
	DllStructSetData($tofn, "lpstrFile", DllStructGetPtr($tpath))
	DllStructSetData($tofn, "nMaxFile", $ipathlen)
	DllStructSetData($tofn, "lpstrInitialDir", DllStructGetPtr($tinitialdir))
	DllStructSetData($tofn, "lpstrTitle", DllStructGetPtr($ttitle))
	DllStructSetData($tofn, "Flags", $iflag)
	DllStructSetData($tofn, "lpstrDefExt", DllStructGetPtr($textn))
	DllStructSetData($tofn, "FlagsEx", $iflagsex)
	DllCall("comdlg32.dll", "bool", "GetSaveFileNameW", "struct*", $tofn)
	If @error Then Return SetError(@error, @extended, $afiles)
	Return __winapi_parsefiledialogpath(DllStructGetData($tpath, "Path"))
EndFunc

Func _winapi_getstockobject($iobject)
	Local $aresult = DllCall("gdi32.dll", "handle", "GetStockObject", "int", $iobject)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getstdhandle($istdhandle)
	If $istdhandle < 0 OR $istdhandle > 2 Then Return SetError(2, 0, -1)
	Local Const $ahandle[3] = [-10, -11, -12]
	Local $aresult = DllCall("kernel32.dll", "handle", "GetStdHandle", "dword", $ahandle[$istdhandle])
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_getsyscolor($iindex)
	Local $aresult = DllCall("user32.dll", "dword", "GetSysColor", "int", $iindex)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getsyscolorbrush($iindex)
	Local $aresult = DllCall("user32.dll", "handle", "GetSysColorBrush", "int", $iindex)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getsystemmetrics($iindex)
	Local $aresult = DllCall("user32.dll", "int", "GetSystemMetrics", "int", $iindex)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_gettextextentpoint32($hdc, $stext)
	Local $tsize = DllStructCreate($tagsize)
	Local $isize = StringLen($stext)
	DllCall("gdi32.dll", "bool", "GetTextExtentPoint32W", "handle", $hdc, "wstr", $stext, "int", $isize, "struct*", $tsize)
	If @error Then Return SetError(@error, @extended, 0)
	Return $tsize
EndFunc

Func _winapi_gettextmetrics($hdc)
	Local $ttextmetric = DllStructCreate($tagtextmetric)
	Local $ret = DllCall("gdi32.dll", "bool", "GetTextMetricsW", "handle", $hdc, "struct*", $ttextmetric)
	If @error Then Return SetError(@error, @extended, 0)
	If NOT $ret[0] Then Return SetError(-1, 0, 0)
	Return $ttextmetric
EndFunc

Func _winapi_getwindow($hwnd, $icmd)
	Local $aresult = DllCall("user32.dll", "hwnd", "GetWindow", "hwnd", $hwnd, "uint", $icmd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getwindowdc($hwnd)
	Local $aresult = DllCall("user32.dll", "handle", "GetWindowDC", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getwindowheight($hwnd)
	Local $trect = _winapi_getwindowrect($hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return DllStructGetData($trect, "Bottom") - DllStructGetData($trect, "Top")
EndFunc

Func _winapi_getwindowlong($hwnd, $iindex)
	Local $sfuncname = "GetWindowLongW"
	If @AutoItX64 Then $sfuncname = "GetWindowLongPtrW"
	Local $aresult = DllCall("user32.dll", "long_ptr", $sfuncname, "hwnd", $hwnd, "int", $iindex)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getwindowplacement($hwnd)
	Local $twindowplacement = DllStructCreate($tagwindowplacement)
	DllStructSetData($twindowplacement, "length", DllStructGetSize($twindowplacement))
	DllCall("user32.dll", "bool", "GetWindowPlacement", "hwnd", $hwnd, "struct*", $twindowplacement)
	If @error Then Return SetError(@error, @extended, 0)
	Return $twindowplacement
EndFunc

Func _winapi_getwindowrect($hwnd)
	Local $trect = DllStructCreate($tagrect)
	DllCall("user32.dll", "bool", "GetWindowRect", "hwnd", $hwnd, "struct*", $trect)
	If @error Then Return SetError(@error, @extended, 0)
	Return $trect
EndFunc

Func _winapi_getwindowrgn($hwnd, $hrgn)
	Local $aresult = DllCall("user32.dll", "int", "GetWindowRgn", "hwnd", $hwnd, "handle", $hrgn)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_getwindowtext($hwnd)
	Local $aresult = DllCall("user32.dll", "int", "GetWindowTextW", "hwnd", $hwnd, "wstr", "", "int", 4096)
	If @error Then Return SetError(@error, @extended, "")
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _winapi_getwindowthreadprocessid($hwnd, ByRef $ipid)
	Local $aresult = DllCall("user32.dll", "dword", "GetWindowThreadProcessId", "hwnd", $hwnd, "dword*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	$ipid = $aresult[2]
	Return $aresult[0]
EndFunc

Func _winapi_getwindowwidth($hwnd)
	Local $trect = _winapi_getwindowrect($hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return DllStructGetData($trect, "Right") - DllStructGetData($trect, "Left")
EndFunc

Func _winapi_getxyfrompoint(ByRef $tpoint, ByRef $ix, ByRef $iy)
	$ix = DllStructGetData($tpoint, "X")
	$iy = DllStructGetData($tpoint, "Y")
EndFunc

Func _winapi_globalmemorystatus()
	Local $tmem = DllStructCreate($tagmemorystatusex)
	Local $imem = DllStructGetSize($tmem)
	DllStructSetData($tmem, 1, $imem)
	DllCall("kernel32.dll", "none", "GlobalMemoryStatusEx", "ptr", $tmem)
	If @error Then Return SetError(@error, @extended, 0)
	Local $amem[7]
	$amem[0] = DllStructGetData($tmem, 2)
	$amem[1] = DllStructGetData($tmem, 3)
	$amem[2] = DllStructGetData($tmem, 4)
	$amem[3] = DllStructGetData($tmem, 5)
	$amem[4] = DllStructGetData($tmem, 6)
	$amem[5] = DllStructGetData($tmem, 7)
	$amem[6] = DllStructGetData($tmem, 8)
	Return $amem
EndFunc

Func _winapi_guidfromstring($sguid)
	Local $tguid = DllStructCreate($tagguid)
	_winapi_guidfromstringex($sguid, $tguid)
	If @error Then Return SetError(@error, @extended, 0)
	Return $tguid
EndFunc

Func _winapi_guidfromstringex($sguid, $pguid)
	Local $aresult = DllCall("ole32.dll", "long", "CLSIDFromString", "wstr", $sguid, "struct*", $pguid)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_hiword($ilong)
	Return BitShift($ilong, 16)
EndFunc

Func _winapi_inprocess($hwnd, ByRef $hlastwnd)
	If $hwnd = $hlastwnd Then Return True
	For $ii = $__gainprocess_winapi[0][0] To 1 Step -1
		If $hwnd = $__gainprocess_winapi[$ii][0] Then
			If $__gainprocess_winapi[$ii][1] Then
				$hlastwnd = $hwnd
				Return True
			Else
				Return False
			EndIf
		EndIf
	Next
	Local $iprocessid
	_winapi_getwindowthreadprocessid($hwnd, $iprocessid)
	Local $icount = $__gainprocess_winapi[0][0] + 1
	If $icount >= 64 Then $icount = 1
	$__gainprocess_winapi[0][0] = $icount
	$__gainprocess_winapi[$icount][0] = $hwnd
	$__gainprocess_winapi[$icount][1] = ($iprocessid = @AutoItPID)
	Return $__gainprocess_winapi[$icount][1]
EndFunc

Func _winapi_inttofloat($iint)
	Local $tint = DllStructCreate("int")
	Local $tfloat = DllStructCreate("float", DllStructGetPtr($tint))
	DllStructSetData($tint, 1, $iint)
	Return DllStructGetData($tfloat, 1)
EndFunc

Func _winapi_isclassname($hwnd, $sclassname)
	Local $sseparator = Opt("GUIDataSeparatorChar")
	Local $aclassname = StringSplit($sclassname, $sseparator)
	If NOT IsHWnd($hwnd) Then $hwnd = GUICtrlGetHandle($hwnd)
	Local $sclasscheck = _winapi_getclassname($hwnd)
	For $x = 1 To UBound($aclassname) - 1
		If StringUpper(StringMid($sclasscheck, 1, StringLen($aclassname[$x]))) = StringUpper($aclassname[$x]) Then Return True
	Next
	Return False
EndFunc

Func _winapi_iswindow($hwnd)
	Local $aresult = DllCall("user32.dll", "bool", "IsWindow", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_iswindowvisible($hwnd)
	Local $aresult = DllCall("user32.dll", "bool", "IsWindowVisible", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_invalidaterect($hwnd, $trect = 0, $ferase = True)
	Local $aresult = DllCall("user32.dll", "bool", "InvalidateRect", "hwnd", $hwnd, "struct*", $trect, "bool", $ferase)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_lineto($hdc, $ix, $iy)
	Local $aresult = DllCall("gdi32.dll", "bool", "LineTo", "handle", $hdc, "int", $ix, "int", $iy)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_loadbitmap($hinstance, $sbitmap)
	Local $sbitmaptype = "int"
	If IsString($sbitmap) Then $sbitmaptype = "wstr"
	Local $aresult = DllCall("user32.dll", "handle", "LoadBitmapW", "handle", $hinstance, $sbitmaptype, $sbitmap)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_loadimage($hinstance, $simage, $itype, $ixdesired, $iydesired, $iload)
	Local $aresult, $simagetype = "int"
	If IsString($simage) Then $simagetype = "wstr"
	$aresult = DllCall("user32.dll", "handle", "LoadImageW", "handle", $hinstance, $simagetype, $simage, "uint", $itype, "int", $ixdesired, "int", $iydesired, "uint", $iload)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_loadlibrary($sfilename)
	Local $aresult = DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $sfilename)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_loadlibraryex($sfilename, $iflags = 0)
	Local $aresult = DllCall("kernel32.dll", "handle", "LoadLibraryExW", "wstr", $sfilename, "ptr", 0, "dword", $iflags)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_loadshell32icon($iiconid)
	Local $ticons = DllStructCreate("ptr Data")
	Local $iicons = _winapi_extracticonex("shell32.dll", $iiconid, 0, $ticons, 1)
	If @error Then Return SetError(@error, @extended, 0)
	If $iicons <= 0 Then Return SetError(1, 0, 0)
	Return DllStructGetData($ticons, "Data")
EndFunc

Func _winapi_loadstring($hinstance, $istringid)
	Local $aresult = DllCall("user32.dll", "int", "LoadStringW", "handle", $hinstance, "uint", $istringid, "wstr", "", "int", 4096)
	If @error Then Return SetError(@error, @extended, "")
	Return SetExtended($aresult[0], $aresult[3])
EndFunc

Func _winapi_localfree($hmem)
	Local $aresult = DllCall("kernel32.dll", "handle", "LocalFree", "handle", $hmem)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_loword($ilong)
	Return BitAND($ilong, 65535)
EndFunc

Func _winapi_makelangid($lgidprimary, $lgidsub)
	Return BitOR(BitShift($lgidsub, -10), $lgidprimary)
EndFunc

Func _winapi_makelcid($lgid, $srtid)
	Return BitOR(BitShift($srtid, -16), $lgid)
EndFunc

Func _winapi_makelong($ilo, $ihi)
	Return BitOR(BitShift($ihi, -16), BitAND($ilo, 65535))
EndFunc

Func _winapi_makeqword($lodword, $hidword)
	Local $tint64 = DllStructCreate("uint64")
	Local $tdwords = DllStructCreate("dword;dword", DllStructGetPtr($tint64))
	DllStructSetData($tdwords, 1, $lodword)
	DllStructSetData($tdwords, 2, $hidword)
	Return DllStructGetData($tint64, 1)
EndFunc

Func _winapi_messagebeep($itype = 1)
	Local $isound
	Switch $itype
		Case 1
			$isound = 0
		Case 2
			$isound = 16
		Case 3
			$isound = 32
		Case 4
			$isound = 48
		Case 5
			$isound = 64
		Case Else
			$isound = -1
	EndSwitch
	Local $aresult = DllCall("user32.dll", "bool", "MessageBeep", "uint", $isound)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_msgbox($iflags, $stitle, $stext)
	BlockInput(0)
	MsgBox($iflags, $stitle, $stext & "      ")
EndFunc

Func _winapi_mouse_event($iflags, $ix = 0, $iy = 0, $idata = 0, $iextrainfo = 0)
	DllCall("user32.dll", "none", "mouse_event", "dword", $iflags, "dword", $ix, "dword", $iy, "dword", $idata, "ulong_ptr", $iextrainfo)
	If @error Then Return SetError(@error, @extended)
EndFunc

Func _winapi_moveto($hdc, $ix, $iy)
	Local $aresult = DllCall("gdi32.dll", "bool", "MoveToEx", "handle", $hdc, "int", $ix, "int", $iy, "ptr", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_movewindow($hwnd, $ix, $iy, $iwidth, $iheight, $frepaint = True)
	Local $aresult = DllCall("user32.dll", "bool", "MoveWindow", "hwnd", $hwnd, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight, "bool", $frepaint)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_muldiv($inumber, $inumerator, $idenominator)
	Local $aresult = DllCall("kernel32.dll", "int", "MulDiv", "int", $inumber, "int", $inumerator, "int", $idenominator)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_multibytetowidechar($stext, $icodepage = 0, $iflags = 0, $bretstring = False)
	Local $stexttype = "str"
	If NOT IsString($stext) Then $stexttype = "struct*"
	Local $aresult = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $icodepage, "dword", $iflags, $stexttype, $stext, "int", -1, "ptr", 0, "int", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Local $iout = $aresult[0]
	Local $tout = DllStructCreate("wchar[" & $iout & "]")
	$aresult = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $icodepage, "dword", $iflags, $stexttype, $stext, "int", -1, "struct*", $tout, "int", $iout)
	If @error Then Return SetError(@error, @extended, 0)
	If $bretstring Then Return DllStructGetData($tout, 1)
	Return $tout
EndFunc

Func _winapi_multibytetowidecharex($stext, $ptext, $icodepage = 0, $iflags = 0)
	Local $aresult = DllCall("kernel32.dll", "int", "MultiByteToWideChar", "uint", $icodepage, "dword", $iflags, "STR", $stext, "int", -1, "struct*", $ptext, "int", (StringLen($stext) + 1) * 2)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_openprocess($iaccess, $finherit, $iprocessid, $fdebugpriv = False)
	Local $aresult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iaccess, "bool", $finherit, "dword", $iprocessid)
	If @error Then Return SetError(@error, @extended, 0)
	If $aresult[0] Then Return $aresult[0]
	If NOT $fdebugpriv Then Return 0
	Local $htoken = _security__openthreadtokenex(BitOR($token_adjust_privileges, $token_query))
	If @error Then Return SetError(@error, @extended, 0)
	_security__setprivilege($htoken, "SeDebugPrivilege", True)
	Local $ierror = @error
	Local $ilasterror = @extended
	Local $iret = 0
	If NOT @error Then
		$aresult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iaccess, "bool", $finherit, "dword", $iprocessid)
		$ierror = @error
		$ilasterror = @extended
		If $aresult[0] Then $iret = $aresult[0]
		_security__setprivilege($htoken, "SeDebugPrivilege", False)
		If @error Then
			$ierror = @error
			$ilasterror = @extended
		EndIf
	EndIf
	_winapi_closehandle($htoken)
	Return SetError($ierror, $ilasterror, $iret)
EndFunc

Func __winapi_parsefiledialogpath($spath)
	Local $afiles[3]
	$afiles[0] = 2
	Local $stemp = StringMid($spath, 1, StringInStr($spath, "\", 0, -1) - 1)
	$afiles[1] = $stemp
	$afiles[2] = StringMid($spath, StringInStr($spath, "\", 0, -1) + 1)
	Return $afiles
EndFunc

Func _winapi_pathfindonpath(Const $szfile, $aextrapaths = "", Const $szpathdelimiter = @LF)
	Local $iextracount = 0
	If IsString($aextrapaths) Then
		If StringLen($aextrapaths) Then
			$aextrapaths = StringSplit($aextrapaths, $szpathdelimiter, 1 + 2)
			$iextracount = UBound($aextrapaths, 1)
		EndIf
	ElseIf IsArray($aextrapaths) Then
		$iextracount = UBound($aextrapaths)
	EndIf
	Local $tpaths, $tpathptrs
	If $iextracount Then
		Local $szstruct = ""
		For $path In $aextrapaths
			$szstruct &= "wchar[" & StringLen($path) + 1 & "];"
		Next
		$tpaths = DllStructCreate($szstruct)
		$tpathptrs = DllStructCreate("ptr[" & $iextracount + 1 & "]")
		For $i = 1 To $iextracount
			DllStructSetData($tpaths, $i, $aextrapaths[$i - 1])
			DllStructSetData($tpathptrs, 1, DllStructGetPtr($tpaths, $i), $i)
		Next
		DllStructSetData($tpathptrs, 1, Ptr(0), $iextracount + 1)
	EndIf
	Local $aresult = DllCall("shlwapi.dll", "bool", "PathFindOnPathW", "wstr", $szfile, "struct*", $tpathptrs)
	If @error Then Return SetError(@error, @extended, False)
	If $aresult[0] = 0 Then Return SetError(1, 0, $szfile)
	Return $aresult[1]
EndFunc

Func _winapi_pointfromrect(ByRef $trect, $fcenter = True)
	Local $ix1 = DllStructGetData($trect, "Left")
	Local $iy1 = DllStructGetData($trect, "Top")
	Local $ix2 = DllStructGetData($trect, "Right")
	Local $iy2 = DllStructGetData($trect, "Bottom")
	If $fcenter Then
		$ix1 = $ix1 + (($ix2 - $ix1) / 2)
		$iy1 = $iy1 + (($iy2 - $iy1) / 2)
	EndIf
	Local $tpoint = DllStructCreate($tagpoint)
	DllStructSetData($tpoint, "X", $ix1)
	DllStructSetData($tpoint, "Y", $iy1)
	Return $tpoint
EndFunc

Func _winapi_postmessage($hwnd, $imsg, $iwparam, $ilparam)
	Local $aresult = DllCall("user32.dll", "bool", "PostMessage", "hwnd", $hwnd, "uint", $imsg, "wparam", $iwparam, "lparam", $ilparam)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_primarylangid($lgid)
	Return BitAND($lgid, 1023)
EndFunc

Func _winapi_ptinrect(ByRef $trect, ByRef $tpoint)
	Local $aresult = DllCall("user32.dll", "bool", "PtInRect", "struct*", $trect, "struct", $tpoint)
	If @error Then Return SetError(1, @extended, False)
	Return NOT ($aresult[0] = 0)
EndFunc

Func _winapi_readfile($hfile, $pbuffer, $itoread, ByRef $iread, $poverlapped = 0)
	Local $aresult = DllCall("kernel32.dll", "bool", "ReadFile", "handle", $hfile, "ptr", $pbuffer, "dword", $itoread, "dword*", 0, "ptr", $poverlapped)
	If @error Then Return SetError(@error, @extended, False)
	$iread = $aresult[4]
	Return $aresult[0]
EndFunc

Func _winapi_readprocessmemory($hprocess, $pbaseaddress, $pbuffer, $isize, ByRef $iread)
	Local $aresult = DllCall("kernel32.dll", "bool", "ReadProcessMemory", "handle", $hprocess, "ptr", $pbaseaddress, "ptr", $pbuffer, "ulong_ptr", $isize, "ulong_ptr*", 0)
	If @error Then Return SetError(@error, @extended, False)
	$iread = $aresult[5]
	Return $aresult[0]
EndFunc

Func _winapi_rectisempty(ByRef $trect)
	Return (DllStructGetData($trect, "Left") = 0) AND (DllStructGetData($trect, "Top") = 0) AND (DllStructGetData($trect, "Right") = 0) AND (DllStructGetData($trect, "Bottom") = 0)
EndFunc

Func _winapi_redrawwindow($hwnd, $trect = 0, $hregion = 0, $iflags = 5)
	Local $aresult = DllCall("user32.dll", "bool", "RedrawWindow", "hwnd", $hwnd, "struct*", $trect, "handle", $hregion, "uint", $iflags)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_registerwindowmessage($smessage)
	Local $aresult = DllCall("user32.dll", "uint", "RegisterWindowMessageW", "wstr", $smessage)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_releasecapture()
	Local $aresult = DllCall("user32.dll", "bool", "ReleaseCapture")
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_releasedc($hwnd, $hdc)
	Local $aresult = DllCall("user32.dll", "int", "ReleaseDC", "hwnd", $hwnd, "handle", $hdc)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_screentoclient($hwnd, ByRef $tpoint)
	Local $aresult = DllCall("user32.dll", "bool", "ScreenToClient", "hwnd", $hwnd, "struct*", $tpoint)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_selectobject($hdc, $hgdiobj)
	Local $aresult = DllCall("gdi32.dll", "handle", "SelectObject", "handle", $hdc, "handle", $hgdiobj)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setbkcolor($hdc, $icolor)
	Local $aresult = DllCall("gdi32.dll", "INT", "SetBkColor", "handle", $hdc, "dword", $icolor)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_setbkmode($hdc, $ibkmode)
	Local $aresult = DllCall("gdi32.dll", "int", "SetBkMode", "handle", $hdc, "int", $ibkmode)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setcapture($hwnd)
	Local $aresult = DllCall("user32.dll", "hwnd", "SetCapture", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setcursor($hcursor)
	Local $aresult = DllCall("user32.dll", "handle", "SetCursor", "handle", $hcursor)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setdefaultprinter($sprinter)
	Local $aresult = DllCall("winspool.drv", "bool", "SetDefaultPrinterW", "wstr", $sprinter)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setdibits($hdc, $hbmp, $istartscan, $iscanlines, $pbits, $pbmi, $icoloruse = 0)
	Local $aresult = DllCall("gdi32.dll", "int", "SetDIBits", "handle", $hdc, "handle", $hbmp, "uint", $istartscan, "uint", $iscanlines, "ptr", $pbits, "ptr", $pbmi, "uint", $icoloruse)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setendoffile($hfile)
	Local $aresult = DllCall("kernel32.dll", "bool", "SetEndOfFile", "handle", $hfile)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setevent($hevent)
	Local $aresult = DllCall("kernel32.dll", "bool", "SetEvent", "handle", $hevent)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setfilepointer($hfile, $ipos, $imethod = 0)
	Local $aresult = DllCall("kernel32.dll", "INT", "SetFilePointer", "handle", $hfile, "long", $ipos, "ptr", 0, "long", $imethod)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_setfocus($hwnd)
	Local $aresult = DllCall("user32.dll", "hwnd", "SetFocus", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setfont($hwnd, $hfont, $fredraw = True)
	_sendmessage($hwnd, $__winapiconstant_wm_setfont, $hfont, $fredraw, 0, "hwnd")
EndFunc

Func _winapi_sethandleinformation($hobject, $imask, $iflags)
	Local $aresult = DllCall("kernel32.dll", "bool", "SetHandleInformation", "handle", $hobject, "dword", $imask, "dword", $iflags)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setlayeredwindowattributes($hwnd, $i_transcolor, $transparency = 255, $dwflags = 3, $iscolorref = False)
	If $dwflags = Default OR $dwflags = "" OR $dwflags < 0 Then $dwflags = 3
	If NOT $iscolorref Then
		$i_transcolor = Int(BinaryMid($i_transcolor, 3, 1) & BinaryMid($i_transcolor, 2, 1) & BinaryMid($i_transcolor, 1, 1))
	EndIf
	Local $aresult = DllCall("user32.dll", "bool", "SetLayeredWindowAttributes", "hwnd", $hwnd, "dword", $i_transcolor, "byte", $transparency, "dword", $dwflags)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setparent($hwndchild, $hwndparent)
	Local $aresult = DllCall("user32.dll", "hwnd", "SetParent", "hwnd", $hwndchild, "hwnd", $hwndparent)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setprocessaffinitymask($hprocess, $imask)
	Local $aresult = DllCall("kernel32.dll", "bool", "SetProcessAffinityMask", "handle", $hprocess, "ulong_ptr", $imask)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setsyscolors($velements, $vcolors)
	Local $isearray = IsArray($velements), $iscarray = IsArray($vcolors)
	Local $ielementnum
	If NOT $iscarray AND NOT $isearray Then
		$ielementnum = 1
	ElseIf $iscarray OR $isearray Then
		If NOT $iscarray OR NOT $isearray Then Return SetError(-1, -1, False)
		If UBound($velements) <> UBound($vcolors) Then Return SetError(-1, -1, False)
		$ielementnum = UBound($velements)
	EndIf
	Local $telements = DllStructCreate("int Element[" & $ielementnum & "]")
	Local $tcolors = DllStructCreate("dword NewColor[" & $ielementnum & "]")
	If NOT $isearray Then
		DllStructSetData($telements, "Element", $velements, 1)
	Else
		For $x = 0 To $ielementnum - 1
			DllStructSetData($telements, "Element", $velements[$x], $x + 1)
		Next
	EndIf
	If NOT $iscarray Then
		DllStructSetData($tcolors, "NewColor", $vcolors, 1)
	Else
		For $x = 0 To $ielementnum - 1
			DllStructSetData($tcolors, "NewColor", $vcolors[$x], $x + 1)
		Next
	EndIf
	Local $aresult = DllCall("user32.dll", "bool", "SetSysColors", "int", $ielementnum, "struct*", $telements, "struct*", $tcolors)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_settextcolor($hdc, $icolor)
	Local $aresult = DllCall("gdi32.dll", "INT", "SetTextColor", "handle", $hdc, "dword", $icolor)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_setwindowlong($hwnd, $iindex, $ivalue)
	_winapi_setlasterror(0)
	Local $sfuncname = "SetWindowLongW"
	If @AutoItX64 Then $sfuncname = "SetWindowLongPtrW"
	Local $aresult = DllCall("user32.dll", "long_ptr", $sfuncname, "hwnd", $hwnd, "int", $iindex, "long_ptr", $ivalue)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setwindowplacement($hwnd, $pwindowplacement)
	Local $aresult = DllCall("user32.dll", "bool", "SetWindowPlacement", "hwnd", $hwnd, "ptr", $pwindowplacement)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setwindowpos($hwnd, $hafter, $ix, $iy, $icx, $icy, $iflags)
	Local $aresult = DllCall("user32.dll", "bool", "SetWindowPos", "hwnd", $hwnd, "hwnd", $hafter, "int", $ix, "int", $iy, "int", $icx, "int", $icy, "uint", $iflags)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setwindowrgn($hwnd, $hrgn, $bredraw = True)
	Local $aresult = DllCall("user32.dll", "int", "SetWindowRgn", "hwnd", $hwnd, "handle", $hrgn, "bool", $bredraw)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_setwindowshookex($idhook, $lpfn, $hmod, $dwthreadid = 0)
	Local $aresult = DllCall("user32.dll", "handle", "SetWindowsHookEx", "int", $idhook, "ptr", $lpfn, "handle", $hmod, "dword", $dwthreadid)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_setwindowtext($hwnd, $stext)
	Local $aresult = DllCall("user32.dll", "bool", "SetWindowTextW", "hwnd", $hwnd, "wstr", $stext)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_showcursor($fshow)
	Local $aresult = DllCall("user32.dll", "int", "ShowCursor", "bool", $fshow)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_showerror($stext, $fexit = True)
	_winapi_msgbox(266256, "Error", $stext)
	If $fexit Then Exit 
EndFunc

Func _winapi_showmsg($stext)
	_winapi_msgbox(64 + 4096, "Information", $stext)
EndFunc

Func _winapi_showwindow($hwnd, $icmdshow = 5)
	Local $aresult = DllCall("user32.dll", "bool", "ShowWindow", "hwnd", $hwnd, "int", $icmdshow)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_stringfromguid($pguid)
	Local $aresult = DllCall("ole32.dll", "int", "StringFromGUID2", "struct*", $pguid, "wstr", "", "int", 40)
	If @error Then Return SetError(@error, @extended, "")
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _winapi_stringlena($vstring)
	Local $acall = DllCall("kernel32.dll", "int", "lstrlenA", "struct*", $vstring)
	If @error Then Return SetError(1, @extended, 0)
	Return $acall[0]
EndFunc

Func _winapi_stringlenw($vstring)
	Local $acall = DllCall("kernel32.dll", "int", "lstrlenW", "struct*", $vstring)
	If @error Then Return SetError(1, @extended, 0)
	Return $acall[0]
EndFunc

Func _winapi_sublangid($lgid)
	Return BitShift($lgid, 10)
EndFunc

Func _winapi_systemparametersinfo($iaction, $iparam = 0, $vparam = 0, $iwinini = 0)
	Local $aresult = DllCall("user32.dll", "bool", "SystemParametersInfoW", "uint", $iaction, "uint", $iparam, "ptr", $vparam, "uint", $iwinini)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_twipsperpixelx()
	Local $lngdc, $twipsperpixelx
	$lngdc = _winapi_getdc(0)
	$twipsperpixelx = 1440 / _winapi_getdevicecaps($lngdc, $__winapiconstant_logpixelsx)
	_winapi_releasedc(0, $lngdc)
	Return $twipsperpixelx
EndFunc

Func _winapi_twipsperpixely()
	Local $lngdc, $twipsperpixely
	$lngdc = _winapi_getdc(0)
	$twipsperpixely = 1440 / _winapi_getdevicecaps($lngdc, $__winapiconstant_logpixelsy)
	_winapi_releasedc(0, $lngdc)
	Return $twipsperpixely
EndFunc

Func _winapi_unhookwindowshookex($hhk)
	Local $aresult = DllCall("user32.dll", "bool", "UnhookWindowsHookEx", "handle", $hhk)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_updatelayeredwindow($hwnd, $hdcdest, $pptdest, $psize, $hdcsrce, $pptsrce, $irgb, $pblend, $iflags)
	Local $aresult = DllCall("user32.dll", "bool", "UpdateLayeredWindow", "hwnd", $hwnd, "handle", $hdcdest, "ptr", $pptdest, "ptr", $psize, "handle", $hdcsrce, "ptr", $pptsrce, "dword", $irgb, "ptr", $pblend, "dword", $iflags)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_updatewindow($hwnd)
	Local $aresult = DllCall("user32.dll", "bool", "UpdateWindow", "hwnd", $hwnd)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_waitforinputidle($hprocess, $itimeout = -1)
	Local $aresult = DllCall("user32.dll", "dword", "WaitForInputIdle", "handle", $hprocess, "dword", $itimeout)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_waitformultipleobjects($icount, $phandles, $fwaitall = False, $itimeout = -1)
	Local $aresult = DllCall("kernel32.dll", "INT", "WaitForMultipleObjects", "dword", $icount, "ptr", $phandles, "bool", $fwaitall, "dword", $itimeout)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_waitforsingleobject($hhandle, $itimeout = -1)
	Local $aresult = DllCall("kernel32.dll", "INT", "WaitForSingleObject", "handle", $hhandle, "dword", $itimeout)
	If @error Then Return SetError(@error, @extended, -1)
	Return $aresult[0]
EndFunc

Func _winapi_widechartomultibyte($punicode, $icodepage = 0, $bretstring = True)
	Local $sunicodetype = "wstr"
	If NOT IsString($punicode) Then $sunicodetype = "struct*"
	Local $aresult = DllCall("kernel32.dll", "int", "WideCharToMultiByte", "uint", $icodepage, "dword", 0, $sunicodetype, $punicode, "int", -1, "ptr", 0, "int", 0, "ptr", 0, "ptr", 0)
	If @error Then Return SetError(@error, @extended, "")
	Local $tmultibyte = DllStructCreate("char[" & $aresult[0] & "]")
	$aresult = DllCall("kernel32.dll", "int", "WideCharToMultiByte", "uint", $icodepage, "dword", 0, $sunicodetype, $punicode, "int", -1, "struct*", $tmultibyte, "int", $aresult[0], "ptr", 0, "ptr", 0)
	If @error Then Return SetError(@error, @extended, "")
	If $bretstring Then Return DllStructGetData($tmultibyte, 1)
	Return $tmultibyte
EndFunc

Func _winapi_windowfrompoint(ByRef $tpoint)
	Local $aresult = DllCall("user32.dll", "hwnd", "WindowFromPoint", "struct", $tpoint)
	If @error Then Return SetError(1, @extended, 0)
	Return $aresult[0]
EndFunc

Func _winapi_writeconsole($hconsole, $stext)
	Local $aresult = DllCall("kernel32.dll", "bool", "WriteConsoleW", "handle", $hconsole, "wstr", $stext, "dword", StringLen($stext), "dword*", 0, "ptr", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0]
EndFunc

Func _winapi_writefile($hfile, $pbuffer, $itowrite, ByRef $iwritten, $poverlapped = 0)
	Local $aresult = DllCall("kernel32.dll", "bool", "WriteFile", "handle", $hfile, "ptr", $pbuffer, "dword", $itowrite, "dword*", 0, "ptr", $poverlapped)
	If @error Then Return SetError(@error, @extended, False)
	$iwritten = $aresult[4]
	Return $aresult[0]
EndFunc

Func _winapi_writeprocessmemory($hprocess, $pbaseaddress, $pbuffer, $isize, ByRef $iwritten, $sbuffer = "ptr")
	Local $aresult = DllCall("kernel32.dll", "bool", "WriteProcessMemory", "handle", $hprocess, "ptr", $pbaseaddress, $sbuffer, $pbuffer, "ulong_ptr", $isize, "ulong_ptr*", 0)
	If @error Then Return SetError(@error, @extended, False)
	$iwritten = $aresult[5]
	Return $aresult[0]
EndFunc

Global $ghgdipbrush = 0
Global $ghgdipdll = 0
Global $ghgdippen = 0
Global $gigdipref = 0
Global $gigdiptoken = 0

Func _gdiplus_arrowcapcreate($fheight, $fwidth, $bfilled = True)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateAdjustableArrowCap", "float", $fheight, "float", $fwidth, "bool", $bfilled, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[4])
EndFunc

Func _gdiplus_arrowcapdispose($hcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteCustomLineCap", "handle", $hcap)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_arrowcapgetfillstate($harrowcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetAdjustableArrowCapFillState", "handle", $harrowcap, "bool*", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_arrowcapgetheight($harrowcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetAdjustableArrowCapHeight", "handle", $harrowcap, "float*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_arrowcapgetmiddleinset($harrowcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetAdjustableArrowCapMiddleInset", "handle", $harrowcap, "float*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_arrowcapgetwidth($harrowcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetAdjustableArrowCapWidth", "handle", $harrowcap, "float*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_arrowcapsetfillstate($harrowcap, $bfilled = True)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetAdjustableArrowCapFillState", "handle", $harrowcap, "bool", $bfilled)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_arrowcapsetheight($harrowcap, $fheight)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetAdjustableArrowCapHeight", "handle", $harrowcap, "float", $fheight)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_arrowcapsetmiddleinset($harrowcap, $finset)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetAdjustableArrowCapMiddleInset", "handle", $harrowcap, "float", $finset)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_arrowcapsetwidth($harrowcap, $fwidth)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetAdjustableArrowCapWidth", "handle", $harrowcap, "float", $fwidth)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_bitmapclonearea($hbmp, $ileft, $itop, $iwidth, $iheight, $iformat = 137224)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCloneBitmapAreaI", "int", $ileft, "int", $itop, "int", $iwidth, "int", $iheight, "int", $iformat, "handle", $hbmp, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[7])
EndFunc

Func _gdiplus_bitmapcreatefromfile($sfilename)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateBitmapFromFile", "wstr", $sfilename, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_bitmapcreatefromgraphics($iwidth, $iheight, $hgraphics)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateBitmapFromGraphics", "int", $iwidth, "int", $iheight, "handle", $hgraphics, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[4])
EndFunc

Func _gdiplus_bitmapcreatefromhbitmap($hbmp, $hpal = 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateBitmapFromHBITMAP", "handle", $hbmp, "handle", $hpal, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[3])
EndFunc

Func _gdiplus_bitmapcreatehbitmapfrombitmap($hbitmap, $iargb = -16777216)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateHBITMAPFromBitmap", "handle", $hbitmap, "ptr*", 0, "dword", $iargb)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_bitmapdispose($hbitmap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDisposeImage", "handle", $hbitmap)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_bitmaplockbits($hbitmap, $ileft, $itop, $iwidth, $iheight, $iflags = $gdip_ilmread, $iformat = $gdip_pxf32rgb)
	Local $tdata = DllStructCreate($taggdipbitmapdata)
	Local $trect = DllStructCreate($tagrect)
	DllStructSetData($trect, "Left", $ileft)
	DllStructSetData($trect, "Top", $itop)
	DllStructSetData($trect, "Right", $iwidth)
	DllStructSetData($trect, "Bottom", $iheight)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipBitmapLockBits", "handle", $hbitmap, "struct*", $trect, "uint", $iflags, "int", $iformat, "struct*", $tdata)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $tdata)
EndFunc

Func _gdiplus_bitmapunlockbits($hbitmap, $tbitmapdata)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipBitmapUnlockBits", "handle", $hbitmap, "struct*", $tbitmapdata)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_brushclone($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCloneBrush", "handle", $hbrush, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_brushcreatesolid($iargb = -16777216)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateSolidFill", "int", $iargb, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_brushdispose($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteBrush", "handle", $hbrush)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_brushgetsolidcolor($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetSolidFillColor", "handle", $hbrush, "dword*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_brushgettype($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetBrushType", "handle", $hbrush, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_brushsetsolidcolor($hbrush, $iargb = -16777216)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetSolidFillColor", "handle", $hbrush, "dword", $iargb)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_customlinecapdispose($hcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteCustomLineCap", "handle", $hcap)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_decoders()
	Local $icount = _gdiplus_decodersgetcount()
	Local $isize = _gdiplus_decodersgetsize()
	Local $tbuffer = DllStructCreate("byte[" & $isize & "]")
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageDecoders", "uint", $icount, "uint", $isize, "struct*", $tbuffer)
	If @error Then Return SetError(@error, @extended, 0)
	If $aresult[0] <> 0 Then Return SetError($aresult[0], 0, 0)
	Local $pbuffer = DllStructGetPtr($tbuffer)
	Local $tcodec, $ainfo[$icount + 1][14]
	$ainfo[0][0] = $icount
	For $ii = 1 To $icount
		$tcodec = DllStructCreate($taggdipimagecodecinfo, $pbuffer)
		$ainfo[$ii][1] = _winapi_stringfromguid(DllStructGetPtr($tcodec, "CLSID"))
		$ainfo[$ii][2] = _winapi_stringfromguid(DllStructGetPtr($tcodec, "FormatID"))
		$ainfo[$ii][3] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "CodecName"))
		$ainfo[$ii][4] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "DllName"))
		$ainfo[$ii][5] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "FormatDesc"))
		$ainfo[$ii][6] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "FileExt"))
		$ainfo[$ii][7] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "MimeType"))
		$ainfo[$ii][8] = DllStructGetData($tcodec, "Flags")
		$ainfo[$ii][9] = DllStructGetData($tcodec, "Version")
		$ainfo[$ii][10] = DllStructGetData($tcodec, "SigCount")
		$ainfo[$ii][11] = DllStructGetData($tcodec, "SigSize")
		$ainfo[$ii][12] = DllStructGetData($tcodec, "SigPattern")
		$ainfo[$ii][13] = DllStructGetData($tcodec, "SigMask")
		$pbuffer += DllStructGetSize($tcodec)
	Next
	Return $ainfo
EndFunc

Func _gdiplus_decodersgetcount()
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageDecodersSize", "uint*", 0, "uint*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[1])
EndFunc

Func _gdiplus_decodersgetsize()
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageDecodersSize", "uint*", 0, "uint*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_drawimagepoints($hgraphic, $himage, $nulx, $nuly, $nurx, $nury, $nllx, $nlly, $count = 3)
	Local $tpoint = DllStructCreate("float X;float Y;float X2;float Y2;float X3;float Y3")
	DllStructSetData($tpoint, "X", $nulx)
	DllStructSetData($tpoint, "Y", $nuly)
	DllStructSetData($tpoint, "X2", $nurx)
	DllStructSetData($tpoint, "Y2", $nury)
	DllStructSetData($tpoint, "X3", $nllx)
	DllStructSetData($tpoint, "Y3", $nlly)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawImagePoints", "handle", $hgraphic, "handle", $himage, "struct*", $tpoint, "int", $count)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_encoders()
	Local $icount = _gdiplus_encodersgetcount()
	Local $isize = _gdiplus_encodersgetsize()
	Local $tbuffer = DllStructCreate("byte[" & $isize & "]")
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageEncoders", "uint", $icount, "uint", $isize, "struct*", $tbuffer)
	If @error Then Return SetError(@error, @extended, 0)
	If $aresult[0] <> 0 Then Return SetError($aresult[0], 0, 0)
	Local $pbuffer = DllStructGetPtr($tbuffer)
	Local $tcodec, $ainfo[$icount + 1][14]
	$ainfo[0][0] = $icount
	For $ii = 1 To $icount
		$tcodec = DllStructCreate($taggdipimagecodecinfo, $pbuffer)
		$ainfo[$ii][1] = _winapi_stringfromguid(DllStructGetPtr($tcodec, "CLSID"))
		$ainfo[$ii][2] = _winapi_stringfromguid(DllStructGetPtr($tcodec, "FormatID"))
		$ainfo[$ii][3] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "CodecName"))
		$ainfo[$ii][4] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "DllName"))
		$ainfo[$ii][5] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "FormatDesc"))
		$ainfo[$ii][6] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "FileExt"))
		$ainfo[$ii][7] = _winapi_widechartomultibyte(DllStructGetData($tcodec, "MimeType"))
		$ainfo[$ii][8] = DllStructGetData($tcodec, "Flags")
		$ainfo[$ii][9] = DllStructGetData($tcodec, "Version")
		$ainfo[$ii][10] = DllStructGetData($tcodec, "SigCount")
		$ainfo[$ii][11] = DllStructGetData($tcodec, "SigSize")
		$ainfo[$ii][12] = DllStructGetData($tcodec, "SigPattern")
		$ainfo[$ii][13] = DllStructGetData($tcodec, "SigMask")
		$pbuffer += DllStructGetSize($tcodec)
	Next
	Return $ainfo
EndFunc

Func _gdiplus_encodersgetclsid($sfileext)
	Local $aencoders = _gdiplus_encoders()
	For $ii = 1 To $aencoders[0][0]
		If StringInStr($aencoders[$ii][6], "*." & $sfileext) > 0 Then Return $aencoders[$ii][1]
	Next
	Return SetError(-1, -1, "")
EndFunc

Func _gdiplus_encodersgetcount()
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageEncodersSize", "uint*", 0, "uint*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[1])
EndFunc

Func _gdiplus_encodersgetparamlist($himage, $sencoder)
	Local $isize = _gdiplus_encodersgetparamlistsize($himage, $sencoder)
	If @error Then Return SetError(@error, -1, 0)
	Local $tguid = _winapi_guidfromstring($sencoder)
	Local $tbuffer = DllStructCreate("dword Count;byte Params[" & $isize - 4 & "]")
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetEncoderParameterList", "handle", $himage, "struct*", $tguid, "uint", $isize, "struct*", $tbuffer)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $tbuffer)
EndFunc

Func _gdiplus_encodersgetparamlistsize($himage, $sencoder)
	Local $tguid = _winapi_guidfromstring($sencoder)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetEncoderParameterListSize", "handle", $himage, "struct*", $tguid, "uint*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[3])
EndFunc

Func _gdiplus_encodersgetsize()
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageEncodersSize", "uint*", 0, "uint*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_fontcreate($hfamily, $fsize, $istyle = 0, $iunit = 3)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateFont", "handle", $hfamily, "float", $fsize, "int", $istyle, "int", $iunit, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[5])
EndFunc

Func _gdiplus_fontdispose($hfont)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteFont", "handle", $hfont)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_fontfamilycreate($sfamily)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateFontFamilyFromName", "wstr", $sfamily, "ptr", 0, "handle*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[3])
EndFunc

Func _gdiplus_fontfamilydispose($hfamily)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteFontFamily", "handle", $hfamily)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsclear($hgraphics, $iargb = -16777216)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGraphicsClear", "handle", $hgraphics, "dword", $iargb)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicscreatefromhdc($hdc)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateFromHDC", "handle", $hdc, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_graphicscreatefromhwnd($hwnd)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateFromHWND", "hwnd", $hwnd, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_graphicsdispose($hgraphics)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteGraphics", "handle", $hgraphics)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawarc($hgraphics, $ix, $iy, $iwidth, $iheight, $fstartangle, $fsweepangle, $hpen = 0)
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawArcI", "handle", $hgraphics, "handle", $hpen, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight, "float", $fstartangle, "float", $fsweepangle)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawbezier($hgraphics, $ix1, $iy1, $ix2, $iy2, $ix3, $iy3, $ix4, $iy4, $hpen = 0)
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawBezierI", "handle", $hgraphics, "handle", $hpen, "int", $ix1, "int", $iy1, "int", $ix2, "int", $iy2, "int", $ix3, "int", $iy3, "int", $ix4, "int", $iy4)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawclosedcurve($hgraphics, $apoints, $hpen = 0)
	Local $icount = $apoints[0][0]
	Local $tpoints = DllStructCreate("long[" & $icount * 2 & "]")
	For $ii = 1 To $icount
		DllStructSetData($tpoints, 1, $apoints[$ii][0], (($ii - 1) * 2) + 1)
		DllStructSetData($tpoints, 1, $apoints[$ii][1], (($ii - 1) * 2) + 2)
	Next
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawClosedCurveI", "handle", $hgraphics, "handle", $hpen, "struct*", $tpoints, "int", $icount)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawcurve($hgraphics, $apoints, $hpen = 0)
	Local $icount = $apoints[0][0]
	Local $tpoints = DllStructCreate("long[" & $icount * 2 & "]")
	For $ii = 1 To $icount
		DllStructSetData($tpoints, 1, $apoints[$ii][0], (($ii - 1) * 2) + 1)
		DllStructSetData($tpoints, 1, $apoints[$ii][1], (($ii - 1) * 2) + 2)
	Next
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawCurveI", "handle", $hgraphics, "handle", $hpen, "struct*", $tpoints, "int", $icount)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawellipse($hgraphics, $ix, $iy, $iwidth, $iheight, $hpen = 0)
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawEllipseI", "handle", $hgraphics, "handle", $hpen, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawimage($hgraphics, $himage, $ix, $iy)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawImageI", "handle", $hgraphics, "handle", $himage, "int", $ix, "int", $iy)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawimagerect($hgraphics, $himage, $ix, $iy, $iw, $ih)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawImageRectI", "handle", $hgraphics, "handle", $himage, "int", $ix, "int", $iy, "int", $iw, "int", $ih)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawimagerectrect($hgraphics, $himage, $isrcx, $isrcy, $isrcwidth, $isrcheight, $idstx, $idsty, $idstwidth, $idstheight, $iunit = 2)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawImageRectRectI", "handle", $hgraphics, "handle", $himage, "int", $idstx, "int", $idsty, "int", $idstwidth, "int", $idstheight, "int", $isrcx, "int", $isrcy, "int", $isrcwidth, "int", $isrcheight, "int", $iunit, "int", 0, "int", 0, "int", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawline($hgraphics, $ix1, $iy1, $ix2, $iy2, $hpen = 0)
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawLineI", "handle", $hgraphics, "handle", $hpen, "int", $ix1, "int", $iy1, "int", $ix2, "int", $iy2)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawpie($hgraphics, $ix, $iy, $iwidth, $iheight, $fstartangle, $fsweepangle, $hpen = 0)
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawPieI", "handle", $hgraphics, "handle", $hpen, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight, "float", $fstartangle, "float", $fsweepangle)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawpolygon($hgraphics, $apoints, $hpen = 0)
	Local $icount = $apoints[0][0]
	Local $tpoints = DllStructCreate("long[" & $icount * 2 & "]")
	For $ii = 1 To $icount
		DllStructSetData($tpoints, 1, $apoints[$ii][0], (($ii - 1) * 2) + 1)
		DllStructSetData($tpoints, 1, $apoints[$ii][1], (($ii - 1) * 2) + 2)
	Next
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawPolygonI", "handle", $hgraphics, "handle", $hpen, "struct*", $tpoints, "int", $icount)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawrect($hgraphics, $ix, $iy, $iwidth, $iheight, $hpen = 0)
	__gdiplus_pendefcreate($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawRectangleI", "handle", $hgraphics, "handle", $hpen, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_pendefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsdrawstring($hgraphics, $sstring, $nx, $ny, $sfont = "Arial", $nsize = 10, $iformat = 0)
	Local $hbrush = _gdiplus_brushcreatesolid()
	Local $hformat = _gdiplus_stringformatcreate($iformat)
	Local $hfamily = _gdiplus_fontfamilycreate($sfont)
	Local $hfont = _gdiplus_fontcreate($hfamily, $nsize)
	Local $tlayout = _gdiplus_rectfcreate($nx, $ny, 0, 0)
	Local $ainfo = _gdiplus_graphicsmeasurestring($hgraphics, $sstring, $hfont, $tlayout, $hformat)
	Local $aresult = _gdiplus_graphicsdrawstringex($hgraphics, $sstring, $hfont, $ainfo[0], $hformat, $hbrush)
	Local $ierror = @error
	_gdiplus_fontdispose($hfont)
	_gdiplus_fontfamilydispose($hfamily)
	_gdiplus_stringformatdispose($hformat)
	_gdiplus_brushdispose($hbrush)
	Return SetError($ierror, 0, $aresult)
EndFunc

Func _gdiplus_graphicsdrawstringex($hgraphics, $sstring, $hfont, $tlayout, $hformat, $hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDrawString", "handle", $hgraphics, "wstr", $sstring, "int", -1, "handle", $hfont, "struct*", $tlayout, "handle", $hformat, "handle", $hbrush)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsfillclosedcurve($hgraphics, $apoints, $hbrush = 0)
	Local $icount = $apoints[0][0]
	Local $tpoints = DllStructCreate("long[" & $icount * 2 & "]")
	For $ii = 1 To $icount
		DllStructSetData($tpoints, 1, $apoints[$ii][0], (($ii - 1) * 2) + 1)
		DllStructSetData($tpoints, 1, $apoints[$ii][1], (($ii - 1) * 2) + 2)
	Next
	__gdiplus_brushdefcreate($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipFillClosedCurveI", "handle", $hgraphics, "handle", $hbrush, "struct*", $tpoints, "int", $icount)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_brushdefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsfillellipse($hgraphics, $ix, $iy, $iwidth, $iheight, $hbrush = 0)
	__gdiplus_brushdefcreate($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipFillEllipseI", "handle", $hgraphics, "handle", $hbrush, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_brushdefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsfillpie($hgraphics, $ix, $iy, $iwidth, $iheight, $fstartangle, $fsweepangle, $hbrush = 0)
	__gdiplus_brushdefcreate($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipFillPieI", "handle", $hgraphics, "handle", $hbrush, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight, "float", $fstartangle, "float", $fsweepangle)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_brushdefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsfillpolygon($hgraphics, $apoints, $hbrush = 0)
	Local $icount = $apoints[0][0]
	Local $tpoints = DllStructCreate("long[" & $icount * 2 & "]")
	For $ii = 1 To $icount
		DllStructSetData($tpoints, 1, $apoints[$ii][0], (($ii - 1) * 2) + 1)
		DllStructSetData($tpoints, 1, $apoints[$ii][1], (($ii - 1) * 2) + 2)
	Next
	__gdiplus_brushdefcreate($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipFillPolygonI", "handle", $hgraphics, "handle", $hbrush, "struct*", $tpoints, "int", $icount, "int", "FillModeAlternate")
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_brushdefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsfillrect($hgraphics, $ix, $iy, $iwidth, $iheight, $hbrush = 0)
	__gdiplus_brushdefcreate($hbrush)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipFillRectangleI", "handle", $hgraphics, "handle", $hbrush, "int", $ix, "int", $iy, "int", $iwidth, "int", $iheight)
	Local $tmperror = @error, $tmpextended = @extended
	__gdiplus_brushdefdispose()
	If $tmperror Then Return SetError($tmperror, $tmpextended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicsgetdc($hgraphics)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetDC", "handle", $hgraphics, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, False)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_graphicsgetsmoothingmode($hgraphics)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetSmoothingMode", "handle", $hgraphics, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Switch $aresult[2]
		Case 3
			Return SetExtended($aresult[0], 1)
		Case 7
			Return SetExtended($aresult[0], 2)
		Case Else
			Return SetExtended($aresult[0], 0)
	EndSwitch
EndFunc

Func _gdiplus_graphicsmeasurestring($hgraphics, $sstring, $hfont, $tlayout, $hformat)
	Local $trectf = DllStructCreate($taggdiprectf)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipMeasureString", "handle", $hgraphics, "wstr", $sstring, "int", -1, "handle", $hfont, "struct*", $tlayout, "handle", $hformat, "struct*", $trectf, "int*", 0, "int*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Local $ainfo[3]
	$ainfo[0] = $trectf
	$ainfo[1] = $aresult[8]
	$ainfo[2] = $aresult[9]
	Return SetExtended($aresult[0], $ainfo)
EndFunc

Func _gdiplus_graphicsreleasedc($hgraphics, $hdc)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipReleaseDC", "handle", $hgraphics, "handle", $hdc)
	If @error Then Return SetError(@error, @extended, False)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_graphicssettransform($hgraphics, $hmatrix)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetWorldTransform", "handle", $hgraphics, "handle", $hmatrix)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_graphicssetsmoothingmode($hgraphics, $ismooth)
	If $ismooth < 0 OR $ismooth > 4 Then $ismooth = 0
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetSmoothingMode", "handle", $hgraphics, "int", $ismooth)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_imagedispose($himage)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDisposeImage", "handle", $himage)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_imagegetflags($himage)
	Local $aflag[2] = [0, ""]
	If ($himage = -1) OR (NOT $himage) Then Return SetError(10, 1, $aflag)
	Local $aimageflags[13][2] = [["Pixel data Cacheable", $gdip_imageflags_caching], ["Pixel data read-only", $gdip_imageflags_readonly], ["Pixel size in image", $gdip_imageflags_hasrealpixelsize], ["DPI info in image", $gdip_imageflags_hasrealdpi], ["YCCK color space", $gdip_imageflags_colorspace_ycck], ["YCBCR color space", $gdip_imageflags_colorspace_ycbcr], ["Grayscale image", $gdip_imageflags_colorspace_gray], ["CMYK color space", $gdip_imageflags_colorspace_cmyk], ["RGB color space", $gdip_imageflags_colorspace_rgb], ["Partially scalable", $gdip_imageflags_partiallyscalable], ["Alpha values other than 0 (transparent) and 255 (opaque)", $gdip_imageflags_hastranslucent], ["Alpha values", $gdip_imageflags_hasalpha], ["Scalable", $gdip_imageflags_scalable]]
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageFlags", "handle", $himage, "long*", 0)
	If @error Then Return SetError(@error, 2, $aflag)
	If $aresult[2] = $gdip_imageflags_none Then
		$aflag[1] = "No pixel data"
		Return SetError($aresult[0], 3, $aflag)
	EndIf
	$aflag[0] = $aresult[2]
	For $i = 0 To 12
		If BitAND($aresult[2], $aimageflags[$i][1]) = $aimageflags[$i][1] Then
			If StringLen($aflag[1]) Then $aflag[1] &= "|"
			$aresult[2] -= $aimageflags[$i][1]
			$aflag[1] &= $aimageflags[$i][0]
		EndIf
	Next
	Return SetExtended($aresult[0], $aflag)
EndFunc

Func _gdiplus_imagegetgraphicscontext($himage)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageGraphicsContext", "handle", $himage, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_imagegetheight($himage)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageHeight", "handle", $himage, "uint*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_imagegethorizontalresolution($himage)
	If ($himage = -1) OR (NOT $himage) Then Return SetError(10, 1, 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageHorizontalResolution", "handle", $himage, "float*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], Round($aresult[2]))
EndFunc

Func _gdiplus_imagegetpixelformat($himage)
	Local $aformat[2] = [0, ""]
	If ($himage = -1) OR (NOT $himage) Then Return SetError(10, 1, $aformat)
	Local $apixelformat[14][2] = [["1 Bpp Indexed", $gdip_pxf01indexed], ["4 Bpp Indexed", $gdip_pxf04indexed], ["8 Bpp Indexed", $gdip_pxf08indexed], ["16 Bpp Grayscale", $gdip_pxf16grayscale], ["16 Bpp RGB 555", $gdip_pxf16rgb555], ["16 Bpp RGB 565", $gdip_pxf16rgb565], ["16 Bpp ARGB 1555", $gdip_pxf16argb1555], ["24 Bpp RGB", $gdip_pxf24rgb], ["32 Bpp RGB", $gdip_pxf32rgb], ["32 Bpp ARGB", $gdip_pxf32argb], ["32 Bpp PARGB", $gdip_pxf32pargb], ["48 Bpp RGB", $gdip_pxf48rgb], ["64 Bpp ARGB", $gdip_pxf64argb], ["64 Bpp PARGB", $gdip_pxf64pargb]]
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImagePixelFormat", "handle", $himage, "int*", 0)
	If @error Then Return SetError(@error, @extended, $aformat)
	For $i = 0 To 13
		If $apixelformat[$i][1] = $aresult[2] Then
			$aformat[0] = $apixelformat[$i][1]
			$aformat[1] = $apixelformat[$i][0]
			Return SetExtended($aresult[0], $aformat)
		EndIf
	Next
	Return SetExtended($aresult[0], $aformat)
EndFunc

Func _gdiplus_imagegetrawformat($himage)
	Local $aguid[2]
	If ($himage = -1) OR (NOT $himage) Then Return SetError(10, 1, $aguid)
	Local $aimagetype[11][2] = [["UNDEFINED", $gdip_imageformat_undefined], ["MEMORYBMP", $gdip_imageformat_memorybmp], ["BMP", $gdip_imageformat_bmp], ["EMF", $gdip_imageformat_emf], ["WMF", $gdip_imageformat_wmf], ["JPEG", $gdip_imageformat_jpeg], ["PNG", $gdip_imageformat_png], ["GIF", $gdip_imageformat_gif], ["TIFF", $gdip_imageformat_tiff], ["EXIF", $gdip_imageformat_exif], ["ICON", $gdip_imageformat_icon]]
	Local $tstruct = DllStructCreate("byte[16]")
	Local $aresult1 = DllCall($ghgdipdll, "int", "GdipGetImageRawFormat", "handle", $himage, "struct*", $tstruct)
	If @error Then Return SetError(@error, @extended, $aguid)
	If (NOT IsArray($aresult1)) Then Return SetError(1, 3, $aguid)
	Local $sresult2 = _winapi_stringfromguid($aresult1[2])
	If @error Then Return SetError(@error, 4, $aguid)
	For $i = 0 To 10
		If $aimagetype[$i][1] == $sresult2 Then
			$aguid[0] = $aimagetype[$i][1]
			$aguid[1] = $aimagetype[$i][0]
			Return SetExtended($aresult1[0], $aguid)
		EndIf
	Next
	Return SetError(-1, 5, $aguid)
EndFunc

Func _gdiplus_imagegettype($himage)
	If ($himage = -1) OR (NOT $himage) Then Return SetError(10, 0, -1)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageType", "handle", $himage, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_imagegetverticalresolution($himage)
	If ($himage = -1) OR (NOT $himage) Then Return SetError(10, 0, 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageVerticalResolution", "handle", $himage, "float*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], Round($aresult[2]))
EndFunc

Func _gdiplus_imagegetwidth($himage)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetImageWidth", "handle", $himage, "uint*", -1)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_imageloadfromfile($sfilename)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipLoadImageFromFile", "wstr", $sfilename, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_imagesavetofile($himage, $sfilename)
	Local $sext = __gdiplus_extractfileext($sfilename)
	Local $sclsid = _gdiplus_encodersgetclsid($sext)
	If $sclsid = "" Then Return SetError(-1, 0, False)
	Return _gdiplus_imagesavetofileex($himage, $sfilename, $sclsid, 0)
EndFunc

Func _gdiplus_imagesavetofileex($himage, $sfilename, $sencoder, $pparams = 0)
	Local $tguid = _winapi_guidfromstring($sencoder)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSaveImageToFile", "handle", $himage, "wstr", $sfilename, "struct*", $tguid, "struct*", $pparams)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_matrixcreate()
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateMatrix", "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[1])
EndFunc

Func _gdiplus_matrixdispose($hmatrix)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteMatrix", "handle", $hmatrix)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_matrixrotate($hmatrix, $fangle, $bappend = False)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipRotateMatrix", "handle", $hmatrix, "float", $fangle, "int", $bappend)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_matrixscale($hmatrix, $fscalex, $fscaley, $border = False)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipScaleMatrix", "handle", $hmatrix, "float", $fscalex, "float", $fscaley, "int", $border)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_matrixtranslate($hmatrix, $foffsetx, $foffsety, $bappend = False)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipTranslateMatrix", "handle", $hmatrix, "float", $foffsetx, "float", $foffsety, "int", $bappend)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_paramadd(ByRef $tparams, $sguid, $icount, $itype, $pvalues)
	Local $tparam = DllStructCreate($taggdipencoderparam, DllStructGetPtr($tparams, "Params") + (DllStructGetData($tparams, "Count") * 28))
	_winapi_guidfromstringex($sguid, DllStructGetPtr($tparam, "GUID"))
	DllStructSetData($tparam, "Type", $itype)
	DllStructSetData($tparam, "Count", $icount)
	DllStructSetData($tparam, "Values", $pvalues)
	DllStructSetData($tparams, "Count", DllStructGetData($tparams, "Count") + 1)
EndFunc

Func _gdiplus_paraminit($icount)
	If $icount <= 0 Then Return SetError(-1, -1, 0)
	Return DllStructCreate("dword Count;byte Params[" & $icount * 28 & "]")
EndFunc

Func _gdiplus_pencreate($iargb = -16777216, $fwidth = 1, $iunit = 2)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreatePen1", "dword", $iargb, "float", $fwidth, "int", $iunit, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[4])
EndFunc

Func _gdiplus_pendispose($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeletePen", "handle", $hpen)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pengetalignment($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenMode", "handle", $hpen, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pengetcolor($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenColor", "handle", $hpen, "dword*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pengetcustomendcap($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenCustomEndCap", "handle", $hpen, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pengetdashcap($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenDashCap197819", "handle", $hpen, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pengetdashstyle($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenDashStyle", "handle", $hpen, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pengetendcap($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenEndCap", "handle", $hpen, "int*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pengetwidth($hpen)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipGetPenWidth", "handle", $hpen, "float*", 0)
	If @error Then Return SetError(@error, @extended, -1)
	Return SetExtended($aresult[0], $aresult[2])
EndFunc

Func _gdiplus_pensetalignment($hpen, $ialignment = 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenMode", "handle", $hpen, "int", $ialignment)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pensetcolor($hpen, $iargb)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenColor", "handle", $hpen, "dword", $iargb)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pensetdashcap($hpen, $idash = 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenDashCap197819", "handle", $hpen, "int", $idash)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pensetcustomendcap($hpen, $hendcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenCustomEndCap", "handle", $hpen, "handle", $hendcap)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pensetdashstyle($hpen, $istyle = 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenDashStyle", "handle", $hpen, "int", $istyle)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pensetendcap($hpen, $iendcap)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenEndCap", "handle", $hpen, "int", $iendcap)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_pensetwidth($hpen, $fwidth)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetPenWidth", "handle", $hpen, "float", $fwidth)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_rectfcreate($nx = 0, $ny = 0, $nwidth = 0, $nheight = 0)
	Local $trectf = DllStructCreate($taggdiprectf)
	DllStructSetData($trectf, "X", $nx)
	DllStructSetData($trectf, "Y", $ny)
	DllStructSetData($trectf, "Width", $nwidth)
	DllStructSetData($trectf, "Height", $nheight)
	Return $trectf
EndFunc

Func _gdiplus_shutdown()
	If $ghgdipdll = 0 Then Return SetError(-1, -1, False)
	$gigdipref -= 1
	If $gigdipref = 0 Then
		DllCall($ghgdipdll, "none", "GdiplusShutdown", "ptr", $gigdiptoken)
		DllClose($ghgdipdll)
		$ghgdipdll = 0
	EndIf
	Return True
EndFunc

Func _gdiplus_startup()
	$gigdipref += 1
	If $gigdipref > 1 Then Return True
	$ghgdipdll = DllOpen("GDIPlus.dll")
	If $ghgdipdll = -1 Then
		$gigdipref = 0
		Return SetError(1, 2, False)
	EndIf
	Local $tinput = DllStructCreate($taggdipstartupinput)
	Local $ttoken = DllStructCreate("ulong_ptr Data")
	DllStructSetData($tinput, "Version", 1)
	Local $aresult = DllCall($ghgdipdll, "int", "GdiplusStartup", "struct*", $ttoken, "struct*", $tinput, "ptr", 0)
	If @error Then Return SetError(@error, @extended, False)
	$gigdiptoken = DllStructGetData($ttoken, "Data")
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_stringformatcreate($iformat = 0, $ilangid = 0)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipCreateStringFormat", "int", $iformat, "word", $ilangid, "ptr*", 0)
	If @error Then Return SetError(@error, @extended, 0)
	Return SetExtended($aresult[0], $aresult[3])
EndFunc

Func _gdiplus_stringformatdispose($hformat)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipDeleteStringFormat", "handle", $hformat)
	If @error Then Return SetError(@error, @extended, False)
	Return $aresult[0] = 0
EndFunc

Func _gdiplus_stringformatsetalign($hstringformat, $iflag)
	Local $aresult = DllCall($ghgdipdll, "int", "GdipSetStringFormatAlign", "handle", $hstringformat, "int", $iflag)
	If @error Then Return SetError(@error, @extended, 0)
	Return $aresult[0] = 0
EndFunc

Func __gdiplus_brushdefcreate(ByRef $hbrush)
	If $hbrush = 0 Then
		$ghgdipbrush = _gdiplus_brushcreatesolid()
		$hbrush = $ghgdipbrush
	EndIf
EndFunc

Func __gdiplus_brushdefdispose()
	If $ghgdipbrush <> 0 Then
		_gdiplus_brushdispose($ghgdipbrush)
		$ghgdipbrush = 0
	EndIf
EndFunc

Func __gdiplus_extractfileext($sfilename, $fnodot = True)
	Local $iindex = __gdiplus_lastdelimiter(".\:", $sfilename)
	If ($iindex > 0) AND (StringMid($sfilename, $iindex, 1) = ".") Then
		If $fnodot Then
			Return StringMid($sfilename, $iindex + 1)
		Else
			Return StringMid($sfilename, $iindex)
		EndIf
	Else
		Return ""
	EndIf
EndFunc

Func __gdiplus_lastdelimiter($sdelimiters, $sstring)
	Local $sdelimiter, $in
	For $ii = 1 To StringLen($sdelimiters)
		$sdelimiter = StringMid($sdelimiters, $ii, 1)
		$in = StringInStr($sstring, $sdelimiter, 0, -1)
		If $in > 0 Then Return $in
	Next
EndFunc

Func __gdiplus_pendefcreate(ByRef $hpen)
	If $hpen = 0 Then
		$ghgdippen = _gdiplus_pencreate()
		$hpen = $ghgdippen
	EndIf
EndFunc

Func __gdiplus_pendefdispose()
	If $ghgdippen <> 0 Then
		_gdiplus_pendispose($ghgdippen)
		$ghgdippen = 0
	EndIf
EndFunc

Global $gibmpformat = $gdip_pxf24rgb
Global $gijpgquality = 100
Global $gitifcolordepth = 24
Global $gitifcompression = $gdip_evtcompressionlzw
Global Const $__screencaptureconstant_sm_cxscreen = 0
Global Const $__screencaptureconstant_sm_cyscreen = 1
Global Const $__screencaptureconstant_srccopy = 13369376

Func _screencapture_capture($sfilename = "", $ileft = 0, $itop = 0, $iright = -1, $ibottom = -1, $fcursor = True)
	If $iright = -1 Then $iright = _winapi_getsystemmetrics($__screencaptureconstant_sm_cxscreen)
	If $ibottom = -1 Then $ibottom = _winapi_getsystemmetrics($__screencaptureconstant_sm_cyscreen)
	If $iright < $ileft Then Return SetError(-1, 0, 0)
	If $ibottom < $itop Then Return SetError(-2, 0, 0)
	Local $iw = ($iright - $ileft) + 1
	Local $ih = ($ibottom - $itop) + 1
	Local $hwnd = _winapi_getdesktopwindow()
	Local $hddc = _winapi_getdc($hwnd)
	Local $hcdc = _winapi_createcompatibledc($hddc)
	Local $hbmp = _winapi_createcompatiblebitmap($hddc, $iw, $ih)
	_winapi_selectobject($hcdc, $hbmp)
	_winapi_bitblt($hcdc, 0, 0, $iw, $ih, $hddc, $ileft, $itop, $__screencaptureconstant_srccopy)
	If $fcursor Then
		Local $acursor = _winapi_getcursorinfo()
		If $acursor[1] Then
			Local $hicon = _winapi_copyicon($acursor[2])
			Local $aicon = _winapi_geticoninfo($hicon)
			_winapi_deleteobject($aicon[4])
			If $aicon[5] <> 0 Then _winapi_deleteobject($aicon[5])
			_winapi_drawicon($hcdc, $acursor[3] - $aicon[2] - $ileft, $acursor[4] - $aicon[3] - $itop, $hicon)
			_winapi_destroyicon($hicon)
		EndIf
	EndIf
	_winapi_releasedc($hwnd, $hddc)
	_winapi_deletedc($hcdc)
	If $sfilename = "" Then Return $hbmp
	Local $ret = _screencapture_saveimage($sfilename, $hbmp, True)
	Return SetError(@error, @extended, $ret)
EndFunc

Func _screencapture_capturewnd($sfilename, $hwnd, $ileft = 0, $itop = 0, $iright = -1, $ibottom = -1, $fcursor = True)
	If NOT IsHWnd($hwnd) Then $hwnd = WinGetHandle($hwnd)
	Local $trect = DllStructCreate($tagrect)
	Local Const $dwmwa_extended_frame_bounds = 9
	Local $bret = DllCall("dwmapi.dll", "long", "DwmGetWindowAttribute", "hwnd", $hwnd, "dword", $dwmwa_extended_frame_bounds, "struct*", $trect, "dword", DllStructGetSize($trect))
	If (@error OR $bret[0] OR (Abs(DllStructGetData($trect, "Left")) + Abs(DllStructGetData($trect, "Top")) + Abs(DllStructGetData($trect, "Right")) + Abs(DllStructGetData($trect, "Bottom"))) = 0) Then
		$trect = _winapi_getwindowrect($hwnd)
		If @error Then Return SetError(@error, @extended, 0)
	EndIf
	$ileft += DllStructGetData($trect, "Left")
	$itop += DllStructGetData($trect, "Top")
	If $iright = -1 Then $iright = DllStructGetData($trect, "Right") - DllStructGetData($trect, "Left") - 1
	If $ibottom = -1 Then $ibottom = DllStructGetData($trect, "Bottom") - DllStructGetData($trect, "Top") - 1
	$iright += DllStructGetData($trect, "Left")
	$ibottom += DllStructGetData($trect, "Top")
	If $ileft > DllStructGetData($trect, "Right") Then $ileft = DllStructGetData($trect, "Left")
	If $itop > DllStructGetData($trect, "Bottom") Then $itop = DllStructGetData($trect, "Top")
	If $iright > DllStructGetData($trect, "Right") Then $iright = DllStructGetData($trect, "Right") - 1
	If $ibottom > DllStructGetData($trect, "Bottom") Then $ibottom = DllStructGetData($trect, "Bottom") - 1
	Return _screencapture_capture($sfilename, $ileft, $itop, $iright, $ibottom, $fcursor)
EndFunc

Func _screencapture_saveimage($sfilename, $hbitmap, $ffreebmp = True)
	_gdiplus_startup()
	If @error Then Return SetError(-1, -1, False)
	Local $sext = StringUpper(__gdiplus_extractfileext($sfilename))
	Local $sclsid = _gdiplus_encodersgetclsid($sext)
	If $sclsid = "" Then Return SetError(-2, -2, False)
	Local $himage = _gdiplus_bitmapcreatefromhbitmap($hbitmap)
	If @error Then Return SetError(-3, -3, False)
	Local $tdata, $tparams
	Switch $sext
		Case "BMP"
			Local $ix = _gdiplus_imagegetwidth($himage)
			Local $iy = _gdiplus_imagegetheight($himage)
			Local $hclone = _gdiplus_bitmapclonearea($himage, 0, 0, $ix, $iy, $gibmpformat)
			_gdiplus_imagedispose($himage)
			$himage = $hclone
		Case "JPG", "JPEG"
			$tparams = _gdiplus_paraminit(1)
			$tdata = DllStructCreate("int Quality")
			DllStructSetData($tdata, "Quality", $gijpgquality)
			_gdiplus_paramadd($tparams, $gdip_epgquality, 1, $gdip_eptlong, DllStructGetPtr($tdata))
		Case "TIF", "TIFF"
			$tparams = _gdiplus_paraminit(2)
			$tdata = DllStructCreate("int ColorDepth;int Compression")
			DllStructSetData($tdata, "ColorDepth", $gitifcolordepth)
			DllStructSetData($tdata, "Compression", $gitifcompression)
			_gdiplus_paramadd($tparams, $gdip_epgcolordepth, 1, $gdip_eptlong, DllStructGetPtr($tdata, "ColorDepth"))
			_gdiplus_paramadd($tparams, $gdip_epgcompression, 1, $gdip_eptlong, DllStructGetPtr($tdata, "Compression"))
	EndSwitch
	Local $pparams = 0
	If IsDllStruct($tparams) Then $pparams = $tparams
	Local $iret = _gdiplus_imagesavetofileex($himage, $sfilename, $sclsid, $pparams)
	_gdiplus_imagedispose($himage)
	If $ffreebmp Then _winapi_deleteobject($hbitmap)
	_gdiplus_shutdown()
	Return SetError($iret = False, 0, $iret = True)
EndFunc

Func _screencapture_setbmpformat($iformat)
	Switch $iformat
		Case 0
			$gibmpformat = $gdip_pxf16rgb555
		Case 1
			$gibmpformat = $gdip_pxf16rgb565
		Case 2
			$gibmpformat = $gdip_pxf24rgb
		Case 3
			$gibmpformat = $gdip_pxf32rgb
		Case 4
			$gibmpformat = $gdip_pxf32argb
		Case Else
			$gibmpformat = $gdip_pxf24rgb
	EndSwitch
EndFunc

Func _screencapture_setjpgquality($iquality)
	If $iquality < 0 Then $iquality = 0
	If $iquality > 100 Then $iquality = 100
	$gijpgquality = $iquality
EndFunc

Func _screencapture_settifcolordepth($idepth)
	Switch $idepth
		Case 24
			$gitifcolordepth = 24
		Case 32
			$gitifcolordepth = 32
		Case Else
			$gitifcolordepth = 0
	EndSwitch
EndFunc

Func _screencapture_settifcompression($icompress)
	Switch $icompress
		Case 1
			$gitifcompression = $gdip_evtcompressionnone
		Case 2
			$gitifcompression = $gdip_evtcompressionlzw
		Case Else
			$gitifcompression = 0
	EndSwitch
EndFunc

Func omnimoerror($title, $msg)
	MsgBox(16, $title, $msg & @CRLF & @CRLF & "Please send an e-mail to omnimosupport@gmail.com or" & @CRLF & "file an issue at github with the following information:" & @CRLF & @CRLF & "- This error message" & @CRLF & "- Steps to reproduce the issue" & @CRLF & "- Your version of Rainmeter and Windows")
	Exit 
EndFunc

Func getskinwindow($szconfigname)
	Local Const $hwnd = WinGetHandle("[CLASS:RainmeterTrayClass]")
	If $hwnd <> 0 Then
		Local Const $isize = StringLen($szconfigname) + 1
		Local Const $pmem = DllStructCreate("wchar[" & $isize & "]")
		DllStructSetData($pmem, 1, $szconfigname)
		Local Const $pcds = DllStructCreate("dword;dword;ptr")
		DllStructSetData($pcds, 1, 5101)
		DllStructSetData($pcds, 2, ($isize * 2))
		DllStructSetData($pcds, 3, DllStructGetPtr($pmem))
		Local Const $wm_copydata = 74
		Return _sendmessage($hwnd, $wm_copydata, 0, DllStructGetPtr($pcds))
	EndIf
	Return 0
EndFunc

Func sendbang($szbang)
	Local Const $hwnd = WinGetHandle("[CLASS:RainmeterMeterWindow]")
	If $hwnd <> 0 Then
		Local Const $isize = StringLen($szbang) + 1
		Local Const $pmem = DllStructCreate("wchar[" & $isize & "]")
		DllStructSetData($pmem, 1, $szbang)
		Local Const $pcds = DllStructCreate("dword;dword;ptr")
		DllStructSetData($pcds, 1, 1)
		DllStructSetData($pcds, 2, ($isize * 2))
		DllStructSetData($pcds, 3, DllStructGetPtr($pmem))
		Local Const $wm_copydata = 74
		_sendmessage($hwnd, $wm_copydata, 0, DllStructGetPtr($pcds))
	EndIf
EndFunc

Func hextorgb($color)
	$blue = BitAND($color, 255)
	$green = BitAND(BitShift($color, 8), 255)
	$red = BitAND(BitShift($color, 16), 255)
	Return $red & "," & $green & "," & $blue
EndFunc

Func rgbtohex($color)
	$split = StringSplit($color, ",")
	Return "0x" & Hex($split[1], 2) & Hex($split[2], 2) & Hex($split[3], 2)
EndFunc

$settings = $cmdline[1]
$skins = $cmdline[2]
$command = $cmdline[3]
$index = $cmdline[4]
$saved = $skins & "WP7\TextItems\MultiManager\Saved\"
Switch $command
	Case "Save"
		If FileExists($saved & $index) = 0 Then DirCreate($saved & $index)
		$imagepath = $saved & $index & "\screenshot.png"
		_gdiplus_startup()
		$hbitmap = _screencapture_capture("", 0, 0, -1, -1, False)
		_savehbitmapex($hbitmap, $imagepath, 300, 300 / (@DesktopWidth / @DesktopHeight))
		FileCopy($settings & "Rainmeter.ini", $saved & $index & "\Rainmeter.ini", 1)
		IniDelete($saved & $index & "\Rainmeter.ini", "WP7\TextItems\MultiManager")
	Case "Load"
		FileCopy($saved & $index & "\Rainmeter.ini", $settings & "Rainmeter.ini", 1)
		sendbang("!RefreshApp")
	Case "Delete"
		DirRemove($saved & $index, 1)
EndSwitch

Func _savehbitmapex($hbitmap, $sfilename, $iwidth, $iheight)
	$bitmap = _gdiplus_bitmapcreatefromhbitmap($hbitmap)
	$graphics = _gdiplus_imagegetgraphicscontext($bitmap)
	$resizedbitmap = _gdiplus_bitmapcreatefromgraphics($iwidth, $iheight, $graphics)
	$graphics2 = _gdiplus_imagegetgraphicscontext($resizedbitmap)
	_gdiplus_graphicsdrawimagerect($graphics2, $bitmap, 0, 0, $iwidth, $iheight)
	_gdiplus_imagesavetofile($resizedbitmap, $sfilename)
	_gdiplus_graphicsdispose($graphics)
	_gdiplus_graphicsdispose($graphics2)
	_gdiplus_bitmapdispose($bitmap)
	_gdiplus_bitmapdispose($resizedbitmap)
	_winapi_deleteobject($hbitmap)
EndFunc
