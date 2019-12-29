if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var inst = other;

with(owner){
	if (object_index == obj_companion_0){
		return;
	}
	
	if (object_index != obj_player){
		if (!inst.damage_companion){
			return;
		}
	}

	poison = true;
}