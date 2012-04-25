#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Made for Omnimo UI
#AutoIt3Wrapper_Res_Description=Made for Omnimo UI
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstants.au3>
#include <IE.au3>
$GUI = GUICreate("Omnimo Information Hub", 515, 460)
 GUISetBkColor(0x7A7A7A)
$object = ObjCreate("Shell.Explorer.2")
$object_ctrl = GUICtrlCreateObj($object, 0, 30, 515, 460)

$back_button = GUICtrlCreateButton("Back", 5, 5, 50, 20, 0) ; Creats Back GUI
_IENavigate($object, "http://omnimo4.netau.net/omnimohub.php?version=5.0&from=firstrun")
GUISetState()

While 1
    $msg = GUIGetMsg()
    Select
    Case $msg = $back_button ; Send browser to previous page
        $Object.GoBack
    Case $msg = $GUI_EVENT_CLOSE
        Exit
    EndSelect
WEnd
