if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var inst = other;

with(owner){
	if (cutscene_prop){
		return;
	}

	if (inst.time > 2) && (inst.damage_enemy){
		inst.explode = true;
		inst.spd = 0;
	
		if (inst.creator == obj_player){
			scr_mouse_cross();
		}
	}
}