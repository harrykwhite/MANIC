if (object_index != obj_player){
	if (!other.damage_companion){
		exit;
	}
}else{
	if (scr_player_has_upgrade(PlayerUpgrade.GasMask)){
		exit;
	}
}

poison = true;