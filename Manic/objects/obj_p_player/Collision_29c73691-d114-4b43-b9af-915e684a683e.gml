if (object_index == obj_companion_0){
	return;
}

if (object_index != obj_player){
	if (!other.damage_companion){
		return;
	}
}else{
	if (scr_player_has_upgrade(PlayerUpgrade.GasMask)){
		return;
	}
}

poison = true;