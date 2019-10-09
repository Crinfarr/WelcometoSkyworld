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
p1vars = [];
/*LAYOUT:
	[0]Jump height
	[1]Gravity 
		~ uses operators to set doGrav variables
	[2]Move speed
*/
p1doGrav = undefined

//  default momentum on creation
hsp = 0;
vsp = 0;

//current player character
global.p1c = "menupointer";
global.p1dir = 0;