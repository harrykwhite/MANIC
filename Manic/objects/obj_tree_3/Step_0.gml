if (fire){
	if (global.game_pause){
		image_speed = 0;
		return;
	}else{
		image_speed = 1;
	}
		
	scr_env_burn_effects(0, 0, 20, 40, 250);
	
	sprite_index = spr_tree_3_fire;
	
	if (!instance_exists(mylight)){
		mylight = instance_create_layer(x, y, "Lights", obj_tree_3_light);
	}
	
	mylight.x = x;
	mylight.y = y;
	mylight.light[| eLight.X] = x;
	mylight.light[| eLight.Y] = y;
	mylight.light[| eLight.LutIntensity] = 1.45;
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
}else{
	if (sprite_index != spr_tree_3){
		sprite_index = spr_tree_3;
		image_speed = 0;
		image_index = random(image_number);
	}
}