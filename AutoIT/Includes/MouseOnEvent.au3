#Region Header

#CS

    Title:          MouseSetOnEvent UDF
    Filename:       MouseOnEvent.au3
    Description:    Set an events handler (a hook) for Mouse device.
    Author:         G.Sandler a.k.a (Mr)CreatoR (CreatoR's Lab - http://creator-lab.ucoz.ru, http://autoit-script.ru)
    Version:        1.8
    Requirements:   AutoIt v3.3.0.0 +, Developed/Tested on Windows XP (rus) Service Pack 2/3, with standard 3-buttons mouse device
	Usage:          _MouseSetOnEvent($iEvent, $sFuncName="", $sParam1="", $sParam2="", $hTargetWnd=0, $iBlockDefProc=1)
    Uses:           WindowsConstants.au3, WinAPI.au3, Timers.au3
	Forum Link:     http://www.autoitscript.com/forum/index.php?showtopic=64738
    Notes:          
                    1) The original events-messages (such as $WM_MOUSEMOVE) can be used as well.
                    2) Blocking of $sFuncName function by window messages with commands such as "Msgbox()" can lead to unexpected behavior,
					   the return to the system should be as fast as possible!
					
    ChangLog:
			v1.8 [02.06.2010]
			* Fixed an issue with wrong handling when $MOUSE_XBUTTONUP/DOWN_EVENT and few other events are set.
			* Fixed an issue when user attempts to set other function for the event that already have been set.
			  Now the function and other parameters are replaced for the current event.
			* UDF file renamed (removed "Set" in the middle and "_UDF" at the end of the name).
			* Cosmetic changes in the UDF code.
			* Docs updated.
			 
			v1.7 [14.10.2009]
			* Stability fixes. Thanks again to wraithdu.
			
			v1.6 [13.10.2009]
			* Fixed an issue with releasing the resources of mouse hook. Thanks to wraithdu.
			
			v1.5 [09.10.2009]
			+ Added wheel button up/down *scrolling* event recognition.
				Thanks to JRowe (http://www.autoitscript.com/forum/index.php?showtopic=103362).
			* Fixed an issue with returning value from __MouseSetOnEvent_MainHandler - should call _WinAPI_CallNextHookEx before return.
			* Constants starting with MOUSE_EXTRABUTTON* renamed to MOUSE_XBUTTON*, as it should be in the first place.
			* Few examples updated.
			
			v1.4 [30.09.2009]
			+ Added UDF header to the function.
			+ Now the original events-messages (such as $WM_MOUSEMOVE) can be used as well.
			+ Added missing events (althought i am not sure if they are still supported)
				$MOUSE_PRIMARYDBLCLK_EVENT - Primary mouse button double click.
				$MOUSE_SECONDARYDBLCLK_EVENT - Secondary mouse button double click.
				$MOUSE_WHEELDBLCLK_EVENT - Wheel mouse button double click.
				$MOUSE_EXTRABUTTONDBLCLK_EVENT - Side mouse button double click.
				
			* Changed global vars and internal functions names to be more unique.
			* Fixed variables declaration and misspelling.
			
			v1.3 [27.10.2008]
			* Added optional parameter $iBlockDefProc - Define wether the Mouse events handler will block the default processing or not (Default is 1, block).
			  If this is -1, then user can Return from the event function to set processing operation (see the attached example «AutoDrag Window.au3»).
			
			v1.2 [05.04.2008]
			* Added: [Optional] parameter $hTargetWnd, if set, the OnEvent function will be called only on $hTargetWnd window, otherwise will be standard Event processing.
			  Note: Can be a little(?) buggy when you mix different events.
			
			v1.1 [22.03.2008]
			* Fixed: Incorrect ReDim when remove event from the array, it was causing UDF to crash script with error.
			* Spell/Grammar corrections 
			* Added: An example of _BlockMouseClicksInput().
			
			v1.0 [21.02.2008]
			* First public release.
#CE

#include-once
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <Timers.au3>

If @AutoItVersion <= "3.3.0.0" Then
	Execute('Opt("OnExitFunc", "__MouseSetOnEvent_OnExitFunc")')
Else
	Execute('OnAutoItExitRegister("__MouseSetOnEvent_OnExitFunc")')
EndIf

#EndRegion Header

#Region Global Constants and Variables

If Not IsDeclared("WH_MOUSE_LL") Then
	Assign("WH_MOUSE_LL", 14, 2)
EndIf

Global $a__MSOE_Events[1][1]
Global $h__MSOE_MouseProc 		= -1
Global $h__MSOE_MouseHook 		= -1
Global $i__MSOE_Timer			= -1
Global $i__MSOE_EventReturn		= 1

#EndRegion Global Constants and Variables

#Region Public Constants

Global Const $MOUSE_MOVE_EVENT				= 0x200 		;512 (WM_MOUSEMOVE) 		; ==> Mouse moving.
Global Const $MOUSE_PRIMARYDOWN_EVENT		= 0x201 		;513 (WM_LBUTTONDOWN) 		; ==> Primary mouse button down.
Global Const $MOUSE_PRIMARYUP_EVENT			= 0x202 		;514 (WM_LBUTTONUP) 		; ==> Primary mouse button up.
Global Const $MOUSE_PRIMARYDBLCLK_EVENT		= 0x203 		;515 (WM_LBUTTONDBLCLK) 	; ==> Primary mouse button double click.
Global Const $MOUSE_SECONDARYDOWN_EVENT		= 0x204 		;516 (WM_RBUTTONDOWN) 		; ==> Secondary mouse button down.
Global Const $MOUSE_SECONDARYUP_EVENT		= 0x205 		;517 (WM_RBUTTONUP) 		; ==> Secondary mouse button up.
Global Const $MOUSE_SECONDARYDBLCLK_EVENT	= 0x206 		;518 (WM_RBUTTONDBLCLK) 	; ==> Secondary mouse button double click.
Global Const $MOUSE_WHEELDOWN_EVENT			= 0x207 		;519 (WM_MBUTTONDOWN) 		; ==> Wheel mouse button pressed down.
Global Const $MOUSE_WHEELUP_EVENT			= 0x208 		;520 (WM_MBUTTONUP) 		; ==> Wheel mouse button up.
Global Const $MOUSE_WHEELDBLCLK_EVENT		= 0x209 		;521 (WM_MBUTTONDBLCLK) 	; ==> Wheel mouse button double click.
Global Const $MOUSE_WHEELSCROLL_EVENT		= 0x20A 		;522 (WM_MOUSEWHEEL) 		; ==> Wheel mouse scroll.
Global Const $MOUSE_WHEELSCROLLDOWN_EVENT	= 0x20A + 8 	;530 (WM_MOUSEWHEEL + 8) 	; ==> Wheel mouse scroll Down.
Global Const $MOUSE_WHEELSCROLLUP_EVENT		= 0x20A + 16 	;538 (WM_MOUSEWHEEL + 16) 	; ==> Wheel mouse scroll Up.
Global Const $MOUSE_XBUTTONDOWN_EVENT		= 0x20B 		;523 (WM_XBUTTONDOWN) 		; ==> Side mouse button down (usualy navigating next/back buttons).
Global Const $MOUSE_XBUTTONUP_EVENT			= 0x20C 		;524 (WM_XBUTTONUP) 		; ==> Side mouse button up.
Global Const $MOUSE_XBUTTONDBLCLK_EVENT		= 0x20D 		;525 (WM_XBUTTONDBLCLK) 	; ==> Side mouse button double click.

#EndRegion Public Constants

#Region Public Functions

; #FUNCTION# ====================================================================================================
; Name...........:	_MouseSetOnEvent
; Description....:	Set an events handler (a hook) for Mouse device.
; Syntax.........:	_MouseSetOnEvent($iEvent, $sFuncName="", $sParam1="", $sParam2="", $hTargetWnd=0, $iBlockDefProc=1)
; Parameters.....:	$iEvent 		- The event to set, here is the list of supported events:
;										$MOUSE_MOVE_EVENT - Mouse moving.
;										$MOUSE_PRIMARYDOWN_EVENT - Primary mouse button down.
;										$MOUSE_PRIMARYUP_EVENT - Primary mouse button up.
;										$MOUSE_PRIMARYDBLCLK_EVENT - Primary mouse button double click.
;										$MOUSE_SECONDARYDOWN_EVENT - Secondary mouse button down.
;										$MOUSE_SECONDARYUP_EVENT - Secondary mouse button up.
;										$MOUSE_SECONDARYDBLCLK_EVENT - Secondary mouse button double click.
;										$MOUSE_WHEELDOWN_EVENT - Wheel mouse button pressed down.
;										$MOUSE_WHEELUP_EVENT - Wheel mouse button up.
;										$MOUSE_WHEELDBLCLK_EVENT - Wheel mouse button double click.
;										$MOUSE_WHEELSCROLL_EVENT - Wheel mouse scroll.
;										$MOUSE_WHEELSCROLLDOWN_EVENT - Wheel mouse scroll *Down*.
;										$MOUSE_WHEELSCROLLUP_EVENT - Wheel mouse scroll *Up*.
;										$MOUSE_XBUTTONDOWN_EVENT - Side mouse button down (usualy navigating next/back buttons).
;										$MOUSE_XBUTTONUP_EVENT - Side mouse button up.
;										$MOUSE_XBUTTONDBLCLK_EVENT - Side mouse button double click.
;
;					$sFuncName 		- [Optional] Function name to call when the event is triggered.
;										If this parameter is empty string (""), the function will *unset* the $iEvent.
;					$sParam1 		- [Optional] First parameter to pass to the event function ($sFuncName).
;					$sParam2 		- [Optional] Second parameter to pass to the event function ($sFuncName).
;					$hTargetWnd 	- [Optional] Window handle to set the event for, e.g the event is set only for this window.
;					$iBlockDefProc 	- [Optional] Defines if the event should be blocked (actualy block the mouse action).
;					
; Return values..:	Success 		- If the event is set in the first time, or when the event is unset properly, the return is 1,
;										if it's set on existing event, the return is 2.
;					Failure 		- Returns 0 on UnSet event mode when there is no set events yet.
; Author.........:	G.Sandler ((Mr)CreatoR, CreatoR's Lab - http://creator-lab.ucoz.ru, http://autoit-script.ru)
; Modified.......:	
; Remarks........:	1) The original events-messages (such as $WM_MOUSEMOVE) can be used as well.
;					2) Blocking of $sFuncName function by window messages with commands
;                     such as "Msgbox()" can lead to unexpected behavior, the return to the system should be as fast as possible!
; Related........:	
; Link...........:	http://www.autoitscript.com/forum/index.php?showtopic=64738
; Example........:	Yes.
; ===============================================================================================================
Func _MouseSetOnEvent($iEvent, $sFuncName = "", $sParam1 = "", $sParam2 = "", $hTargetWnd = 0, $iBlockDefProc = 1)
	If $sFuncName = "" Then ;Unset Event
		If $a__MSOE_Events[0][0] < 1 Then
			Return 0
		EndIf
		
		Local $aTmp_Mouse_Events[1][1]
		
		For $i = 1 To $a__MSOE_Events[0][0]
			If $a__MSOE_Events[$i][0] <> $iEvent Then
				$aTmp_Mouse_Events[0][0] += 1
				ReDim $aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]+1][6]
				
				$aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]][0] = $a__MSOE_Events[$i][0]
				$aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]][1] = $a__MSOE_Events[$i][1]
				$aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]][2] = $a__MSOE_Events[$i][2]
				$aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]][3] = $a__MSOE_Events[$i][3]
				$aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]][4] = $a__MSOE_Events[$i][4]
				$aTmp_Mouse_Events[$aTmp_Mouse_Events[0][0]][5] = $a__MSOE_Events[$i][5]
			EndIf
		Next
		
		$a__MSOE_Events = $aTmp_Mouse_Events
		
		If $a__MSOE_Events[0][0] < 1 Then
			If $i__MSOE_EventReturn = 1 Then
				__MouseSetOnEvent_OnExitFunc()
			ElseIf $i__MSOE_EventReturn = 0 Then
				$i__MSOE_Timer = _Timer_SetTimer(0, 10, "__MouseSetOnEvent_WaitHookReturn")
			EndIf
		EndIf
		
		Return 1
	EndIf
	
	;First event
	If $a__MSOE_Events[0][0] < 1 Then
		$h__MSOE_MouseProc = DllCallbackRegister("__MouseSetOnEvent_MainHandler", "int", "int;ptr;ptr")
		
		Local $hMHook_Module = _WinAPI_GetModuleHandle(0)
		$h__MSOE_MouseHook = _WinAPI_SetWindowsHookEx(Eval("WH_MOUSE_LL"), DllCallbackGetPtr($h__MSOE_MouseProc), $hMHook_Module, 0)
	EndIf
	
	;Search thru events, and if the event already set, we just (re)set the new function and other parameters
	For $i = 1 To $a__MSOE_Events[0][0]
		If $a__MSOE_Events[$i][0] = $iEvent Then
			$a__MSOE_Events[$i][0] = $iEvent
			$a__MSOE_Events[$i][1] = $sFuncName
			$a__MSOE_Events[$i][2] = $sParam1
			$a__MSOE_Events[$i][3] = $sParam2
			$a__MSOE_Events[$i][4] = $hTargetWnd
			$a__MSOE_Events[$i][5] = $iBlockDefProc
			
			Return 2
		EndIf
	Next
	
	$a__MSOE_Events[0][0] += 1
	ReDim $a__MSOE_Events[$a__MSOE_Events[0][0]+1][6]
	
	$a__MSOE_Events[$a__MSOE_Events[0][0]][0] = $iEvent
	$a__MSOE_Events[$a__MSOE_Events[0][0]][1] = $sFuncName
	$a__MSOE_Events[$a__MSOE_Events[0][0]][2] = $sParam1
	$a__MSOE_Events[$a__MSOE_Events[0][0]][3] = $sParam2
	$a__MSOE_Events[$a__MSOE_Events[0][0]][4] = $hTargetWnd
	$a__MSOE_Events[$a__MSOE_Events[0][0]][5] = $iBlockDefProc
	
	Return 1
EndFunc

#EndRegion Public Functions

#Region Internal Functions

Func __MouseSetOnEvent_MainHandler($nCode, $wParam, $lParam)
	If $nCode < 0 Then
		Return _WinAPI_CallNextHookEx($h__MSOE_MouseHook, $nCode, $wParam, $lParam) ;Continue processing
	EndIf
	
	Local Const $stMSLLHOOKSTRUCT = $tagPOINT & ";dword mouseData;dword flags;dword time;ulong_ptr dwExtraInfo"
	Local $iEvent = _WinAPI_LoWord($wParam)
	Local $iRet, $iBlockDefProc_Ret
	
	If $a__MSOE_Events[0][0] < 1 Then
		Return 0
	EndIf
	
	For $i = 1 To $a__MSOE_Events[0][0]
		;Compare with standard event, or with wheel *Scroll* Down and wheel *Scroll* Up events
		If $a__MSOE_Events[$i][0] = $iEvent Or ($iEvent = $MOUSE_WHEELSCROLL_EVENT And ($a__MSOE_Events[$i][0] = $iEvent+8 Or $a__MSOE_Events[$i][0] = $iEvent+16)) Then
			If $iEvent <> $a__MSOE_Events[$i][0] Then
				Local $tWheel_Struct = DllStructCreate($stMSLLHOOKSTRUCT, $lParam)
				Local $sWheelScroll_Data = DllStructGetData($tWheel_Struct, 3)
				
				If _WinAPI_HiWord($sWheelScroll_Data) > 0 Then
					If $iEvent+16 <> $a__MSOE_Events[$i][0] Then
						ContinueLoop ;Scroll Up event, but not matching
					EndIf
				Else
					If $iEvent+8 <> $a__MSOE_Events[$i][0] Then
						ContinueLoop ;Scroll Down event, but not matching
					EndIf
				EndIf
			EndIf
			
			If $a__MSOE_Events[$i][4] <> 0 And Not __MouseSetOnEvent_IsHoveredWnd($a__MSOE_Events[$i][4]) Then
				Return 0 ;Allow default processing
			EndIf
			
			$i__MSOE_EventReturn = 0
			$iBlockDefProc_Ret = $a__MSOE_Events[$i][5]
			
			$iRet = Call($a__MSOE_Events[$i][1], $a__MSOE_Events[$i][2], $a__MSOE_Events[$i][3])
			
			If @error Then
				$iRet = Call($a__MSOE_Events[$i][1], $a__MSOE_Events[$i][2])
			EndIf
			
			If @error Then
				$iRet = Call($a__MSOE_Events[$i][1])
			EndIf
			
			$i__MSOE_EventReturn = 1
			
			If $iBlockDefProc_Ret = -1 Then
				Return $iRet
			EndIf
			
			Return $iBlockDefProc_Ret ;Block default processing (or not :))
		EndIf
	Next
	
	Return _WinAPI_CallNextHookEx($h__MSOE_MouseHook, $nCode, $wParam, $lParam) ;Continue processing
EndFunc

Func __MouseSetOnEvent_WaitHookReturn($hWnd, $Msg, $iIDTimer, $dwTime)
	If $i__MSOE_EventReturn = 1 Then
		_Timer_KillTimer(0, $i__MSOE_Timer)
		__MouseSetOnEvent_OnExitFunc()
	EndIf
EndFunc

Func __MouseSetOnEvent_IsHoveredWnd($hWnd)
	Local $iRet = False
	
	Local $aWin_Pos = WinGetPos($hWnd)
	Local $aMouse_Pos = MouseGetPos()
	
	If $aMouse_Pos[0] >= $aWin_Pos[0] And $aMouse_Pos[0] <= ($aWin_Pos[0] + $aWin_Pos[2]) And _
		$aMouse_Pos[1] >= $aWin_Pos[1] And $aMouse_Pos[1] <= ($aWin_Pos[1] + $aWin_Pos[3]) Then
		$iRet = True
	EndIf
	
	Local $aRet = DllCall("User32.dll", "hwnd", "WindowFromPoint", "long", $aMouse_Pos[0], "long", $aMouse_Pos[1])
	
	If HWnd($aRet[0]) <> $hWnd And Not $iRet Then
		$iRet = False
	EndIf
	
	Return $iRet
EndFunc

Func __MouseSetOnEvent_OnExitFunc()
	If $h__MSOE_MouseHook <> -1 Then
		_WinAPI_UnhookWindowsHookEx($h__MSOE_MouseHook)
		$h__MSOE_MouseHook = -1
	EndIf
	
	If $h__MSOE_MouseProc <> -1 Then
		DllCallbackFree($h__MSOE_MouseProc)
		$h__MSOE_MouseProc = -1
	EndIf
EndFunc

#EndRegion Internal Functions
