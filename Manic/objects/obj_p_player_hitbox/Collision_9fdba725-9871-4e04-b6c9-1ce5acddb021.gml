var inst = other;

with(owner){
	if (object_index == obj_companion_0) || (object_index == obj_companion_1) || (object_index == obj_companion_2) || (object_index == obj_companion_3){
		return;
	}

	if (object_index == obj_player){
		if (state == scr_player_dash){
			return;
		}
	}

	if (inst.enemy){
		inst.explode = true;
		inst.spd = 0;
	}
}