if (i_time < 1) && (other.owner == obj_player){
	if (object_index == obj_player){
		if (scr_player_has_upgrade(PlayerUpgrade.GasMask)){
			return;
		}
	}
	
	poison = true;
}