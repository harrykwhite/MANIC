if (!instance_exists(obj_player)){
    instance_create(-100, -100, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

if (global.game_level_opening_type == 0){
	var train = instance_create(-170, 224, obj_pawn_other_train_1);
	train.component_spawn = true;
	obj_player.x = -100;
	obj_player.y = -100;
}

if (global.game_level_opening_type == 1){
	obj_player.x = room_width + 4;
	obj_player.y = 232;
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

scr_room_spawn_companion();

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}

instance_activate_all();