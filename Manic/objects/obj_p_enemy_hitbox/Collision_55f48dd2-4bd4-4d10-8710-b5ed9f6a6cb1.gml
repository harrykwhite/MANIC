var inst = other;

with(owner){
	if (cutscene_prop){
		return;
	}

	if (inst.spd <= 0.05) && (inst.damage_enemy){
		inst.explode = true;
		inst.spd = 0;
	
		if (inst.creator == obj_player){
			scr_mouse_cross();
		}
	}
}