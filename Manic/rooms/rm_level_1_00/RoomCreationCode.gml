if (!instance_exists(obj_player)){
    instance_create(572, 30, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

if (global.game_level_opening_type == 1){
	obj_player.y = room_height - 30;
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = room_height - 192;
}

if (global.game_level_opening_type == 2){
	var train = instance_create_layer(-115, 1984, "Trains", obj_pawn_other_train_1);
	train.component_spawn = true;
	obj_player.x = -100;
	obj_player.y = -100;
}

scr_room_spawn_companion();

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}