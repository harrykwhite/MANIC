if (!instance_exists(obj_player)){
    instance_create(1146, room_height + 4, obj_player);
}

global.player_footstep_default = snd_character_footstep_wood;

if (global.game_level_opening_type == 1){
	obj_player.x = -4;
	obj_player.y = 432;
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

if (global.player_companion != -1){
	var comp = instance_create(obj_player.x - 20, obj_player.y + 20, global.companion[global.player_companion]);
	if (global.player_companion_health != -1){
		comp.health_current = global.player_companion_health;
	}
}

scr_effect_flash(1, 0.0125, c_black);

while(!instance_exists(obj_controller_mouse)){
    instance_create(mouse_x, mouse_y, obj_controller_mouse);
}

instance_activate_all();