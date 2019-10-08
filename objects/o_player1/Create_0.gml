/// @description handles sprite setting for player one

//definitions

//sprite array
p1spr = [];
/* LAYOUT:
	[0]:LEFT
	[1]:RIGHT
	[2]:JUMP/UP
	[3]:DUCK/DOWN
	[4]:IDLE
*/
p1doGrav = undefined

//  default momentum on creation
hsp = 0;
vsp = 0;

//current player character
global.p1c = "menupointer";
