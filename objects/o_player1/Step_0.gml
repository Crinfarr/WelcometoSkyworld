/// @description handles movement (P1)

//checks movement keys
kL = keyboard_check(vk_left);
kR = keyboard_check(vk_right);
kU = keyboard_check(vk_up);
kD = keyboard_check(vk_down);

//changes stats based on character
switch global.p1c {
	case "menupointer":
		p1spr = [
			s_player1, //left
			s_player1, //right
			s_player1, //up
			s_player1, //down
			s_player1] //idle
		p1doGrav = false; //no gravity
		break;
	case "YuB" :
		p1spr = [
			s_YuB_WalkLeft, //left
			s_YuB_WalkRight, //right
			s_YuB_Jump, //up {{TODO: Draw sprite}}
			undefined, //down {{TODO: Make duck sprite and object}}
			s_YuB_idle] //idle
		p1doGrav = true;
		break;
}

var mX = kR-kL;
var mY = kU-kD;

if (place_meeting(x,y+1, o_colliderBlock) and kU and p1doGrav) {
	
}