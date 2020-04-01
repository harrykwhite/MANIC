if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var inst = other;

with(owner){
	if (object_index == obj_player){
		if (state == scr_player_dash){
			return;
		}
	}
	
	if (string_pos("obj_companion_", object_get_name(object_index)) != 0){
		return;
	}

	if (inst.enemy){
		inst.explode = true;
		inst.spd = 0;
	}
}