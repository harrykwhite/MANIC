if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) || (object_index == obj_enemy_3){
	if (cutscene_prop){
		return;
	}
}

if (other.time > 2) && (other.damage_enemy){
	other.explode = true;
	other.spd = 0;
	
	if (other.creator == obj_player){
		scr_mouse_cross();
	}
}