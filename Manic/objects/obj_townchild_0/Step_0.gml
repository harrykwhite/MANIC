if (global.game_pause){
	image_speed = 0;
	return;
}

// Sprite
sprite_index = spr_townchild_0_idle_0;
image_speed = 0.05;

if (instance_exists(obj_player)){
	if (obj_player.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
	
	image_yscale = scale;
}