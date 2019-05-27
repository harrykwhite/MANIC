if (global.game_pause){
	image_speed = 0;
	exit;
}

sprite_index = spr_townperson_1_idle_0;
image_speed = 0.02;

if (instance_exists(obj_player)){
	if (obj_player.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
	
	image_yscale = scale;
}