///@param time
var time = 2;

if (argument_count == 1){
	time = argument[0];
}

obj_controller_camera.camera_move_to_player = true;
obj_controller_camera.camera_move_to_player_time = time;