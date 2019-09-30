if (!checked){
	if (global.level_current == Level.WinterTown) || ((global.level_current == Level.TrainStation) && (room != rm_level_6_02 || x < 174)){
		if (sprite_index != spr_fence_4_snow){
			sprite_index = spr_fence_4_snow;
			image_index = random(image_number);
		}
	}
	
	checked = true;
}