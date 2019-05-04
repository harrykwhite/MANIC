if (!instance_exists(obj_player)){
    instance_create(463, 13, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

if (global.game_level_opening_type == 1){
	var train = instance_create(-353, 117, obj_pawn_other_train_1);
	train.component_spawn = true;
	obj_player.x = -100;
	obj_player.y = -100;
}

if (global.game_level_opening_type == 2){
	obj_player.y = room_height + 4;
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

scr_room_spawn_companion();

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}

instance_activate_all();