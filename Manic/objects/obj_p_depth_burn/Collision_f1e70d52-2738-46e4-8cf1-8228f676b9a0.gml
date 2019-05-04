if (!other.enemy){
	return;
}

if (object_index == obj_player){
	if (!other.enemy){
		return;
	}
}

if (object_index == obj_enemy_0){
	if (other.enemy){
		return;
	}
}

burn = true;