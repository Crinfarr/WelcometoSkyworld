/// @description handles movement (P1)

//changes stats based on character


switch global.p1c {
	case "menupointer":
		p1spr = [
			s_player1, //left
			s_player1, //right
			s_player1, //up
			s_player1, //down
			s_player1, //idle
			null,//n/a
			null,//n/a
			null,//n/a
			null,//n/a
			null//n/a
			]; 
		p1vars = [
			0,//no jumping
			0,//no gravity
			5,//medium speed
			1,//flight type
			15//high max speed
		]; 
	break;
	case "YuB" :
		p1spr = [
			null, 
			null, 
			s_YuB_JumpStill, //up {{TODO: Draw sprite}}
			null, //down {{TODO: Make duck sprite }}
			s_YuB_idle,//idle
			s_YuB_JumpLeft,//jump left
			s_YuB_JumpRight,//jump right
			s_YuB_walkRight_start,//push right
			s_YuB_walkRight_idle,//idle, moving right
			s_YuB_walkLeft_start,//push left
			s_YuB_walkLeft_idle//idle, moving left
			];
		p1vars = [
			5,//medium jump
			0.3,//mid-low gravity
			0.5,//low speed, but accelerates
			2,//skate type
			10//medium max speed
		];
	break;
	case "Waterflame":
		p1spr = [
			null,//TODO left
			null,//TODO right
			null,//TODO up
			null,//TODO down
			s_WF_Idle,//idle
			null,
			null,
			null,
			null,
			null,
			null,
		];
		p1vars = [
			3,//low jump
			1,//EXTREMEY low gravity
			3,//average speed
			1,//classic type
			10//maxspeed should not matter
			
		];
	break;
}

//edits controls
switch(p1vars[3]) {
	case 1: //hoppy boy
		kR = keyboard_check(vk_right);
		kL = keyboard_check(vk_left);
		kU = keyboard_check_pressed(vk_up);
		kD = keyboard_check(vk_down);
		break;
	case 2: //rolly boy
		kR = keyboard_check_pressed(vk_right);
		kL = keyboard_check_pressed(vk_left);
		kU = keyboard_check_pressed(vk_up);
		kD = keyboard_check(vk_down);
		break;
	case 3: //swimmy boy
		kR = keyboard_check(vk_right);
		kL = keyboard_check(vk_left);
		kU = keyboard_check_pressed(vk_up);
		kD = keyboard_check(vk_down);
		break;
	case 4: //flappy boy
		kR = keyboard_check(vk_right);
		kL = keyboard_check(vk_left);
		kU = keyboard_check(vk_up);
		kD = keyboard_check(vk_down);
		break;
}
var mX = kR-kL;//move on X? if so, left or right?
var mY = kD-kU;//move on Y? if so, up or down? ((USED ONLY IN FLIGHT MODE))

if (p1vars[3] != 4) {
	hsp = mX*(p1vars[2]/2);
	vsp = (p1vars[1]/10)+vsp;
}
else {
	hsp = (p1vars[2]/2)*mX;
	vsp = (p1vars[2]/2)*mY;
}


if (place_meeting(x,y+1, o_colliderBlock) and kU and (p1vars[3] == (1 or 2))) {//basic jumping
	vsp = mY-p1vars[0];
}

if (place_meeting(x, y+vsp, o_colliderBlock)) { //vertical collision
	while (!place_meeting(x, y+sign(vsp), o_colliderBlock)) {
		y+=sign(vsp);
	}
	vsp = 0;
}

if (place_meeting(x+hsp, y, o_colliderBlock)) { //horizontal collision
	while (!place_meeting(x+sign(hsp), y, o_colliderBlock)) {
		x+=sign(hsp);
	}
	hsp = 0;
}

if (hsp >= p1vars[4] and p1vars[3] == 2) { //cap velocity
	hsp = p1vars[3]*mX;
}

switch(sign(hsp)){
	case 0:
		sprite_index = p1spr[4];
	break;
	case 1:
		sprite_index = p1spr[1];
	break;
	case -1:
		sprite_index = p1spr[0];
	break;
}
switch(sign(vsp)) {
	case 0:
	break;
	case 1:
	break;
	case -1:
	break;
}
//apply velocity 
//NEVER EDIT BELOW THIS LINE
x += hsp;
y += vsp;