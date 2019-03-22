if (instance_exists(obj_player)){
	if (place_meeting(x + 1, y + 1, obj_player)){
		global.game_combat_active = false;
	}else if (global.cutscene_current == -1){
		instance_destroy();
	}
}