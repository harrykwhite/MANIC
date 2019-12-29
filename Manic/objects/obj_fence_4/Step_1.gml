if (!checked){
	// Create sides
	var xx = x;
	var yy = y + 16;
	
	while(!place_meeting(xx + 4, yy, obj_fence_5) && !place_meeting(xx, yy, obj_fence_6) && inroom(xx, yy)){
		instance_create_layer(xx, yy, layer, obj_fence_2);
		yy += 16;
	}
	
	// Update sprite
	if (global.level_current == Level.WinterTown) || ((global.level_current == Level.TrainStation) && (room != rm_level_6_02 || x < 174)){
		if (sprite_index != spr_fence_4_snow){
			sprite_index = spr_fence_4_snow;
			image_index = random(image_number);
		}
	}
	
	checked = true;
}