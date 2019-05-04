if (object_index == obj_player){
	if (state == scr_player_dash){
		return;
	}
}

if (other.enemy){
	other.explode = true;
	other.spd = 0;
}