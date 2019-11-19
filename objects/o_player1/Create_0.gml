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
	[5]:LEFT JUMP
	[6]:RIGHT JUMP
	[7]:RIGHT STARTUP RUN
	[8]:RIGHT IDLE RUN
	[9]:LEFT STARTUP RUN
	[10]:LEFT IDLE RUN
*/
p1vars = [];
/*LAYOUT:
	[0]Jump height
	[1]Gravity 
	[2]Move speed
	[3]Movement style {1:classic | 2:skate | 3:swimming (WIP, TEST ONLY) | 4:flying}
	[4]Max speed
*/

//  default momentum on creation
hsp = 0;
vsp = 0;

//current player character
global.p1c = "menupointer";
//global.p1dir = 0; //useless??? idk what it does so im commenting it out

//janky shit
kR=0;
kL=0;
kU=0;
kD=0;
hsp=0;
vsp=0;