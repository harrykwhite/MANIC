if (!checked){
	if (global.game_is_playthrough) || (room == rm_prologue_00){
		if (global.level_collectable_found[# 0, listnum]){
			instance_destroy();
		}
	}
	
	checked = true;
}