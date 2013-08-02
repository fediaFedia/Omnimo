#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Example()

; Simple example: Embedding an Internet Explorer Object inside an AutoIt GUI
;
; See also: <a href='http://msdn.microsoft.com/workshop/browser/webbrowser/reference/objects/internetexplorer.asp' class='bbc_url' title='External link' rel='nofollow external'>http://msdn.microsoft.com/workshop/browser/webbrowser/reference/objects/internetexplorer.asp</a>
Func Example()
    Local $oIE, $GUIActiveX, $GUI_Button_Back, $GUI_Button_Forward
    Local $GUI_Button_Home, $GUI_Button_Stop, $msg
    
    $oIE = ObjCreate("Shell.Explorer.2")

    ; Create a simple GUI for our output
    GUICreate("Omnimo Information Hub", 640, 400, -1, -1, BitOR($ws_maximizebox, $ws_sizebox, $ws_clipchildren))
   GUISetBkColor(0x000000)
    $GUIActiveX = GUICtrlCreateObj ($oIE, 0, 0, 640, 400)

GUICtrlSetResizing(-1, $gui_dockborders)
   GUISetBkColor(0x000000)

    GUISetState(-1, $GUI_FOCUS)       ;Show GUI
	
   GUISetBkColor(0x000000)
    $oIE.navigate("Http://fediafedia.com/neo")

    ; Waiting for user to close the window
    While 1
        $msg = GUIGetMsg()

        Select
            Case $msg = $GUI_EVENT_CLOSE
                ExitLoop
        EndSelect
        
    WEnd

    GUIDelete()
EndFunc   ;==>Example