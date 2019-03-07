if (global.game_pause) || (global.cutscene_current != -1){
	path_speed = 0;
}else{
	path_speed = spd;
}

image_xscale = facing * scale;

if (room == rm_level_5_03){
	if (y >= 664){
		image_xscale = -scale;
	}
}

if (path_started){
	sprite_index = spr_prisoner_walk_0;
	image_speed = 0.22;
}else{
	sprite_index = spr_prisoner_idle_0;
	image_speed = 0;
}