if (object_index == obj_companion_0){
	return;
}

if (object_index != obj_player){
	if (!other.damage_companion){
		return;
	}
}else{
	if (upgrade_has[PlayerUpgrade.GasMask]){
		return;
	}
}

poison = true;