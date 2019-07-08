var inst = other;

with(owner){
	if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) || (object_index == obj_enemy_3){
		if (cutscene_prop){
			return;
		}
	}

	if (inst.time > 2) && (inst.damage_enemy){
		inst.explode = true;
		inst.spd = 0;
	
		if (inst.creator == obj_player){
			scr_mouse_cross();
		}
	}
}