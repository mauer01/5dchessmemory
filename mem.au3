#RequireAdmi
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <KDMemory.au3>
#include <5dchessmemadresses.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Func load()
	Global $name = ProcessExists("5dchesswithmultiversetimetravel.exe")
	If $name = 1 Then
		return SetError(1)
	EndIf
	Global $handles = _KDMemory_OpenProcess($name)
	$error = @error
	if $error Then
		return SetError($error, 1)
	EndIf
	OnAutoItExitRegister("myexit")
	$base = _KDMemory_GetModuleBaseAddress($handles, "5dchesswithmultiversetimetravel.exe")
	if @error Then
		return SetError(2)
	EndIf
	varsload($base)
EndFunc
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Memory", 255, 102, 198, 315)
$cb_undomove = GUICtrlCreateCheckbox("undo move", 8, 8, 97, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Checkbox1", 8, 32, 97, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Checkbox2", 8, 56, 97, 17)
$Checkbox3 = GUICtrlCreateCheckbox("Checkbox3", 8, 80, 97, 17)
$B_resumegame = GUICtrlCreateButton("resume game", 144, 8, 97, 17)
$Checkbox5 = GUICtrlCreateCheckbox("Checkbox5", 144, 32, 97, 17)
$Checkbox6 = GUICtrlCreateCheckbox("Checkbox6", 144, 56, 97, 17)
$B_Load = GUICtrlCreateButton("Loadup", 144, 80, 97, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
load()
If @error = 0 Then
	GUICtrlSetState($B_Load,128)
	GUICtrlSetData($B_Load,"loaded")
EndIf

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $cb_undomove
			if GUICtrlRead($cb_undomove) = $GUI_CHECKED Then
				_KDMemory_WriteProcessMemory($handles,$undomovereducedbyadress,"BYTE",0)
			Else
				_KDMemory_WriteProcessMemory($handles,$undomovereducedbyadress,"BYTE",0xFF)
			EndIf
		Case $B_resumegame
			_KDMemory_WriteProcessMemory($handles,$finishgamebutton,"BYTE",0)
			_KDMemory_WriteProcessMemory($handles,$endofgamedescription,"BYTE",0)

		Case $B_Load
			load()
			If @error Then
				MsgBox(0,@error,"something went wrong")
			Else
				GUICtrlSetState($B_Load,128)
				GUICtrlSetData($B_Load,"loaded")
			EndIf
			If GUICtrlRead($cb_undomove) = $GUI_CHECKED Then
				_KDMemory_WriteProcessMemory($handles,$undomovereducedbyadress,"BYTE",0)
			EndIf

	EndSwitch

	if ((not ProcessExists($name)) and GUICtrlGetState($B_Load) = 144) Then
		_KDMemory_CloseHandles($handles)
		GUICtrlSetState($B_Load,64)
	EndIf
WEnd

Func myexit()
	_KDMemory_CloseHandles($handles)
EndFunc