if (!instance_exists(obj_player)) || (instance_number(object_index) > 1){
    instance_destroy();
}else{
    if (obj_player.image_xscale == 1){
        image_yscale = 1;
    }else{
        image_yscale = -1;
    }
}

// Positioning and Visibility
if (instance_exists(obj_player)){
    
    // Position
	if (!global.game_pause){
	    image_angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y) + attack_range_current;
	    
		if (start_offset > 0){
			start_offset = approach(start_offset, 0, 40);
		}
		
	    if (mouse_x > x){
	        image_yscale = 1;
			image_angle += start_offset;
	    }else{
	        image_yscale = -1;
			image_angle -= start_offset;
	    }
    
	    // Arm
	    if (instance_exists(obj_player_arm)){
	        obj_player_arm.x = obj_player_arm.x + lengthdir_x(attack_offset, image_angle);
	        obj_player_arm.y = obj_player_arm.y + lengthdir_y(attack_offset, image_angle);
			image_alpha = obj_player_arm.image_alpha;
	    }
	}
}

