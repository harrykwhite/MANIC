if (!other.enemy){
	exit;
}

if (object_index == obj_player){
	if (!other.enemy){
		exit;
	}
}

if (object_index == obj_enemy_0){
	if (other.enemy){
		exit;
	}
}

burn = true;