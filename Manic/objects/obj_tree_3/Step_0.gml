if (fire){
	sprite_index = spr_tree_3_fire;
	
	if (mylight == noone){
		mylight = instance_create_layer(x, y, "Lights", obj_tree_3_light);
	}
	
	mylight.x = x;
	mylight.y = y;
	mylight.light[| eLight.X] = x;
	mylight.light[| eLight.Y] = y;
	mylight.light[| eLight.LutIntensity] = 1.45;
	mylight.light[| eLight.Flags] |= eLightFlags.Dirty;
	
	if (global.game_pause){
		image_speed = 0;
		exit;
	}else{
		image_speed = 1;
	}
}