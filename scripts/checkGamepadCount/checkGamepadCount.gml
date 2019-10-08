///@description checks all devices for connected controllers. NOT IMPLEMENTED
global.gpc = [];
var gp_num = gamepad_get_device_count();
for (var i=0; i <= gp_num; i++;) {
	if (gamepad_is_connected(i)) {
		global.gpc[i] = true;
	}
	else {
		global.gpc[i] = false;
	}
}