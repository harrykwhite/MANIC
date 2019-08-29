if (!instance_exists(obj_player)){
    instance_create(446, room_height + 4, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

if (global.game_level_opening_type == 1){
	obj_player.x = 1382;
	obj_player.y = -4;
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

scr_room_spawn_companion();

while(!instance_exists(obj_controller_mouse)){
    instance_create(scr_input_get_mouse_x(), 
	scr_input_get_mouse_y(), obj_controller_mouse);
}


instance_activate_all();
