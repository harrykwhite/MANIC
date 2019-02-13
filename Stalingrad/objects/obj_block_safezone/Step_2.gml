if (instance_exists(global.player)){
	if (place_meeting(x + 1, y + 1, global.player)){
		global.game_combat_active = false;
	}else if (global.cutscene_current == -1){
		instance_destroy();
	}
}