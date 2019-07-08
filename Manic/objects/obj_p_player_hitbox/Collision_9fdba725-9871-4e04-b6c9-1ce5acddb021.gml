var inst = other;

with(owner){
	if (object_index == obj_companion_0){
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