if (object_index != obj_player){
	if (!other.damage_companion){
		return;
	}
}else{
	if (state == scr_player_dash){
		return;
	}
}

if (other.time > 2) && (!other.damage_enemy){
	other.explode = true;
	other.spd = 0;
}