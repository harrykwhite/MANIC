/// @param amount
var amount = argument0;

obj_controller_camera.camera_screenshake = true;
obj_controller_camera.camera_screenshake_amount = amount * (global.game_option[| Options.Screenshake] / 100) * 2;