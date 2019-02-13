if (object_index == obj_enemy_0){
	if (grenadier_cutscene_prop) || (crazy_cutscene_prop) || (sniper_cutscene_prop) || (fly_cutscene_prop) || (healer_cutscene_prop){
		exit;
	}
}

if (object_index == obj_enemy_2) ||  (object_index == obj_thedogkeeper_dog) || (object_index == obj_thescorched) || (object_index == obj_thedogkeeper){
	if (cutscene_prop){
		exit;
	}
}

poison = true;