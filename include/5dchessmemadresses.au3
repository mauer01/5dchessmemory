#include-once

Func varsload($base)
	Global $ptrfirstboard = 0x146B48 + $base
	Global $undomovecount = $ptrfirstboard + 0x150
	Global $undomovereducedbyadress = $ptrfirstboard - 0xE8A23
	Global $endofgamedescription = $ptrfirstboard + 0xD0
	Global $finishgamebutton = $ptrfirstboard + 0xC8
	Global $somepropertythatchangesattheendofgame = $ptrfirstboard + 0xD4
	Global $backgroundcolor = $ptrfirstboard + 0x3DC
EndFunc



#cs
	$endofgame description
	0 = no description
	1 = you win/lose depending on if white won or black won. (or puzzle complete depending on some other vars)
	2 = draw
	3 = you have disconnected
	4 = puzzle incomplete

	$finishgamebutton
		0 = not active
		1-255 = active

	$somepropertythatchangesattheendofgame not sure yet

	$backgroundcolor seems to for now just be working with specific color codes, not sure yet why
#ce
