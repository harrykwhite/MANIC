if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) || (object_index == obj_enemy_3){
	if (cutscene_prop){
		exit;
	}
}

if (other.time > 2) && (other.damage_enemy){
	other.explode = true;
	other.spd = 0;
}